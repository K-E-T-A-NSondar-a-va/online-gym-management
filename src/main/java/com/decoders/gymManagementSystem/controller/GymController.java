package com.decoders.gymManagementSystem.controller;

import java.security.Principal;
import java.util.List;

import org.apache.logging.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.decoders.gymManagementSystem.bean.Feedback;
import com.decoders.gymManagementSystem.bean.GymBook;
import com.decoders.gymManagementSystem.bean.GymItem;
import com.decoders.gymManagementSystem.bean.GymUser;
import com.decoders.gymManagementSystem.bean.Item;
import com.decoders.gymManagementSystem.bean.Slot;
import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;
import com.decoders.gymManagementSystem.dao.FeedbackDao;
import com.decoders.gymManagementSystem.dao.GymBookDao;
import com.decoders.gymManagementSystem.dao.GymItemDao;
import com.decoders.gymManagementSystem.dao.GymUserRepository;
import com.decoders.gymManagementSystem.dao.SlotDao;
import com.decoders.gymManagementSystem.dao.SlotDaoImpl;
import com.decoders.gymManagementSystem.dao.SlotItemDao;
import com.decoders.gymManagementSystem.dao.SlotItemDaoImpl;
import com.decoders.gymManagementSystem.dao.SlotItemRepository;
import com.decoders.gymManagementSystem.dao.SlotRepository;
import com.decoders.gymManagementSystem.exception.BookingExistsException;
import com.decoders.gymManagementSystem.exception.SeatNotAvailableException;
import com.decoders.gymManagementSystem.service.GymItemService;
import com.decoders.gymManagementSystem.service.GymUserService;

@RestController
public class GymController {

	@Autowired
	private GymItemDao gymItemDao;

	@Autowired
	private GymUserService gymUserService;

	@Autowired
	private SlotItemRepository slotItemRepository;
	
	@Autowired
	private SlotItemDao slotItemDao;

	@Autowired
	private GymItemService gymItemService;
	
	@Autowired
	private GymUserService userService;
	
	@Autowired
	private SlotDao slotDao;
	
	@Autowired
	private GymBookDao gymBookDao;
	
	@Autowired
	private FeedbackDao feedbackDao;
	
	@Autowired
	private GymUserRepository gymUserRepository;
	
	
	
	public GymController() {
		// TODO Auto-generated constructor stub
	}

	private final org.slf4j.Logger logger = LoggerFactory.getLogger(GymController.class);

	@GetMapping("/")
	public ModelAndView indexPageRouting1() {
		return new ModelAndView("index");
	}

	@GetMapping("/index")
	public ModelAndView indexPageRouting2() {
		String userType = userService.getType();
		
		ModelAndView mv = null;
		if(userType.equalsIgnoreCase("Admin")) {
			mv = new ModelAndView("controlPanel");
		}
		else if(userType.equalsIgnoreCase("Customer")) {
			mv = new ModelAndView("index2");
			mv.addObject("slotList", slotDao.displayAllSlot());
		}
			
		return mv;
	}

	
	@GetMapping("/gymitem")
	public ModelAndView showItemEntryPage() {
		GymItem gymItem = new GymItem();
		ModelAndView mv = new ModelAndView("gymItemEntryPage");
		mv.addObject("itemRecord", gymItem);
		return mv;
	}

	@PostMapping("/gymitem")
	public ModelAndView saveItem(@ModelAttribute("itemRecord") GymItem gymItem) {
		gymItemDao.saveNewItem(gymItem);
		return new ModelAndView("gymItemReportPage");
	}

	@GetMapping("/gymitems")
	public ModelAndView showItemReportPage() {
		List<GymItem> itemList = gymItemDao.displayAllItem();
		ModelAndView mv = new ModelAndView("gymItemReportPage");
		mv.addObject("itemList", itemList);

		return mv;
	}

	@GetMapping("/add-slot")
	public ModelAndView showSlotEntryPage() {
		Slot slot = new Slot();
		ModelAndView mv = new ModelAndView("slotEntryPage");
		mv.addObject("slotRecord", slot);
		return mv;
	}

	@PostMapping("/slot")
	public ModelAndView saveSlot(@ModelAttribute("slotRecord") Slot slot) {
		slotDao.saveNewSLot(slot);

		List<GymItem> itemList = gymItemDao.displayAllItem();

		for (GymItem item : itemList) {
			SlotItemEmbed embeddedId = new SlotItemEmbed(slot.getSlotId(), item.getItemId());
			SlotItem slotItem = new SlotItem(embeddedId);
			slotItemDao.saveSlotItem(slotItem);
		}

		return new ModelAndView("controlPanel");
	}

	@GetMapping("/slots")
	public ModelAndView showSlotReport() {
		List<Slot> slotList = slotDao.displayAllSlot();
		ModelAndView mv = new ModelAndView("slotReport");
		mv.addObject("slotList", slotList);

		return mv;
	}

	@GetMapping("/slot-show/{slotId}")
	public ModelAndView showSlotBookingInteface(@PathVariable("slotId") Long slotId) {

		String userType = userService.getType();
		
		Slot slot = slotDao.findSlotById(slotId);
		List<Item> itemList = gymItemService.gymItemList(slotId);
		
		ModelAndView mv = null;
		
		if(userType.equalsIgnoreCase("Admin")) {
			mv = new ModelAndView("slotBookingAdmin");
			List<String> customerList = gymUserService.getAllCustomerUsers();
			mv.addObject("customerList", customerList);
		} 
		else if(userType.equalsIgnoreCase("Customer")) {
			mv = new ModelAndView("slotBookingCustomer");
		}

		mv.addObject("itemList", itemList);
		mv.addObject("slot", slot);

		return mv;
	}

	@GetMapping("/slot-booking")
	public ModelAndView showSeatBookingPage() {
		return new ModelAndView("slotBooking");
	}

	
	 @PostMapping("/book-slot") 
	 public ModelAndView bookTheSlot(@RequestParam("slotId") Long slotId, @RequestParam("itemId") Long itemId, @RequestParam("username") String username) throws SeatNotAvailableException, BookingExistsException{		 
		 
		 SlotItemEmbed embed = new SlotItemEmbed(slotId, itemId);
		 SlotItem slotItem = slotItemDao.getSlotItemById(embed);
		 GymItem gymItem = gymItemDao.findItemById(itemId);
		 Slot slot = slotDao.findSlotById(slotId);
		 
		 if(gymBookDao.isBookingExists(slotId, itemId, username)) 
			 throw new BookingExistsException(gymItem.getItemName()+" is already booked with "+slot.getSlotTime()+" slot, book another slot !!");
		 
		 GymBook gymBook = new GymBook();
		 gymBook.setItemId(itemId);
		 gymBook.setSlotId(slotId);
		 
		 if(username.equals("0")) {
			 gymBook.setUsername(gymUserService.getUser().getUsername());
		 } else {
			 gymBook.setUsername(username);
		 }
		 
		 int seatAvailable = gymItem.getTotalSeat() - slotItem.getSeatBooked();
		 
		 if(seatAvailable > 0) {
			 slotItem.setSeatBooked(slotItem.getSeatBooked() + 1);
			 slotItemDao.saveSlotItem(slotItem);
		 } else {
			 throw new SeatNotAvailableException("Seat not available for the selected slot, book other slot !");
		 }
		 
		 gymBookDao.save(gymBook);
		 
		 ModelAndView mv = new ModelAndView("confirmPage");
		 mv.addObject("msg", "congratulations ! your slot has beed booked !!");
		 return mv;
	 }
	 
	 
	@GetMapping("/get-name")
	public ResponseEntity<String> getFullName(Principal principal) {
//		logger.info(principal.getName());
		return ResponseEntity.ok(gymUserService.getName(principal));
	}
	
	@GetMapping("/slot-item-add/{id}")
	public ModelAndView saveItemSlots(@PathVariable Long id) {
		gymItemService.addNewItemToSlots(id);
		return new ModelAndView("controlPanel");
	}
	
	@GetMapping("/bookings")
	public ModelAndView showCurrentBookings() {
		List<GymBook> bookList = gymBookDao.getBookList();
		
		ModelAndView mv = null;
		if(gymUserService.getType().equalsIgnoreCase("Customer")) {
			String username = gymUserService.getUser().getUsername();
			bookList = bookList.stream().filter(gymBook -> gymBook.getUsername().equals(username)).toList();
			mv = new ModelAndView("BookingReportCustomer");
			mv.addObject("bookList", bookList);
			return mv;
		}
		
		mv = new ModelAndView("BookingReport");
		mv.addObject("bookList",bookList);
		
		return mv;
	}
	
	@GetMapping("/adminPanel")
	public ModelAndView getAdminPanel() {
		return new ModelAndView("adminPanelContent");
	}
	
	@GetMapping("/cancellation")
	public ModelAndView cancellationRequest() {
		List<GymBook> bookList = gymBookDao.getBookList();
		
		ModelAndView mv = null;
		if(gymUserService.getType().equalsIgnoreCase("Customer")) {
			String username = gymUserService.getUser().getUsername();
			bookList = bookList.stream().filter(gymBook -> gymBook.getUsername().equals(username)).toList();
			mv = new ModelAndView("cancellationReportCustomer");
			mv.addObject("bookList", bookList);
			return mv;
		}
		
	    mv = new ModelAndView("cancellationReport");
		mv.addObject("bookList",bookList);
		
		return mv;
	}
	
	@PostMapping("/cancel")
	public ModelAndView processCencellation(@RequestParam("bookingId") Long bookId) {
		GymBook gymBook = gymBookDao.findBookInfoById(bookId);
		SlotItemEmbed slotItemEmbed = new SlotItemEmbed(gymBook.getSlotId(), gymBook.getItemId());
		SlotItem slotItem = slotItemDao.getSlotItemById(slotItemEmbed);
		
		if(gymUserService.getType().equalsIgnoreCase("Customer")) {
			String username = gymUserService.getUser().getUsername();
			
			if(username.equals(gymBook.getUsername())) {
				slotItem.setSeatBooked(slotItem.getSeatBooked() - 1);
				gymBookDao.deleteById(bookId);
			}
		} else if(gymUserService.getType().equalsIgnoreCase("Admin")) {
			slotItem.setSeatBooked(slotItem.getSeatBooked() - 1);
			gymBookDao.deleteById(bookId);
		}
		
		return new ModelAndView("redirect:bookings");
	}
	
	@GetMapping("/feedback")
	public ModelAndView showFeedbackForm() {
		return new ModelAndView("feedbackEntryPage");
	}
	
	@PostMapping("/feedback")
	public ModelAndView processFeedback(@RequestParam("content") String content) {
		Feedback feedback = new Feedback();
		GymUser gymUser = gymUserService.getUser();
		
		feedback.setUserId(gymUser.getUsername());
		feedback.setFullName(gymUser.getFirstName()+" "+gymUser.getLastName());
		feedback.setContent(content);
		
		feedbackDao.saveFeedback(feedback);
		ModelAndView mv = new ModelAndView("confirmPage");
		mv.addObject("msg", "Thank you for your valueable feedback !");
		return mv;
	}
	
	@GetMapping("/feedbacks")
	public ModelAndView showAllFeedbacks() {
		
		if(!gymUserService.getType().equalsIgnoreCase("Admin")) 
			throw new AccessDeniedException("User not allowed");
		
		ModelAndView mv = new ModelAndView("feedbackList");
		List<Feedback> feedbacks = feedbackDao.getFeedbackList();
		mv.addObject("feedbacks",feedbacks);
		
		return mv;
	}
	
	@PostMapping("/delete-feedback")
	public ModelAndView deleteFeedback(@RequestParam("feedbackId") Long feedbackId) {
		if(!gymUserService.getType().equalsIgnoreCase("Admin")) 
			throw new AccessDeniedException("User not allowed");
		
		feedbackDao.deleteFeedBackById(feedbackId);
		return new ModelAndView("redirect:/feedbacks");
	}
	
	@GetMapping("/customers")
	public ModelAndView showCustomerList() {
		if(!gymUserService.getType().equalsIgnoreCase("Admin")) 
			throw new AccessDeniedException("User not allowed");
		
		ModelAndView mv = new ModelAndView("customerDetails");
		List<GymUser> customerList = gymUserService.getAllCustomerUsers().stream().map(
										username -> gymUserRepository.findById(username).get()
									).toList();
		mv.addObject("customerList", customerList);
		mv.addObject("gymBookDao", gymBookDao);
		return mv;
	}
	
	@PostMapping("/delete-customer")
	public ModelAndView deleteCustomerByUsername(@RequestParam("username") String username) {
		if(!gymUserService.getType().equalsIgnoreCase("Admin")) 
			throw new AccessDeniedException("User not allowed");
		
		if(gymBookDao.findTotalSeatbookedByUsername(username) > 0) {
			List<GymBook>  userBookings = gymBookDao.getBookList().stream().filter(gymUser -> gymUser.getUsername().equals(username)).toList();
			List<SlotItem> slotItems = userBookings.stream().map(booking -> slotItemDao.getSlotItemById(new SlotItemEmbed(booking.getSlotId(), booking.getItemId()))).toList();
			slotItems.forEach(slotItem -> {
				slotItem.setSeatBooked(slotItem.getSeatBooked() - 1);
				slotItemDao.saveSlotItem(slotItem);
			});
			
			List<Long> bookinIds = userBookings.stream().map(booking -> booking.getBookingId()).toList();
			gymBookDao.deleteAllById(bookinIds);
		}
		gymUserRepository.deleteById(username);
		
		return new ModelAndView("redirect:customers");
	}
	
	@GetMapping("/edit-gymItem")
	public ModelAndView editGymItem(@RequestParam("itemId") Long itemId) {
		ModelAndView mv = new ModelAndView("editGymItemForm");
		GymItem gymItem = gymItemDao.findItemById(itemId);
		mv.addObject("gymItem", gymItem);
		return mv;
	}
	
	@PostMapping("/edit-gymItem")
	public ModelAndView processEditing(@RequestParam("itemId") Long itemId, @RequestParam("itemName") String itemName, @RequestParam("totalSeat") int totalSeat) {
		GymItem gymItem = gymItemDao.findItemById(itemId);
		gymItem.setItemName(itemName);
		gymItem.setTotalSeat(totalSeat);
		gymItemDao.saveNewItem(gymItem);
		ModelAndView mv = new ModelAndView("confirmPage");
		mv.addObject("msg","Gym Item Updated successfully !");
		return mv;
	}

}

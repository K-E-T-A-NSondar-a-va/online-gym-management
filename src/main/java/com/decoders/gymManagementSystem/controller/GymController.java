package com.decoders.gymManagementSystem.controller;

import java.security.Principal;
import java.util.List;

import org.apache.logging.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.decoders.gymManagementSystem.bean.GymItem;
import com.decoders.gymManagementSystem.bean.Slot;
import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.dao.GymItemDao;
import com.decoders.gymManagementSystem.dao.SlotDaoImpl;
import com.decoders.gymManagementSystem.service.GymUserService;

@RestController
public class GymController {
	
	@Autowired
	private GymItemDao gymItemDao;
	
	@Autowired
	private SlotDaoImpl slotDaoImpl;
	
	@Autowired
	private GymUserService gymUserService;
	
	private final org.slf4j.Logger logger = LoggerFactory.getLogger(GymController.class);
	
	@GetMapping("/")
	public ModelAndView indexPageRouting1() {
		return new ModelAndView("index");
	}
	
	@GetMapping("/index")
	public ModelAndView indexPageRouting2() {
		return new ModelAndView("controlPanel");
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
		mv.addObject("slotRecord",slot);
		return mv;
	}
	
	@PostMapping("/slot")
	public ModelAndView saveSlot(@ModelAttribute("slotRecord") Slot slot) {
		slotDaoImpl.saveNewSLot(slot);
		return new ModelAndView("controlPanel");
	}
	
	@GetMapping("/slots")
	public ModelAndView showSlotReport() {
		List<Slot> slotList = slotDaoImpl.displayAllSlot();
		ModelAndView mv = new ModelAndView("slotReport");
		mv.addObject("slotList", slotList);
		
		return mv;
	}
	
	@GetMapping("/book-slot")
	public ModelAndView showSeatBookingPage() {
		return new ModelAndView("slotBooking");
	}
	
	@GetMapping("/get-name")
	public ResponseEntity<String> getFullName(Principal principal) {
//		logger.info(principal.getName());
		return ResponseEntity.ok(gymUserService.getName(principal));
	}
	
}

package com.decoders.gymManagementSystem.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.decoders.gymManagementSystem.bean.GymItem;
import com.decoders.gymManagementSystem.bean.Item;
import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;
import com.decoders.gymManagementSystem.dao.GymItemDao;
import com.decoders.gymManagementSystem.dao.SlotItemDao;
import com.decoders.gymManagementSystem.dao.SlotItemRepository;
import com.decoders.gymManagementSystem.dao.SlotRepository;

@Service
public class GymItemService {
	
	
	@Autowired
	private GymItemDao gymItemDao;
	
	@Autowired
	private SlotItemDao slotItemDao;
	
	@Autowired
	private SlotItemRepository slotItemRepository;
	
	public List<Item> gymItemList(Long slotId) {
		List<Item> itemList = new ArrayList<Item>();
		List<GymItem> gymItems = gymItemDao.displayAllItem();
		
		for(GymItem gymItem:gymItems) {
			System.out.println("gymItemId @GymItemService => "+gymItem.getItemId());
			Item item = new Item(gymItem);
			SlotItemEmbed embed = new SlotItemEmbed(slotId, gymItem.getItemId());
			Integer seatBooked = slotItemDao.findSeatBookedById(embed);
			
			if(seatBooked == null)
				seatBooked = 0;
			
			int seatVacant = gymItem.getTotalSeat() - seatBooked.intValue();
			item.setSeatVacant(seatVacant);
			itemList.add(item);
		}
		return itemList;
	}
	
	public void addNewItemToSlots(Long itemId) {
		Set<SlotItemEmbed> embeds = slotItemRepository.findAllEmbeds();
		Set<Long> itemSet = new HashSet<>();
		Set<Long> slotSet = new HashSet<>();
		
		for(SlotItemEmbed embed : embeds) {
			itemSet.add(embed.getItemId());
			slotSet.add(embed.getSlotId());
		}
		
		if(itemSet.contains(itemId) == false) {
			for(Long slotId : slotSet) {
				SlotItemEmbed embed = new SlotItemEmbed(slotId, itemId);
				SlotItem slotItem = new SlotItem(embed);
				slotItemDao.saveSlotItem(slotItem);
			}
		}
	}

}

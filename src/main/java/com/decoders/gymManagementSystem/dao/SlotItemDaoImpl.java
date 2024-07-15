package com.decoders.gymManagementSystem.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.decoders.gymManagementSystem.bean.GymItem;
import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;

@Service
public class SlotItemDaoImpl implements SlotItemDao {
	
	@Autowired
	private SlotItemRepository slotItemRepository;

	@Autowired
	private GymItemDao gymItemDao;
	
	@Override
	public void saveSlotItem(SlotItem slotItem) {
		slotItemRepository.save(slotItem);
	}

	@Override
	public void bookSlot(SlotItem slotItem) {
		if(slotItem.getSeatBooked() == null)
			slotItem.setSeatBooked(1);
		else
			slotItem.setSeatBooked(slotItem.getSeatBooked() + 1);
		
		System.out.println("\n slotItem details => "+slotItem.getEmbeddedId().getItemId()+" "+slotItem.getEmbeddedId().getSlotId());
		System.out.println("\n seat booked => "+slotItem.getSeatBooked());
		slotItemRepository.save(slotItem);
	}

	@Override
	public Integer findSeatBookedById(SlotItemEmbed embed) {
		return slotItemRepository.findByEmbeddedId(embed).get().getSeatBooked();
	}

	@Override
	public SlotItem getSlotItemById(SlotItemEmbed embed) {
		return slotItemRepository.findByEmbeddedId(embed).get();
	}

}

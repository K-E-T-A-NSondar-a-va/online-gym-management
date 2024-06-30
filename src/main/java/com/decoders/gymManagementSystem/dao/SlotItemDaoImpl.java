package com.decoders.gymManagementSystem.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.decoders.gymManagementSystem.bean.GymItem;
import com.decoders.gymManagementSystem.bean.SlotItem;

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
		if(slotItem.getSeatBooked() != null)
			slotItem.setSeatBooked(slotItem.getSeatBooked() + 1);
		else
			slotItem.setSeatBooked(1);
		
		GymItem gymItem = gymItemDao.findItemById(slotItem.getEmbeddedId().getItemId());
		gymItem.setTotalSeat(gymItem.getTotalSeat() - 1);
		gymItemDao.saveNewItem(gymItem);
		
		slotItemRepository.save(slotItem);
	}

}

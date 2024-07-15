package com.decoders.gymManagementSystem.dao;

import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemDao  {
	public void saveSlotItem(SlotItem slotItem);
	
	public void bookSlot(SlotItem slotItem);
	
	public Integer findSeatBookedById(SlotItemEmbed embed);
	
	public SlotItem getSlotItemById(SlotItemEmbed embed);
}

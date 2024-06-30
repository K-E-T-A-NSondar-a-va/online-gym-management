package com.decoders.gymManagementSystem.dao;

import com.decoders.gymManagementSystem.bean.SlotItem;

public interface SlotItemDao  {
	public void saveSlotItem(SlotItem slotItem);
	
	public void bookSlot(SlotItem slotItem);
}

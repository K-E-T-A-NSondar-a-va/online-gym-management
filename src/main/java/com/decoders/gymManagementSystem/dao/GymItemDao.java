package com.decoders.gymManagementSystem.dao;

import java.util.List;

import com.decoders.gymManagementSystem.bean.GymItem;

public interface GymItemDao {
	
	public void saveNewItem(GymItem gymItem);
	
	public List<GymItem> displayAllItem();
	
	public GymItem findItemById(Long id);
	
	public Long generateItemId();
	
}

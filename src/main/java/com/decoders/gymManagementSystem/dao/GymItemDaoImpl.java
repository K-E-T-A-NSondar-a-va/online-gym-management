package com.decoders.gymManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.decoders.gymManagementSystem.bean.GymItem;

@Service
@Repository
public class GymItemDaoImpl implements GymItemDao {
	
	@Autowired
	private GymItemRepository repository;
	
	
	@Override
	public void saveNewItem(GymItem gymItem) {
		Long newId = generateItemId();
		gymItem.setItemId(newId);
		repository.save(gymItem);
	}

	@Override
	public List<GymItem> displayAllItem() {
		return repository.findAll();
	}

	@Override
	public GymItem findItemById(Long id) {
		return repository.findById(id).get();
	}

	@Override
	public Long generateItemId() {
		Long val = repository.findLastItemId();
		
		if(val == null)
			val = 101L;
		else 
			val += 1;
		
		return val;
	}
	
	
	
}

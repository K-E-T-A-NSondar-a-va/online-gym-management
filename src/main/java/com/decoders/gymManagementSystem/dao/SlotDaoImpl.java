package com.decoders.gymManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.decoders.gymManagementSystem.bean.Slot;

@Service
@Repository
public class SlotDaoImpl implements SlotDao {

	@Autowired
	private SlotRepository repository;

	@Override
	public void saveNewSLot(Slot slot) {
		Long val = repository.findLastItemId();

		if (val == null)
			val = 1L;
		else
			val += 1;
		
		slot.setSlotId(val);
		repository.save(slot);
	}

	@Override
	public List<Slot> displayAllSlot() {
		return repository.findAll();
	}

	@Override
	public Slot findSlotById(Long id) {
		return repository.findById(id).get();
	}

}

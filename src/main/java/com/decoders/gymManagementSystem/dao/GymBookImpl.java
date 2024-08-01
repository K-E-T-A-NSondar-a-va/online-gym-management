package com.decoders.gymManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.decoders.gymManagementSystem.bean.GymBook;

@Service
@Repository
public class GymBookImpl implements GymBookDao {
	
	@Autowired
	private GymBookRepository repository;

	@Override
	public void save(GymBook gymBook) {
		if(gymBook.getBookingId() == null)
			gymBook.setBookingId(generateBookingId());
		
		repository.save(gymBook);
	}

	@Override
	public Long generateBookingId() {
		Long newId=repository.findLastBookingId();
		if(newId==null) {
			newId=1000001L;
		}
		else {
			newId=newId+1L;
		}
		return newId;
	}

	@Override
	public List<GymBook> getBookList() {
		return repository.findAll();
	}

	@Override
	public GymBook findBookInfoById(Long id) {
		return repository.findById(id).get();
	}
	
	@Override
	public void deleteById(Long id) {
		repository.deleteById(id);
	}

	@Override
	public boolean isBookingExists(Long slotId, Long itemId, String username) {
		return repository.isBookingExists(slotId, itemId, username) != null;
	}

	@Override
	public int findTotalSeatbookedByUsername(String username) {
		int seatBooked = repository.findTotalSeatBookedByUsername(username);
		return seatBooked > 0 ? seatBooked : 0;
	}

	@Override
	public void deleteAllById(List<Long> bookinIdList) {
		repository.deleteAllById(bookinIdList);
	}

}
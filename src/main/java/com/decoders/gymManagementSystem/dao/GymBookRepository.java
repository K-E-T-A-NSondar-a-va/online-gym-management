package com.decoders.gymManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.decoders.gymManagementSystem.bean.GymBook;

public interface GymBookRepository extends JpaRepository<GymBook, Long> {
	@Query("select max(bookingId) from GymBook")
	public Long findLastBookingId();
	
	@Query("select bookingId from GymBook where slotId = ?1 and itemId = ?2 and username = ?3")
	public Long isBookingExists(Long slotId, Long itemId, String username);
}
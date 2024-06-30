package com.decoders.gymManagementSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemRepository extends JpaRepository<SlotItem, SlotItemEmbed>{
	
	@Query("SELECT si FROM SlotItem si WHERE si.embeddedId.slotId = :slotId")
	List<SlotItem> getAllSlotItemBySlotId(@Param("slotId") Long slotId);


}

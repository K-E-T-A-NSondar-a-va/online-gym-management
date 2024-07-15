package com.decoders.gymManagementSystem.dao;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemRepository extends JpaRepository<SlotItem, SlotItemEmbed>{
	
	@Query("SELECT si FROM SlotItem si WHERE si.embeddedId.slotId = :slotId")
	List<SlotItem> getAllSlotItemBySlotId(@Param("slotId") Long slotId);

	Optional<SlotItem> findByEmbeddedId(SlotItemEmbed embeddedId);
	
	@Query("SELECT embeddedId FROM SlotItem")
	public Set<SlotItemEmbed> findAllEmbeds();
}

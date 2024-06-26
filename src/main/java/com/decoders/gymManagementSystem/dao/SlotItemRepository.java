package com.decoders.gymManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.decoders.gymManagementSystem.bean.SlotItem;
import com.decoders.gymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemRepository extends JpaRepository<SlotItem, SlotItemEmbed>{

}

package com.decoders.gymManagementSystem.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.decoders.gymManagementSystem.bean.GymUser;
import java.util.List;


public interface GymUserRepository extends JpaRepository<GymUser, String> {
	Optional<GymUser> findByUsername(String username);
	
	Optional<GymUser> findByEmail(String email);
}

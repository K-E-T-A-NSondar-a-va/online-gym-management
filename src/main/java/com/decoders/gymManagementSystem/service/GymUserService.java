package com.decoders.gymManagementSystem.service;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.decoders.gymManagementSystem.bean.GymUser;
import com.decoders.gymManagementSystem.dao.GymUserRepository;

@Service
public class GymUserService implements UserDetailsService {
	
	@Autowired
	private GymUserRepository gymUserRepository;
	private String type;
	private GymUser gymUser;
	
	public void save(GymUser gymUser) {
		gymUserRepository.save(gymUser);
	}
	
	public String getType() {
		return type;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		GymUser user = gymUserRepository.findById(username).get();
		type = user.getType();
		this.gymUser = user;
		return user;
	}
	
	public GymUser getUser() {
		return gymUser;
	}
	
	public List<String> getAllCustomerUsers() {
		return gymUserRepository.findAllCustomerUsers();
	}
	
	public boolean isUsernameExists(String username) {
		Optional<GymUser> user =  gymUserRepository.findById(username);
		return user.isPresent();
	}
	
	public boolean isEmailExists(String email) {
		Optional<GymUser> user = gymUserRepository.findByEmail(email);
		return user.isPresent();
	}
	
	public String getName(Principal principal) {
		GymUser user = gymUserRepository.findByUsername(principal.getName()).get();
		return user.getFirstName()+" "+user.getLastName();
	}
	
}

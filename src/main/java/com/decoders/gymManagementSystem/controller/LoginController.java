package com.decoders.gymManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.decoders.gymManagementSystem.bean.GymUser;
import com.decoders.gymManagementSystem.dao.GymUserRepository;
import com.decoders.gymManagementSystem.service.GymUserService;

@RestController
public class LoginController {
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private GymUserService gymUserService;
	
	@Autowired
	private GymUserRepository gymUserRepository;
	
	
	@GetMapping("/register")
	public ModelAndView showUserRegistrationPage() {
		GymUser user = new GymUser();
		ModelAndView mv = new ModelAndView("newUserRegistration");
		mv.addObject("userRecord", user);
		return mv;
	}
	
	@GetMapping("/register/check-username/{username}")
	public ResponseEntity<Boolean> checkUsernameExists(@PathVariable("username") String username) {
		return new ResponseEntity<Boolean>(gymUserService.isUsernameExists(username), HttpStatus.OK);
	}
	
	@GetMapping("/register/check-email/{email}")
	public ResponseEntity<Boolean> checkEmailExists(@PathVariable("email") String email) {
		return new ResponseEntity<Boolean>(gymUserService.isEmailExists(email), HttpStatus.OK);
	}
	
	
	@PostMapping("/register")
	public ModelAndView saveUserRegisteration(@ModelAttribute("userRecord") GymUser user) {
		GymUser gymUser = new GymUser();
		String encodedPassword = bcrypt.encode(user.getPassword());
		gymUser.setFirstName(user.getFirstName());
		gymUser.setLastName(user.getLastName());
		gymUser.setPassword(encodedPassword);
		gymUser.setEmail(user.getEmail());
		gymUser.setType(user.getType());
		gymUser.setUsername(user.getUsername());
		
		System.out.println(gymUser);
		gymUserService.save(gymUser);
		
		
		return new ModelAndView("loginPage");
	}
	
	@GetMapping("/loginpage")
	public ModelAndView loginPage() {
		return new ModelAndView("loginPage");
	}
	
	@GetMapping("/loginerror")
	public ModelAndView loginError() {
		return new ModelAndView("loginError");
	}
	
}

package com.decoders.gymManagementSystem.bean;



import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

//import jakarta.persistence.Entity;
//import jakarta.persistence.Id;

@javax.persistence.Entity
public class GymUser extends User {
	@javax.persistence.Id
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private String email;
	private String type;

	public GymUser() {
		super("abc","xyz",new ArrayList<>());
		// TODO Auto-generated constructor stub
	}

	public GymUser(String username, String password, String username2, String password2, Collection<? extends GrantedAuthority> authorities, String firstName, String lastName, String email, String type) {
		super(username, password, authorities);
		this.username = username2;
		this.password = password2;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.type = type;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "GymUser [username=" + username + ", password=" + password + ", firstName=" + firstName + ", lastName="
				+ lastName + ", email=" + email + ", type=" + type + "]";
	}
	
	

}

package com.app.university.user;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

public class UserProfile extends org.springframework.security.core.userdetails.User {
	
	public UserProfile(String username, String password, Collection<? extends GrantedAuthority> authorities, User user) {
		super(username, password, authorities);
		this.setUser(user);
		// TODO Auto-generated constructor stub
	}

	private User user;

	
	
	public User getUser() {		
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
}

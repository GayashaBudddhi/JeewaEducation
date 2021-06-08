package com.app.university.user;

import com.app.university.user.User;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
	
    User findByUsername(String username);
    
    User findByUserTypeAndUserId(String userType, int userId);
}
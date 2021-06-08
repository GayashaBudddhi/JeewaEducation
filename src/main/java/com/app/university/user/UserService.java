package com.app.university.user;

public interface UserService {
	
    void save(User user);

    User findByUsername(String username);
    
    User findByUserTypeAndUserId(String userType, int userId);
   
}

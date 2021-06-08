package com.app.university.user;

public interface SecurityService {
	
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}

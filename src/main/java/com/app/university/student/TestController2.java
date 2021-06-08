package com.app.university.student;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController2 {
	
	@RequestMapping("/qqq")
    public String home(){
        return "Hello World!7677";
    }

}

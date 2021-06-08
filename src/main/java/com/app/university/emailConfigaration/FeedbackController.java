package com.app.university.emailConfigaration;

import javax.xml.bind.ValidationException;

import org.springframework.boot.autoconfigure.mail.MailSenderAutoConfiguration;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@RestController
@RequestMapping("/feedbcak")
public class FeedbackController {

	private EmailConfigaration emailConfigaration;
	
	public  FeedbackController(EmailConfigaration emailConfigaration) {
	
		this.emailConfigaration=emailConfigaration;
	}
	
	
	@PostMapping
	public void sendFeedback(@RequestBody FeedBack feedBack
			,BindingResult bindingResult) throws ValidationException {
		if(bindingResult.hasErrors()) {
			
			throw new ValidationException("feedback is not Valid");
			
		}
		
		//create mail sender
		JavaMailSenderImpl mailSenderImpl =new JavaMailSenderImpl();
		mailSenderImpl.setHost(this.emailConfigaration.getHost());
		mailSenderImpl.setPort(this.emailConfigaration.getPort());
		mailSenderImpl.setUsername(this.emailConfigaration.getUsername());
		mailSenderImpl.setPassword(this.emailConfigaration.getPassword());
		
		
		//create an mail instance
		SimpleMailMessage mailMessage=new SimpleMailMessage();
		mailMessage.setFrom("nokodij930@mail7d.com");
		mailMessage.setTo(feedBack.getEmail());
		mailMessage.setSubject("new message from "+feedBack.getName());
		mailMessage.setText(feedBack.getFeedback());
		
		//send mail
		
		mailSenderImpl.send(mailMessage);
	}
	
}

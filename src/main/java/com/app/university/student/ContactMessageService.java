package com.app.university.student;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class ContactMessageService {

	@Autowired
	private ContactMessageRepository contactMessageRepository;
	
	public void saveOrUpdate(ContactMessage contactMessage) {	
		Date date = new Date();
		contactMessage.setCreatedTimestamp(date);
		contactMessage.setLastUpdatedTimestamp(date);
		contactMessageRepository.save(contactMessage);
	}
	
	public List<ContactMessage> getMessages(){
		List<ContactMessage> messages = new ArrayList<ContactMessage>();  
		contactMessageRepository.findByStatus("UNREAD").forEach(message -> messages.add(message));  
		return messages;
	}	
	
	public ContactMessage getMessage(int id) {
		return contactMessageRepository.findById(id);
	}
	
	public ContactMessage deleteMessage(int id) {
		ContactMessage message = contactMessageRepository.findById(id);
		contactMessageRepository.delete(message);
		return message;
	}
	
}

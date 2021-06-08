package com.app.university.student;
import java.util.List;

import org.springframework.data.repository.CrudRepository;  

public interface ContactMessageRepository extends CrudRepository<ContactMessage, Integer> {
	
	ContactMessage findById(int id);
	
	List<ContactMessage> findByStatus(String status);
	
}

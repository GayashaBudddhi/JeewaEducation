package com.app.university.student;
import java.util.List;

import org.springframework.data.repository.CrudRepository;  

public interface StudentRepository extends CrudRepository<Student, Integer> {
	
	Student findById(int studentId);
	
	List<Student> findByStatus(String status);
	
}

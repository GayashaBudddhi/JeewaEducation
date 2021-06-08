package com.app.university.scholarships;
import java.util.List;

import org.springframework.data.repository.CrudRepository;  

public interface ScholarshipRepository extends CrudRepository<Scholarship, Integer> {
	
	Scholarship findById(int id);
	
	List<Scholarship> findByStudentId(int studentId);
	
}

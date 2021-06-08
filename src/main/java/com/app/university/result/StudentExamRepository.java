package com.app.university.result;
import java.util.List;

import org.springframework.data.repository.CrudRepository;  

public interface StudentExamRepository extends CrudRepository<StudentExam, Integer> {
	
	StudentExam findById(int id);
	
	List<StudentExam> findByStudentId(int studentId);
	
	List<StudentExam> findBystudentId(int studentId);
	
}

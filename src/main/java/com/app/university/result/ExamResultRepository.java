package com.app.university.result;
import java.util.List;

import org.springframework.data.repository.CrudRepository;  

public interface ExamResultRepository extends CrudRepository<ExamResult, Integer> {
	
	ExamResult findById(int id);
	
	List<ExamResult> findBystudentExam(StudentExam studentExam);
	
	
}

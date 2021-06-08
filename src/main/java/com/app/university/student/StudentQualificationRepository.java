package com.app.university.student;
import java.util.List;

import org.springframework.data.repository.CrudRepository;  

public interface StudentQualificationRepository extends CrudRepository<StudentQualification, Integer> {

	List<StudentQualification> findAllByStudentIdAndExam(int studentId, String exam);
	
	StudentQualification findById(int qualificationId);
}

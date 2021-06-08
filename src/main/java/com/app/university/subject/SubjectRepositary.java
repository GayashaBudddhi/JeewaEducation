package com.app.university.subject;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface SubjectRepositary extends JpaRepository<Subject, Integer> {
	
	
	@Query(value="select subject.* from subject where status=?1",nativeQuery =true)
	ArrayList<Subject>findAllSubjects(int status);
	
	@Query(value="select * from subject where subject_id=?1 ",nativeQuery =true)
	Subject getSubjectById(int id);
	
	
	@Transactional
	@Modifying(clearAutomatically = true)	
	@Query(value="SELECT SUBJECT .* FROM `subject` INNER JOIN lecture_subject2 ON lecture_subject2.subject_id = `subject`.subject_id WHERE lecture_subject2.user_id = ?1 AND lecture_subject2.status = ?2 GROUP BY `subject`.subject_id",nativeQuery = true)

	ArrayList <Subject> getAllSubjectsAssingedToLecture(int user_id,int status);

	
	
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value="Update lecture_subject2 set status =:status where user_id =:user_id",nativeQuery = true)
	int setAssgnedSubjectInnactive(@Param("status") int status,@Param("user_id")int userId);
	


}

package com.app.university.subject;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface LetureSubjectRepositary extends JpaRepository<LectureSubject, Integer>{

@Transactional
@Modifying(clearAutomatically = true)	
@Query(value="Select * form lecture_subject2 INNER JOIN subject on lecture_subject2.subject_id=subject.subject_id where lecture_subject2.user_id=?1",nativeQuery = true)

ArrayList <Subject> getAllSubjectsAssingedToLecture(int user_id);
	
	
	
}

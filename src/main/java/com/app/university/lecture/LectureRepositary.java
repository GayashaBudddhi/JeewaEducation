package com.app.university.lecture;


import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.app.university.study_material.StudyMaterial;


public interface LectureRepositary extends JpaRepository<Lecture, Integer>{
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value="Update lecture set user_name =:user_name,password =:password where user_id =:user_id",nativeQuery = true)
	//@Query("update RssFeedEntry feedEntry set feedEntry.read =:isRead where feedEntry.id =:entryId")
	int createUserNamePassword(@Param("user_name") String username, @Param("password")String password,@Param("user_id")int userId);
	
	@Transactional
	@Modifying(clearAutomatically = true)	
	@Query(value="SELECT * FROM lecture WHERE status=?1",nativeQuery = true)

	List<Lecture> getAllectursBytype(String status);
}
 
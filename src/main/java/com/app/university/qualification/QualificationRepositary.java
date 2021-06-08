package com.app.university.qualification;


import com.app.university.qualification.Qualification;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface QualificationRepositary extends JpaRepository<Qualification, Integer> {
	
	@Query(value="select * from qualification where user_id=?1 and status=?2",nativeQuery = true)
	ArrayList<Qualification> findAllQulificationsofUser(int userId,String status);
}

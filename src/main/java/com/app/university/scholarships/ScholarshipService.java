package com.app.university.scholarships;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.university.result.StudentExam;

@Service
public class ScholarshipService {
	
	@Autowired
	private ScholarshipRepository scholarshipRepository;
	
	public void saveOrUpdate(Scholarship scholarship) {	
		scholarshipRepository.save(scholarship);
	}
	
	public Scholarship getScholarship(int id) {
		return scholarshipRepository.findById(id);
	}
	
	public Scholarship deleteScholarship(int id) {
		Scholarship scholarship = scholarshipRepository.findById(id);
		scholarshipRepository.delete(scholarship);
		return scholarship;
	}
	
	public List<Scholarship> getAllScholarships(){
		List<Scholarship> scholarships = new ArrayList<>();
		scholarshipRepository.findAll().forEach(scholarship -> scholarships.add(scholarship));  
		return scholarships;
	}
}

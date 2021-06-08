package com.app.university.result;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.app.university.student.Student;
import com.app.university.student.StudentRepository;

@Service
public class ResultService {
	
	@Autowired
	private StudentExamRepository studentExamRepository;
	@Autowired
	private ExamResultRepository examResultRepository;
	@Autowired
	private GradeService gradeService;
	
	public void saveOrUpdate(StudentExam studentExam) {	
		studentExamRepository.save(studentExam);
	}
	
	
	public StudentExam getStudentExam(int id) {
		return studentExamRepository.findById(id);
	}
	
	
	public void saveOrUpdateResults(ExamResult examResult) {	
		examResult.setGrade(gradeService.getGrade(examResult.getMarks()));
		examResultRepository.save(examResult);
	}
	
	public List<StudentExam> getStudentExams(int studentId) {	
		return studentExamRepository.findBystudentId(studentId);
	}
	
	public List<StudentExam> getAllStudentExams() {	
		List<StudentExam> exams = new ArrayList<>();
		studentExamRepository.findAll().forEach(exam -> exams.add(exam));  
		return exams;
	}
	
	public List<ExamResult> getExamResults(StudentExam studentExam) {	
		return examResultRepository.findBystudentExam(studentExam);
	}
	
	
	public StudentExam deleteStudentExam(int id) {
		StudentExam studentExam = studentExamRepository.findById(id);	
		
		studentExam.getExamResults().forEach(result -> {
			this.deleteExamResult(result.getId());
		});
		
		studentExamRepository.delete(studentExam);
		return studentExam;
	}
	
	
	public ExamResult deleteExamResult(int id) {
		ExamResult examResult = examResultRepository.findById(id);
		//examResult.setStudentExam(examResult.getStudentExam());
		examResultRepository.delete(examResult);
		return examResult;
	}

}

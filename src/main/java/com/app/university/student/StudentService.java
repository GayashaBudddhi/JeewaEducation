package com.app.university.student;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class StudentService {

	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private StudentQualificationRepository studentQualificationRepository;
	@Autowired
	private ExamAnswerRepository examAnswerRepository;
	
	@Value("${img.upload-path}")
	private String imgUploadPath;
	
	@Value("${answers.upload-path}")
	private String answersUploadPath;
	
	public void saveOrUpdate(Student student) {
		
		try {
			String copyPath = imgUploadPath + File.separator + StringUtils.cleanPath(student.getFile().getOriginalFilename());
            Path copyLocation = Paths.get(copyPath);        
            Files.copy(student.getFile().getInputStream(), copyLocation, StandardCopyOption.REPLACE_EXISTING);
        
            student.setProfileImagePath(copyPath);	
		} catch (Exception e) {
            e.printStackTrace();
            //throw new FileStorageException("Could not store file " + file.getOriginalFilename()
            //    + ". Please try again!");
        }
		
		Date date = new Date();
		if(student.getStudentId() <= 0) {			
			student.setStatus("NEW");
			student.setCreatedTimestamp(date);
		}
		student.setLastUpdatedTimestamp(date);
		studentRepository.save(student);
	}
	
	
	public Student getStudent(int studentId) {
		return studentRepository.findById(studentId);
	}
	
	
	public void saveOrUpdateQualification(StudentQualification studentQualification) {	
		studentQualificationRepository.save(studentQualification);
	}
	
	
	public List<Student> getPendingStudents(){
		List<Student> students = new ArrayList<Student>();  
		studentRepository.findByStatus("PENDING").forEach(student -> students.add(student));  
		return students;
	}
	
	public List<Student> getFoundationStudents(){
		List<Student> students = new ArrayList<Student>();  
		studentRepository.findByStatus("FOUNDATION").forEach(student -> students.add(student));  
		return students;
	}
	
	
	public List<Student> getVisaStudents(){
		List<Student> students = new ArrayList<Student>();  
		studentRepository.findByStatus("VISA").forEach(student -> students.add(student));  
		return students;
	}
	
	public List<StudentQualification> getOLQualifications(int studentId){
		List<StudentQualification> studentQualifications = new ArrayList<StudentQualification>();  
		studentQualificationRepository.findAllByStudentIdAndExam(studentId, "O/L").forEach(studentQualification -> studentQualifications.add(studentQualification));  
		return studentQualifications;
	}
	
	public List<StudentQualification> getALQualifications(int studentId){
		List<StudentQualification> studentQualifications = new ArrayList<StudentQualification>();  
		studentQualificationRepository.findAllByStudentIdAndExam(studentId, "A/L").forEach(studentQualification -> studentQualifications.add(studentQualification));  
		return studentQualifications;
	}
	
	public StudentQualification deleteStudentQualification(int qualificationId) {
		StudentQualification qualification = studentQualificationRepository.findById(qualificationId);
		studentQualificationRepository.delete(qualification);
		return qualification;
	}
	
	
	public Student deleteStudent(int studentId) {
		Student student = studentRepository.findById(studentId);
		studentRepository.delete(student);
		return student;
	}
	
	
	//online exam answers .............................................
	
	public void saveExamAnswer(ExamAnswer examAnswer) {
		
		try {
			String copyPath = answersUploadPath + File.separator + StringUtils.cleanPath(examAnswer.getFile().getOriginalFilename());
            Path copyLocation = Paths.get(copyPath);        
            Files.copy(examAnswer.getFile().getInputStream(), copyLocation, StandardCopyOption.REPLACE_EXISTING);
        
            examAnswer.setFilePath(copyPath);	
		} catch (Exception e) {
            e.printStackTrace();
            //throw new FileStorageException("Could not store file " + file.getOriginalFilename()
            //    + ". Please try again!");
        }
		
		examAnswerRepository.save(examAnswer);
	}
	
}

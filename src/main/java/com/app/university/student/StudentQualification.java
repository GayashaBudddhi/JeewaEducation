package com.app.university.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="student_qualification")
public class StudentQualification {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="qualification_id")
	private int qualificationId;	
	
	@Column(name="student_id")
	private int studentId;
	
	@NotBlank
	@Column(name="exam")
	private String exam;
	
	@NotBlank
	@Column(name="subject")
	private String subject;
	
	@NotBlank
	@Column(name="grade")
	private String grade;

	public int getQualificationId() {
		return qualificationId;
	}

	public void setQualificationId(int qualificationId) {
		this.qualificationId = qualificationId;
	}

	public String getExam() {
		return exam;
	}

	public void setExam(String exam) {
		this.exam = exam;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}	
	
}

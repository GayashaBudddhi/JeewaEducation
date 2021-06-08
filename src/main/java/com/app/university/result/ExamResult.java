package com.app.university.result;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="exam_result")
public class ExamResult {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;	
	
	@JsonManagedReference
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "student_exam_id", nullable = false)
    private StudentExam studentExam;
	
	@Column(name="subject_code")
	private String subjectCode;
	
	@Column(name="subject_name")
	private String subjectName;
	
	@Column(name="marks")
	private int marks;
	
	@Column(name="grade")
	private String grade;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public StudentExam getStudentExam() {
		return studentExam;
	}

	public void setStudentExam(StudentExam studentExam) {
		this.studentExam = studentExam;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
}

package com.app.university.result;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="student_exam")
public class StudentExam {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;	
	
	@NotNull
	@Column(name = "student_id")
	private int studentId;
	
	@NotNull
	@Column(name = "year")
	private int year;
	
	@NotNull
	@Column(name = "semester")
	private int semester;
	
	@NotBlank
	@Column(name = "index_no")
	private String indexNo;
	
	@JsonBackReference
	@OneToMany(mappedBy = "studentExam", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<ExamResult> examResults;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getIndexNo() {
		return indexNo;
	}

	public void setIndexNo(String indexNo) {
		this.indexNo = indexNo;
	}

	public List<ExamResult> getExamResults() {
		return examResults;
	}

	public void setExamResults(List<ExamResult> examResults) {
		this.examResults = examResults;
	}
	

}

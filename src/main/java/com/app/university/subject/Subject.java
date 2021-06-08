package com.app.university.subject;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.app.university.lecture.Lecture;
import com.app.university.user.User;




@Entity
@Table(name="subject")
public class Subject {
	
	
	
	@Id
	@GeneratedValue
	
	@Column(name="subject_id")
	private int subjectId;
	
	private String subjectName;
	 
	private String subjectCode;
	
	private String status;
	
	@ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.PERSIST,
                    CascadeType.MERGE
                },mappedBy = "subjects")
	java.util.List<Lecture> users=new ArrayList<Lecture>();
	

	public List<Lecture> getUsers() {
		return users;
	}

	public void setUsers(List<Lecture> users) {
		this.users = users;
	}

	public Subject(int subjectId, String subjectName, String subjectCode, String status) {
		super();
		this.subjectId = subjectId;
		this.subjectName = subjectName;
		this.subjectCode = subjectCode;
		this.status = status;
	}

	public Subject() {
		super();
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
}

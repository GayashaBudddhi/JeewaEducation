package com.app.university.subject;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.app.university.user.User;

@Entity
@Table(name="leture_subjects")
public class LectureSubject {


	
	@Id
	@GeneratedValue
	private int id;
	private int userId;
	private int subjectId;
	private String status; 
	
	
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LectureSubject() {
		super();
	}
	public LectureSubject(int id, int userId, int subjectId) {
		super();
		this.id = id;
		this.userId = userId;
		this.subjectId = subjectId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	
	
	
	
	
	
}

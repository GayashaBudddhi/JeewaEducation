package com.app.university.lecture;

import java.sql.Date;
import java.util.ArrayList;

import javax.management.loading.PrivateClassLoader;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.ManyToAny;

import com.app.university.subject.LectureSubject;
import com.app.university.subject.Subject;

import antlr.collections.List;
@Entity
@Table(name ="lecture")
public class Lecture {
	
		
	
	@Id
	@GeneratedValue
	
	
	
	
	private int  userId;
	private String userName;
	private String password;
	private String gender;
	@NotBlank
	@Size(min = 3/*, max = 50*/, message = "Length must be grater than 3")
	private String fName;
	@NotBlank
	@Size(min = 3/*, max = 50*/, message = "Length must be grater than 3")
	private String lName;
	@NotBlank
	private String email;
	@Size(min = 10, max = 12)
	private String nicNo;
	private String userType;
	private Date birthday;
	private String university;
	private String status;
	
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public java.util.List<Subject> getSubjects() {
		return subjects;
	}

	public void setSubjects(java.util.List<Subject> subjects) {
		this.subjects = subjects;
	}

	public Lecture(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}

	public Lecture() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Lecture(int userId, String userName, String password, String gender, String fName, String lName, String email,
			String nicNo, String userType, Date birthday, String university) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.gender = gender;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.nicNo = nicNo;
		this.userType = userType;
		this.birthday = birthday;
		this.university = university;
	}
	
	@ManyToMany
	@JoinTable(name="lecture_subject2",joinColumns = {@JoinColumn(name="user_id")},inverseJoinColumns = {@JoinColumn(name="subject_id")} )
	private java.util.List<Subject> subjects =new ArrayList<Subject>();
	
	
	
	
	public java.util.List<Subject> getSubject() {
		return subjects;
	}

	public void setSubject(java.util.List<Subject> subject) {
		this.subjects = subject;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNicNo() {
		return nicNo;
	}

	public void setNicNo(String nicNo) {
		this.nicNo = nicNo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}


	
	
	 	
}

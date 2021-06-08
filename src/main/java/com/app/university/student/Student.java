package com.app.university.student;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="student")
public class Student {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="student_id")
	private int studentId;	
	
	@Column(name="full_name")
	@NotBlank
	@Size(min = 3/*, max = 50*/, message = "Length must be grater than 3")
	private String fullName;
	
	@NotBlank
	@Column(name="name_with_initials")
	private String nameWithInitials;
	
	@NotBlank
	@Column(name="email")
	private String email;
	
	@NotBlank
	@Column(name="address")
	private String address;
	
	@Size(max = 10)
	@Column(name="phone_home")
	private String phoneHome;
	
	@Size(max = 10)
	@Column(name="phone_mobile")
	private String phoneMobile;
	
	@NotBlank
	@Size(min = 10, max = 12)
	@Column(name="nic")
	private String nic;
	
	@Column(name="school")
	private String school;
	
	@Column(name="profile_image_path")
	private String profileImagePath;
	
	@Column(name="status")
	private String status;
	
	@Column(name="created_timestamp" , nullable = false , updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdTimestamp;
	
	@Column(name="last_update_timestamp" , nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastUpdatedTimestamp;
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Transient
	private MultipartFile file;
	
	//father details.....................
	
	@NotBlank
	@Column(name="father_name")
	private String fatherName;
	
	@NotBlank
	@Column(name="father_nic")
	private String fatherNic;
	
	@Column(name="father_occupation")
	private String fatherOccupation;
	
	//mother details....................
	
	@NotBlank
	@Column(name="mother_name")
	private String motherName;
	
	@NotBlank
	@Column(name="mother_nic")
	private String motherNic;
	
	@Column(name="mother_occupation")
	private String motherOccupation;
	
	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getNameWithInitials() {
		return nameWithInitials;
	}

	public void setNameWithInitials(String nameWithInitials) {
		this.nameWithInitials = nameWithInitials;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneHome() {
		return phoneHome;
	}

	public void setPhoneHome(String phoneHome) {
		this.phoneHome = phoneHome;
	}

	public String getPhoneMobile() {
		return phoneMobile;
	}

	public void setPhoneMobile(String phoneMobile) {
		this.phoneMobile = phoneMobile;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getFatherNic() {
		return fatherNic;
	}

	public void setFatherNic(String fatherNic) {
		this.fatherNic = fatherNic;
	}

	public String getFatherOccupation() {
		return fatherOccupation;
	}

	public void setFatherOccupation(String fatherOccupation) {
		this.fatherOccupation = fatherOccupation;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getMotherNic() {
		return motherNic;
	}

	public void setMotherNic(String motherNic) {
		this.motherNic = motherNic;
	}

	public String getMotherOccupation() {
		return motherOccupation;
	}

	public void setMotherOccupation(String motherOccupation) {
		this.motherOccupation = motherOccupation;
	}

	public String getProfileImagePath() {
		return profileImagePath;
	}

	public void setProfileImagePath(String profileImagePath) {
		this.profileImagePath = profileImagePath;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public Date getCreatedTimestamp() {
		return createdTimestamp;
	}

	public void setCreatedTimestamp(Date createdTimestamp) {
		this.createdTimestamp = createdTimestamp;
	}

	public Date getLastUpdatedTimestamp() {
		return lastUpdatedTimestamp;
	}

	public void setLastUpdatedTimestamp(Date lastUpdatedTimestamp) {
		this.lastUpdatedTimestamp = lastUpdatedTimestamp;
	}	
	
}

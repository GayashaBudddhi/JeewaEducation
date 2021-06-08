package com.app.university.qualification;



import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="qualification")
public class Qualification {
	@Id
	@GeneratedValue
	private int qualificationId;
	@Column(name="user_id")
	private int userId;
	private String qulificationName;
	private String qulificationType;
	private java.sql.Date fromDate;
	private java.sql.Date toDate;
	private String major;
	private String instituteOrCompay;
	private String status;

	
	

	public Qualification(int qualificationId, int userId, String qulificationName, String qulificationType,
			Date fromDate, Date toDate, String major, String instituteOrCompay) {
		super();
		this.qualificationId = qualificationId;
		this.userId = userId;
		this.qulificationName = qulificationName;
		this.qulificationType = qulificationType;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.major = major;
		this.instituteOrCompay = instituteOrCompay;
	}
	
	
	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getQualificationId() {
		return qualificationId;
	}
	public void setQualificationId(int qualificationId) {
		this.qualificationId = qualificationId;
	}
	public Qualification() {
		super();
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getQulificationName() {
		return qulificationName;
	}
	public void setQulificationName(String qulificationName) {
		this.qulificationName = qulificationName;
	}
	public String getQulificationType() {
		return qulificationType;
	}
	public void setQulificationType(String qulificationType) {
		this.qulificationType = qulificationType;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getInstituteOrCompay() {
		return instituteOrCompay;
	}
	public void setInstituteOrCompay(String instituteOrCompay) {
		this.instituteOrCompay = instituteOrCompay;
	}
	
	
	


	
}

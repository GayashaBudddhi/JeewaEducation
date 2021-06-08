package com.app.university.study_material;

import javax.management.loading.PrivateClassLoader;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="study_material")
public class StudyMaterial {
	
	@Id
	@GeneratedValue	
	
	private int documentId;
	private int userId;
	private int subjectId;
	private int documentType;
	private String description;
	private String filePath;
	private String fileName;
	private int status;

	
	


	public StudyMaterial(int documentId, int subjectId, int documentType, String description, String filePath,
			String fileName) {
		super();
		this.documentId = documentId;
		this.subjectId = subjectId;
		this.documentType = documentType;
		this.description = description;
		this.filePath = filePath;
		this.fileName = fileName;
	}
	public String getFileName() {
		return fileName;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public StudyMaterial() {
		super();
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public int getDocumentType() {
		return documentType;
	}
	public void setDocumentType(int documentType) {
		this.documentType = documentType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
	
	
	

}

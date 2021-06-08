package com.app.university.study_material;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="material_type")
public class MaterialType {
//
@Id
@GeneratedValue
int materialTypeId;
String materialType;
private String status;




public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public MaterialType() {
	super();
	// TODO Auto-generated constructor stub
}
public int getMaterialTypeId() {
	return materialTypeId;
}
public void setMaterialTypeId(int materialTypeId) {
	this.materialTypeId = materialTypeId;
}
public String getMaterialType() {
	return materialType;
}
public void setMaterialType(String materialType) {
	this.materialType = materialType;
}









	
	
}

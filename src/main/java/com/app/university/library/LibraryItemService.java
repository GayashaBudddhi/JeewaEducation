package com.app.university.library;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.app.university.result.StudentExam;
import com.app.university.student.Student;
import com.app.university.study_material.MaterialType;
import com.app.university.study_material.MaterialTypeRepositary;
import com.app.university.study_material.StudyMaterial;
import com.app.university.study_material.StudyMaterialRepositary;
import com.app.university.subject.Subject;
import com.app.university.subject.SubjectRepositary;

@Service
public class LibraryItemService {
	
	@Autowired
	private LibraryItemRepository libraryItemRepository;
	@Autowired
	private StudyMaterialRepositary studyMaterialRepository;
	@Autowired
	private MaterialTypeRepositary materialTypeRepository;
	@Autowired
	private SubjectRepositary subjectRepository;
	
	@Value("${file.upload-path}")
	private String fileUploadPath;
	
	public void saveOrUpdate(LibraryItem libraryItem) {
		
		try {
			String copyPath = fileUploadPath + File.separator + StringUtils.cleanPath(libraryItem.getFile().getOriginalFilename());
            Path copyLocation = Paths.get(copyPath);        
            Files.copy(libraryItem.getFile().getInputStream(), copyLocation, StandardCopyOption.REPLACE_EXISTING);
        
            libraryItem.setFilePath(copyPath);	
		} catch (Exception e) {
            e.printStackTrace();
            //throw new FileStorageException("Could not store file " + file.getOriginalFilename()
            //    + ". Please try again!");
        }
		
		libraryItemRepository.save(libraryItem);
	}	
	
	public LibraryItem getLibraryItem(int id) {
		return libraryItemRepository.findById(id);
	}
	
	
	public List<LibraryItem> getAllLibraryItems(){
		List<LibraryItem> items = new ArrayList<LibraryItem>();  
		libraryItemRepository.findAll().forEach(item -> items.add(item));  
		return items;
	}
	
	
	public List<LibraryItem> searchLibraryItems(String type, String search){
		List<LibraryItem> items = new ArrayList<LibraryItem>();  
		libraryItemRepository.findByTypeContainingAndNameContaining(type, search).forEach(item -> items.add(item));  
		return items;
	}
	
	public LibraryItem deleteItem(int id) {
		LibraryItem item = libraryItemRepository.findById(id);
		libraryItemRepository.delete(item);
		return item;
	}
	
	
	//Online exam ...........................................................................
	
	public List<Subject> getAllSubjects(){
		List<Subject> subjects = new ArrayList<Subject>();  		
		subjectRepository.findAll().forEach(sub -> subjects.add(sub));  
		return subjects;
	}
	
	public List<StudyMaterial> searchOnlineExamsWithSubject(int subjectId, String search){
		List<StudyMaterial> items = new ArrayList<StudyMaterial>();  
		
		//get material type
		MaterialType materialType = materialTypeRepository.findByMaterialType("Exam Paper");
		int materialTypeId = 0;
		if(materialType != null) {
			materialTypeId = materialType.getMaterialTypeId();
		}
		studyMaterialRepository.findByDocumentTypeAndSubjectIdAndDescriptionContaining(materialTypeId, subjectId, search).forEach(item -> items.add(item));  
		return items;
	}
	
	
	public List<StudyMaterial> searchOnlineExamsWithoutSubject(String search){
		List<StudyMaterial> items = new ArrayList<StudyMaterial>();  
		
		//get material type
		MaterialType materialType = materialTypeRepository.findByMaterialType("Exam Paper");
		int materialTypeId = 0;
		if(materialType != null) {
			materialTypeId = materialType.getMaterialTypeId();
		}
		studyMaterialRepository.findByDocumentTypeAndDescriptionContaining(materialTypeId, search).forEach(item -> items.add(item));  
		return items;
	}
	
	
	public StudyMaterial getStudyMaterial(int documentId) {
		StudyMaterial material = studyMaterialRepository.findByDocumentId(documentId);
		return material;
	}
}

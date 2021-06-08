package com.app.university.study_material;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.university.subject.LectureSubject;
import com.app.university.subject.LetureSubjectRepositary;
import com.app.university.subject.Subject;
import com.app.university.subject.SubjectRepositary;
import com.app.university.user.UserProfile;

import antlr.StringUtils;

@Controller
public class StudyMaterialController {

	@Value("${file.upload-path2}")
	private String fileUploadPath;
	
	@Autowired
	StudyMaterialRepositary studyMaterialRepositary;	
	@Autowired
	SubjectRepositary subjectRepositary;
	
	@Autowired
	LetureSubjectRepositary lectureSubjectRepositary;
	
	@Autowired
	MaterialTypeRepositary materialTypeRepositary;
	
	@Autowired
	EntityManagerFactory entityManagerFactory;
	
	@GetMapping("/loadLectureMaterialHandling")
	public String loadLectureMaterialHandling(Model model) {
			StudyMaterial studyMaterial=new StudyMaterial();
			ArrayList<Subject> subjectList=new ArrayList<Subject>();
			//subjectList=lectureSubjectRepositary.getAllSubjectsAssingedToLecture(1);
			subjectList=subjectRepositary.findAllSubjects(1);
			ArrayList<MaterialType>materialTypeList=new ArrayList<MaterialType>();
			materialTypeList=(ArrayList<MaterialType>) materialTypeRepositary.findAll();
			model.addAttribute("study_material",studyMaterial);
			model.addAttribute("subjectList",subjectList);
			model.addAttribute("materilTypeList",materialTypeList);
			
		
		return"views/lectureMaterialUplod";
	}
	
	
	@GetMapping("/viewUplodedMaterail")
	public String viewUplodedMaterail(Model model) {
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int uId=details.getUser().getUserId();
		EntityManager em = entityManagerFactory.createEntityManager();
		String jpaQuery = "SELECT lecture.f_name,subject.subject_code,study_material.document_id,study_material.description,study_material.file_name,study_material.file_path,material_type.material_type,study_material. status FROM study_material INNER JOIN material_type ON study_material.document_type = material_type.material_type_id INNER JOIN lecture ON study_material.user_id = lecture.user_id INNER JOIN subject ON study_material.subject_id = subject.subject_id WHERE study_material. status =:status AND study_material.user_id =:uId ";
		  Query query= em.createNativeQuery(jpaQuery);
		  query.setParameter("status", 1);
		  query.setParameter("uId", uId);
		  List<Object[]> resultList  = query.getResultList();
		  resultList.forEach(t -> {
			  HashMap<String, Object> results = new HashMap<String, Object>();
			  results.put("fName", t[0]);
			  results.put("subjetCode", t[1]);
			  results.put("documnetId", t[2]);
			  results.put("description", t[3]);
			  results.put("fileName", t[4]);
			  results.put("filePath", t[5]);
			  results.put("materialType", t[6]);
			  results.put("status", t[7]);
			  System.out.println(t);
			  list.add(results);
		  });
				
		model.addAttribute("materialList", list);
		model.getAttribute("materialList");
		return "views/studyMaterialview";
	}
	
	
	@PostMapping("/uploadlecturematerial")
	public ModelAndView saveDocument(@ModelAttribute(name = "subject") Subject subject,
			@ModelAttribute(name = "materaial_type") MaterialType materialType,
			@RequestParam("fileImage") MultipartFile multipartFile, @ModelAttribute("description") String description,Model model) {
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		StudyMaterial studyMaterial = new StudyMaterial();
		String fileName = org.springframework.util.StringUtils.cleanPath(multipartFile.getOriginalFilename());
		studyMaterial.setFileName(fileName);
		studyMaterial.setUserId(details.getUser().getUserId());
		studyMaterial.setDescription(description);
		studyMaterial.setSubjectId(subject.getSubjectId());
		studyMaterial.setDocumentType(materialType.getMaterialTypeId());
		studyMaterial.setStatus(1);
		
		StudyMaterial savedStudyMaterial = studyMaterialRepositary.save(studyMaterial);
		int doc_id = savedStudyMaterial.getDocumentId();

		String uplodDir = fileUploadPath+"/" + doc_id;

		Path uploadedPath = Paths.get(uplodDir);

		if (!Files.exists(uploadedPath)) {

			try {
				Files.createDirectories(uploadedPath);

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		try {
			InputStream inputStream = multipartFile.getInputStream();
			Path filePath = uploadedPath.resolve(fileName);
			String absoluteFilePath=filePath.toFile().getAbsolutePath();
			//update file absolute file path in the data base
			savedStudyMaterial.setFilePath(absoluteFilePath);
			studyMaterialRepositary.save(savedStudyMaterial);
			
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Subject> subjectList=new ArrayList<Subject>();
		subjectList=subjectRepositary.findAllSubjects(1);
		ArrayList<MaterialType>materialTypeList=new ArrayList<MaterialType>();
		materialTypeList=(ArrayList<MaterialType>) materialTypeRepositary.findAll();
		model.addAttribute("study_material", savedStudyMaterial);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("materilTypeList",materialTypeList);
		//return "views/lectureMaterialUplod";
		return new ModelAndView("redirect:/loadLectureMaterialHandling");
	
	}
	
	@GetMapping("deleteStudyematerial/doc_id{doc_id}")
	public @ResponseBody int deleteStudymaterail(@PathVariable("doc_id") int doc_id) {
		StudyMaterial materialTodelete = studyMaterialRepositary.getOne(doc_id);
		materialTodelete.setStatus(0);
		StudyMaterial updated = studyMaterialRepositary.save(materialTodelete);
		int update_status = 0;
		if (updated == null) {
			update_status = 0;
		} else if (updated != null) {
			update_status = 1;
		}
		return update_status;
	}


	
}
	
	
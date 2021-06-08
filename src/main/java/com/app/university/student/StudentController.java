package com.app.university.student;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.sql.SQLIntegrityConstraintViolationException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.app.university.library.LibraryItemService;
import com.app.university.result.PDFExpoter;
import com.app.university.result.StudentExam;
import com.app.university.study_material.StudyMaterial;
import com.app.university.user.User;
import com.app.university.user.UserProfile;
import com.app.university.user.UserService;
import com.lowagie.text.DocumentException;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	@Autowired
	private UserService userService;
	@Autowired
	private LibraryItemService libraryItemSerive;
	
	@Value("${img.upload-path}")
	private String imgUploadPath;
	
	@RequestMapping(value="/student-registration", method = RequestMethod.GET)
    public ModelAndView showLoginPage(ModelMap model){
  		return new ModelAndView("student/registration", "student", new Student());
    }
	
	
	@RequestMapping(value="/student-view/{studentId}", method = RequestMethod.GET)
    public ModelAndView viewStudent(ModelMap map, @PathVariable("studentId") int studentId){
		
		Student student = studentService.getStudent(studentId);
		map.addAttribute("student", student);
		
		if(student.getStatus().equals("NEW")) {
			map.addAttribute("olQualifications", studentService.getOLQualifications(studentId));
			map.addAttribute("alQualifications", studentService.getALQualifications(studentId));
			
			StudentQualification olQualification = new StudentQualification();
			olQualification.setStudentId(studentId);
			
			StudentQualification alQualification = new StudentQualification();
			alQualification.setStudentId(studentId);
			
			map.addAttribute("olQualification", olQualification);
			map.addAttribute("alQualification", alQualification);
			return new ModelAndView("student/registration", map);			
		}
		else {
			return new ModelAndView("redirect:/");
		}		
    }
	
	
	@PostMapping(value="/student-qualification-save")
	public ModelAndView saveStudentQualification(@Valid StudentQualification studentQualification, BindingResult bindingResult, ModelMap map){
		if (bindingResult.hasErrors()) {
			
			map.addAttribute("student", studentService.getStudent(studentQualification.getStudentId()));
			map.addAttribute("olQualifications", studentService.getOLQualifications(studentQualification.getStudentId()));
			map.addAttribute("alQualifications", studentService.getALQualifications(studentQualification.getStudentId()));
			
			if(studentQualification.getExam().equals("O/L")) {
				StudentQualification alQualification = new StudentQualification();
				alQualification.setStudentId(studentQualification.getStudentId());
				
				map.addAttribute("olQualification", studentQualification);
				map.addAttribute("alQualification", alQualification);
			}
			else {
				StudentQualification olQualification = new StudentQualification();
				olQualification.setStudentId(studentQualification.getStudentId());
				
				map.addAttribute("olQualification", olQualification);
				map.addAttribute("alQualification", studentQualification);
			}
			
			return new ModelAndView("student/registration", map);
        }
		studentService.saveOrUpdateQualification(studentQualification);
		
		return new ModelAndView("redirect:/student-view/" + studentQualification.getStudentId(), map);
    }
	
	
	//save student
	@PostMapping(value="/student-save")
	public ModelAndView saveStudent(@Valid Student student, BindingResult bindingResult, ModelMap map){
		if (bindingResult.hasErrors()) {
			
			if(student.getStudentId() > 0) {
				map.addAttribute("olQualifications", studentService.getOLQualifications(student.getStudentId()));
				map.addAttribute("alQualifications", studentService.getALQualifications(student.getStudentId()));
				
				StudentQualification olQualification = new StudentQualification();
				olQualification.setStudentId(student.getStudentId());
				
				StudentQualification alQualification = new StudentQualification();
				alQualification.setStudentId(student.getStudentId());
				
				map.addAttribute("olQualification", olQualification);
				map.addAttribute("alQualification", alQualification);
			}			
			
			return new ModelAndView("student/registration", map);
        }
		studentService.saveOrUpdate(student);		
		
		return new ModelAndView("redirect:/student-view/" + student.getStudentId(), map);
    }
	
	
	@GetMapping(value="/student-qualification-delete/{qualificatinId}")
    public ModelAndView deleteStudentQualification(ModelMap map, @PathVariable("qualificatinId") int qualificatinId){
		
		StudentQualification qualificatin = studentService.deleteStudentQualification(qualificatinId);
		return new ModelAndView("redirect:/student-view/" + qualificatin.getStudentId(), map);
    }
	
	
	@RequestMapping(value="/student-registration-finish/{studentId}", method = RequestMethod.GET)
    public ModelAndView finishStudentRegistration(ModelMap map, @PathVariable("studentId") int studentId){
		Student student = studentService.getStudent(studentId);
		student.setStatus("PENDING");
		studentService.saveOrUpdate(student);
		return new ModelAndView("redirect:/");
	}
	
	
	
	
	//json responses
	
	@GetMapping(value="/students-get-pending")
    public @ResponseBody HashMap<String, Object> getPendingStudents(){
		
		HashMap<String, Object> data = new HashMap<>();
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return data;
		}	
		
		data.put("data", studentService.getPendingStudents());
		return data;
    }
	
	@GetMapping(value="/students-get-foundation")
    public @ResponseBody HashMap<String, Object> getFoundationStudents(){
		HashMap<String, Object> data = new HashMap<>();
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return data;
		}
		
		data.put("data", studentService.getFoundationStudents());
		return data;
    }
	
	
	@GetMapping(value="/students-get-visa")
    public @ResponseBody HashMap<String, Object> getVisaStudents(){
		HashMap<String, Object> data = new HashMap<>();
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return data;
		}
		
		data.put("data", studentService.getVisaStudents());
		return data;
    }
	
	
	@GetMapping(value="/students-get-image/{studentId}")
	public ResponseEntity<byte[]> getTemporaryDocument(@PathVariable("studentId") int studentId) {
    	ResponseEntity<byte[]> response = null;
    	try
    	{    
    		Student student = studentService.getStudent(studentId);
    		File file = new File(student.getProfileImagePath());
    		Path path = Paths.get(file.getPath());
    		byte[] contents = Files.readAllBytes(path);

	        HttpHeaders headers = new HttpHeaders();		       	      
	        headers.setContentType(MediaType.parseMediaType("image/jpeg"));
	        String filename = studentId + "";
	        headers.setContentDispositionFormData(filename, filename);
	        headers.setCacheControl("must-revalidate, post-check=0, pre-check=0");
	        response = new ResponseEntity<byte[]>(contents, headers, HttpStatus.OK);
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
        return response;
    }
	
	
	//student profile functions .........................................	
	
	
	
	@RequestMapping(value="/student-dashboard", method = RequestMethod.GET)
    public ModelAndView showLoginPage(ModelMap model, Principal auth){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("STUDENT")) {
			return new ModelAndView("403");
		}
		
  		return new ModelAndView("student/dashboard");
    }
	
	@RequestMapping(value="/student-profile", method = RequestMethod.GET)
    public String showStudentProfile(ModelMap map, Authentication auth){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("STUDENT")) {
			return "403";
		}	
		
		int studentId = details.getUser().getUserId();
		
		map.addAttribute("student", studentService.getStudent(studentId));
		map.addAttribute("olQualifications", studentService.getOLQualifications(studentId));
		map.addAttribute("alQualifications", studentService.getALQualifications(studentId));
		
		StudentQualification olQualification = new StudentQualification();
		olQualification.setStudentId(studentId);
		
		StudentQualification alQualification = new StudentQualification();
		alQualification.setStudentId(studentId);
		
		map.addAttribute("olQualification", olQualification);
		map.addAttribute("alQualification", alQualification);
		
		//check has an user profile
		User userProfile = userService.findByUserTypeAndUserId("STUDENT", studentId);
		if(userProfile == null) {
			userProfile = new User();
			userProfile.setUserType("STUDENT");
			userProfile.setUserId(studentId);
		}
		
		map.addAttribute("user", userProfile);
		
		return "student/student_profile";
    }	
	
	//Administration functions .....................................
	
	@RequestMapping(value="/admin-student-view/{studentId}", method = RequestMethod.GET)
    public String adminViewStudent(ModelMap map, @PathVariable("studentId") int studentId){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return "403";
		}
		
		map.addAttribute("student", studentService.getStudent(studentId));
		map.addAttribute("olQualifications", studentService.getOLQualifications(studentId));
		map.addAttribute("alQualifications", studentService.getALQualifications(studentId));
		
		StudentQualification olQualification = new StudentQualification();
		olQualification.setStudentId(studentId);
		
		StudentQualification alQualification = new StudentQualification();
		alQualification.setStudentId(studentId);
		
		map.addAttribute("olQualification", olQualification);
		map.addAttribute("alQualification", alQualification);
		
		//check has an user profile
		User userProfile = userService.findByUserTypeAndUserId("STUDENT", studentId);
		if(userProfile == null) {
			userProfile = new User();
			userProfile.setUserType("STUDENT");
			userProfile.setUserId(studentId);
		}
		
		map.addAttribute("user", userProfile);
		
		return "student/student_view";
    }
	
	
	@GetMapping(value="/admin-student-delete/{studentId}")
    public ModelAndView deleteStudent(ModelMap map, @PathVariable("studentId") int studentId){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		studentService.deleteStudent(studentId);
		return new ModelAndView("redirect:/admin-student-pending" , map);
    }
	
	
	//save student
	@PostMapping(value="/admin-student-save")
	public ModelAndView adminSaveStudent(@Valid Student student, BindingResult bindingResult, ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		if (bindingResult.hasErrors()) {
			
			if(student.getStudentId() > 0) {
				map.addAttribute("olQualifications", studentService.getOLQualifications(student.getStudentId()));
				map.addAttribute("alQualifications", studentService.getALQualifications(student.getStudentId()));
				
				StudentQualification olQualification = new StudentQualification();
				olQualification.setStudentId(student.getStudentId());
				
				StudentQualification alQualification = new StudentQualification();
				alQualification.setStudentId(student.getStudentId());
				
				map.addAttribute("olQualification", olQualification);
				map.addAttribute("alQualification", alQualification);
			}			
			
			return new ModelAndView("student/student_view", map);
        }
		studentService.saveOrUpdate(student);		
		
		return new ModelAndView("redirect:/admin-student-view/" + student.getStudentId(), map);
    }
	
	
	@PostMapping(value="/admin-student-qualification-save")
	public ModelAndView adminSaveStudentQualification(@Valid StudentQualification studentQualification, BindingResult bindingResult, ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		if (bindingResult.hasErrors()) {
			
			map.addAttribute("student", studentService.getStudent(studentQualification.getStudentId()));
			map.addAttribute("olQualifications", studentService.getOLQualifications(studentQualification.getStudentId()));
			map.addAttribute("alQualifications", studentService.getALQualifications(studentQualification.getStudentId()));
			
			if(studentQualification.getExam().equals("O/L")) {
				StudentQualification alQualification = new StudentQualification();
				alQualification.setStudentId(studentQualification.getStudentId());
				
				map.addAttribute("olQualification", studentQualification);
				map.addAttribute("alQualification", alQualification);
			}
			else {
				StudentQualification olQualification = new StudentQualification();
				olQualification.setStudentId(studentQualification.getStudentId());
				
				map.addAttribute("olQualification", olQualification);
				map.addAttribute("alQualification", studentQualification);
			}
			
			return new ModelAndView("student/student_view", map);
        }
		studentService.saveOrUpdateQualification(studentQualification);
		
		return new ModelAndView("redirect:/admin-student-view/" + studentQualification.getStudentId(), map);
    }
	
	
	@GetMapping(value="/admin-student-qualification-delete/{qualificatinId}")
    public ModelAndView adminDeleteStudentQualification(ModelMap map, @PathVariable("qualificatinId") int qualificatinId){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		StudentQualification qualificatin = studentService.deleteStudentQualification(qualificatinId);
		return new ModelAndView("redirect:/admin-student-view/" + qualificatin.getStudentId(), map);
    }
	
	
	@RequestMapping(value="/admin-student-pending", method = RequestMethod.GET)
    public ModelAndView adminShowPendingStudents(ModelMap model){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		return new ModelAndView("student/pending_students");
    }
	
	
	@RequestMapping(value="/admin-student-foundation", method = RequestMethod.GET)
    public ModelAndView adminShowFoundationStudents(ModelMap model){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		return new ModelAndView("student/foundation_students");
    }
	
	
	@RequestMapping(value="/admin-student-visa", method = RequestMethod.GET)
    public ModelAndView adminShowVisaStudents(ModelMap model){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		return new ModelAndView("student/visa_students");
    }
	
	
	@RequestMapping(value="/admin-student-send-foundation/{studentId}", method = RequestMethod.GET)
    public ModelAndView sendToFoundationProcess(ModelMap map, @PathVariable("studentId") int studentId){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		Student student = studentService.getStudent(studentId);
		student.setStatus("FOUNDATION");
		studentService.saveOrUpdate(student);
		return new ModelAndView("redirect:/admin-student-view/" + studentId);
	}
	
	@RequestMapping(value="/admin-student-send-visa/{studentId}", method = RequestMethod.GET)
    public ModelAndView sendToVisaProcess(ModelMap map, @PathVariable("studentId") int studentId){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		Student student = studentService.getStudent(studentId);
		student.setStatus("VISA");
		studentService.saveOrUpdate(student);
		return new ModelAndView("redirect:/admin-student-view/" + studentId);
	}
	
	
	@PostMapping(value="/admin-student-profile-save")
	public ModelAndView adminSaveStudentProfile(@Valid User user, BindingResult bindingResult, ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		Student student = studentService.getStudent(user.getUserId());
		if (bindingResult.hasErrors()) {
			
				
				map.addAttribute("olQualifications", studentService.getOLQualifications(student.getStudentId()));
				map.addAttribute("alQualifications", studentService.getALQualifications(student.getStudentId()));
				
				StudentQualification olQualification = new StudentQualification();
				olQualification.setStudentId(student.getStudentId());
				
				StudentQualification alQualification = new StudentQualification();
				alQualification.setStudentId(student.getStudentId());
				
				map.addAttribute("olQualification", olQualification);
				map.addAttribute("alQualification", alQualification);
				map.addAttribute("student", student);
				
			return new ModelAndView("student/student_view", map);
        }		
		userService.save(user);
		return new ModelAndView("redirect:/admin-student-view/" + student.getStudentId(), map);
    }
	
	
	@GetMapping(value="/students-list-print/{type}")
    public void print(@PathVariable("type") String type, HttpServletResponse response) throws DocumentException, IOException {
				
		response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());
         
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=students_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);
         
        List<Student> students = null;
        String title = "";
        
        if(type.equals("PENDING")) {
        	students = studentService.getPendingStudents();
        	title = "Pending Students";
        }
        else if(type.equals("FOUNDATION")) {
        	students = studentService.getFoundationStudents();
        	title = "Foundation Students";
        }
        else if(type.equals("VISA")) {
        	students = studentService.getVisaStudents();
        	title = "Visa Students";
        }        
         
        StudentPDFExpoter exporter = new StudentPDFExpoter(students);
        exporter.export(response, title);
    }
	
	
	//online exam answers upload ............................................
	
	@GetMapping(value="/student-exam-answer-upload")
	public ModelAndView answersUpload(ModelMap map, @RequestParam(required = false) Integer subjectId){	
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("STUDENT")) {
			return new ModelAndView("403");
		}
		ExamAnswer examAnswer = new ExamAnswer();
		examAnswer.setStudentId(details.getUser().getUserId());
		
		if(subjectId == null || subjectId == 0) {
			map.addAttribute("exams", new ArrayList<StudyMaterial>());
		}
		else {
			map.addAttribute("exams", libraryItemSerive.searchOnlineExamsWithSubject(subjectId, ""));
			examAnswer.setSubjectId(subjectId);
		}		
		
		map.addAttribute("examAnswer", examAnswer);
		map.addAttribute("subjects", libraryItemSerive.getAllSubjects());
		return new ModelAndView("student/exam_answer", map);
    }
	
	
	@PostMapping(value="/student-exam-answer-save")
	public ModelAndView saveExamAnswer(@Valid ExamAnswer examAnswer, BindingResult bindingResult, ModelMap map){
		if (bindingResult.hasErrors()) {			
			return new ModelAndView("student/exam_answer", map);
        }
		studentService.saveExamAnswer(examAnswer);
		
		return new ModelAndView("redirect:/student-dashboard", map);
    }
}

package com.app.university.result;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.university.student.Student;
import com.app.university.student.StudentQualification;
import com.app.university.student.StudentService;
import com.app.university.user.UserProfile;
import com.lowagie.text.DocumentException;


@Controller
public class ResultController {
	
	@Autowired
	private ResultService resultService;
	
	@Autowired
	private StudentService studentService;

	@GetMapping(value="/results-add")
    public ModelAndView showLoginPage(ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		map.addAttribute("studentExam", new StudentExam());
		map.addAttribute("examResult", new ExamResult());
  		return new ModelAndView("result/result", map);
    }
	
	
	@GetMapping(value="/results")
    public ModelAndView showResultsPage(ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
  		return new ModelAndView("result/results", map);
    }
	
	
	@PostMapping(value="/results-exam-save")
	public ModelAndView saveResult(@Valid StudentExam studentExam, BindingResult bindingResult, ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		if (bindingResult.hasErrors()) {
			
			if(studentExam.getId() > 0) {
				map.addAttribute("examResultSubjects", resultService.getExamResults(studentExam));
				ExamResult examResult = new ExamResult();
				examResult.setStudentExam(studentExam);
				map.addAttribute("examResult", examResult);
			}			
			
			return new ModelAndView("result/result", map);
        }
		resultService.saveOrUpdate(studentExam);		
		
		return new ModelAndView("redirect:/results-exam-view/" + studentExam.getId(), map);
    }
	
	
	@PostMapping(value="/results-exam-subjects-save")
	public ModelAndView saveExamResult(@Valid ExamResult examResult, BindingResult bindingResult, ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		if (bindingResult.hasErrors()) {
			
			StudentExam studentExam = examResult.getStudentExam();
			map.addAttribute("examResultSubjects", resultService.getExamResults(examResult.getStudentExam()));
			map.addAttribute("studentExam", studentExam);
			map.addAttribute("examResultSubjects", resultService.getExamResults(studentExam));
			
			return new ModelAndView("result/result", map);
        }
		resultService.saveOrUpdateResults(examResult);		
		
		return new ModelAndView("redirect:/results-exam-view/" + examResult.getStudentExam().getId(), map);
    }
	
	
	@GetMapping(value="/results-exam-view/{id}")
	public ModelAndView viewResult(@PathVariable("id") int id, ModelMap map){		
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		StudentExam studentExam = resultService.getStudentExam(id);
		ExamResult examResult = new ExamResult();
		examResult.setStudentExam(studentExam);
		
		map.addAttribute("examResult", examResult);		
		map.addAttribute("studentExam", studentExam);
		map.addAttribute("examResultSubjects", resultService.getExamResults(studentExam));
		return new ModelAndView("result/result", map);
    }
	
	
	@GetMapping(value="/results-exam-delete/{id}")
    public ModelAndView deleteStudentExam(ModelMap map, @PathVariable("id") int id) {				
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		resultService.deleteStudentExam(id);
		return new ModelAndView("redirect:/results" , map);
    }
	
	
	
	@GetMapping(value="/results-exam-subjects-delete/{id}")
    public ModelAndView deleteExamSubject(ModelMap map, @PathVariable("id") int id){
			
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		ExamResult examResult = resultService.deleteExamResult(id);
		return new ModelAndView("redirect:/results-exam-view/" + examResult.getStudentExam().getId() , map);
    }
	
	@GetMapping(value="/results-print/{studentId}")
    public void print(@PathVariable("studentId") int studentId, HttpServletResponse response) throws DocumentException, IOException {
				
		response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());
         
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=result_sheet_" + currentDateTime + ".pdf";
        response.setHeader(headerKey, headerValue);
         
        List<StudentExam> exams = resultService.getStudentExams(studentId);
        Student student = studentService.getStudent(studentId);
         
        PDFExpoter exporter = new PDFExpoter(student, exams);
        exporter.export(response);
    }
	
	
	@GetMapping(value="/results-list")
    public @ResponseBody HashMap<String, Object> getLibraryItems(){	
		
		HashMap<String, Object> data = new HashMap<>();			
		data.put("data", resultService.getAllStudentExams());
		return data;
    }
	
}

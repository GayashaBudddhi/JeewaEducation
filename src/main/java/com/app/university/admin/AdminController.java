package com.app.university.admin;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.university.student.ContactMessage;
import com.app.university.student.ContactMessageService;
import com.app.university.student.Student;
import com.app.university.student.StudentService;
import com.app.university.user.UserProfile;
import com.sun.security.auth.UserPrincipal;



@Controller
public class AdminController {
	
	@Autowired
	private ContactMessageService contactMessageService;
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value="/admin-dashboard", method = RequestMethod.GET)
    public ModelAndView showLoginPage(ModelMap model, Principal auth){

		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
  		return new ModelAndView("admin/dashboard");
    }
	//get admin lecture dash board
	@RequestMapping(value="/admin-lecture-dashboard", method = RequestMethod.GET)
    public ModelAndView showLectureAdminDashboard(ModelMap model, Principal auth){

		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN-LECTURE")) {
			return new ModelAndView("403");
		}
		
  		return new ModelAndView("admin/dashboard_lecture_handling");
    }
	
	
	@RequestMapping(value="/admin-library-dashboard", method = RequestMethod.GET)
    public ModelAndView showLibraryAdminDashboard(ModelMap model, Principal auth){

		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
  		return new ModelAndView("admin/dashboard_library_handling");
    }
	
	
	
	@GetMapping(value="/admin-messages")
    public ModelAndView showMessagesPage(ModelMap model){	
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
  		return new ModelAndView("admin/messages");
    }
	
	
	@GetMapping(value="/admin-get-messages")
    public @ResponseBody HashMap<String, Object> getPendingStudents(){
		HashMap<String, Object> data = new HashMap<>();
		data.put("data", contactMessageService.getMessages());
		return data;
    }
	
	
	@RequestMapping(value="/admin-read-message/{id}", method = RequestMethod.GET)
    public ModelAndView finishStudentRegistration(ModelMap map, @PathVariable("id") int id){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		ContactMessage message = contactMessageService.getMessage(id);
		message.setStatus("READ");
		contactMessageService.saveOrUpdate(message);
		return new ModelAndView("redirect:/admin-messages");
	}
	
	
	@RequestMapping(value="/admin-delete-message/{id}", method = RequestMethod.GET)
    public ModelAndView deleteMessage(ModelMap map, @PathVariable("id") int id){	
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		contactMessageService.deleteMessage(id);
		return new ModelAndView("redirect:/admin-messages");
	}
	
	
	@RequestMapping(value="/admin-message-view/{id}", method = RequestMethod.GET)
    public ModelAndView viewMessage(ModelMap map, @PathVariable("id") int id){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN")) {
			return new ModelAndView("403");
		}
		
		ContactMessage message = contactMessageService.getMessage(id);
		Student student = studentService.getStudent(message.getStudentId());
		map.addAttribute("contactMessage", message);
		map.addAttribute("student", student);
		return new ModelAndView("admin/message_view", map);
	}
	
	@GetMapping(value="/admin-get-chart-data")
    public @ResponseBody HashMap<String, Object> getChartData(){
		HashMap<String, Object> data = new HashMap<>();
		data.put("pending", studentService.getPendingStudents().size());
		data.put("foundation", studentService.getFoundationStudents().size());
		data.put("visa", studentService.getVisaStudents().size());
		return data;
    }
	
	
	@GetMapping(value="/error-403")
    public String error403(){
		return "403";
    }
}

package com.app.university.student;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.app.university.user.UserProfile;
import com.app.university.user.UserService;

@Controller
public class ContactMessageController {

	@Autowired
	private ContactMessageService contactMessageService;
	@Autowired
	private StudentService studentService;
	
		
	@RequestMapping(value="/student-contact-admin", method = RequestMethod.GET)
    public ModelAndView showContactAdminPage(ModelMap map, Principal auth){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("STUDENT")) {
			return new ModelAndView("403");
		}
	
		int studentId = details.getUser().getUserId();
		map.addAttribute("student", studentService.getStudent(studentId));
		
		ContactMessage message = new ContactMessage();
		message.setStudentId(studentId);
		message.setStatus("UNREAD");
		
		map.addAttribute("contactMessage", message);
  		return new ModelAndView("student/contact_admin");
    }
	
	
	@PostMapping(value="/student-contact-message-save")
	public ModelAndView saveContactAdminMessage(@Valid ContactMessage contactMessage, BindingResult bindingResult, ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("STUDENT")) {
			return new ModelAndView("403");
		}
		
		if (bindingResult.hasErrors()) {				
			
			return new ModelAndView("student/contact_admin", map);
        }
		contactMessageService.saveOrUpdate(contactMessage);		
		
		return new ModelAndView("redirect:/student-contact-admin", map);
    }
	
}

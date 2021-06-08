package com.app.university.scholarships;

import java.util.HashMap;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.university.user.UserProfile;

@Controller
public class ScholarshipController {
	
	@Autowired
	private ScholarshipService scholarshipService;
	
	/*@GetMapping(value="/scholarship-add")
    public ModelAndView showLoginPage(ModelMap map){
		map.addAttribute("scholarship", new Scholarship());
  		return new ModelAndView("scholarship/scholarship", map);
    }*/
	
	@GetMapping(value="/scholarships")
    public ModelAndView showResultsPage(ModelMap map){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		map.addAttribute("scholarship", new Scholarship());
  		return new ModelAndView("scholarship/scholarship", map);
    }
	
	
	@PostMapping(value="/scholarship-save")
	public ModelAndView saveScholarship(@Valid Scholarship scholarship, BindingResult bindingResult, ModelMap map){
			
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		if (bindingResult.hasErrors()) {
			return new ModelAndView("scholarship/scholarship", map);
        }
		scholarshipService.saveOrUpdate(scholarship);		
		
		return new ModelAndView("redirect:/scholarships", map);
    }
	
	
	@GetMapping(value="/scholarship-view/{id}")
	public ModelAndView viewScholoarship(@PathVariable("id") int id, ModelMap map){		
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		Scholarship scholarship = scholarshipService.getScholarship(id);		
		map.addAttribute("scholarship", scholarship);	
		return new ModelAndView("scholarship/scholarship", map);
    }
	
	
	@GetMapping(value="/scholarship-delete/{id}")
    public ModelAndView deleteScholarship(ModelMap map, @PathVariable("id") int id) {	
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("ADMIN_LIBRARY")) {
			return new ModelAndView("403");
		}
		
		scholarshipService.deleteScholarship(id);
		return new ModelAndView("redirect:/scholarships" , map);
    }
	
	
	@GetMapping(value="/scholarship-list")
    public @ResponseBody HashMap<String, Object> getLibraryItems(){
		
		HashMap<String, Object> data = new HashMap<>();			
		data.put("data", scholarshipService.getAllScholarships());
		return data;
    }
}

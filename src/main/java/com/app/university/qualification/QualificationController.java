package com.app.university.qualification;

import java.util.ArrayList;

import org.hibernate.annotations.MetaValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.gson.GsonAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.app.university.lecture.Lecture;
import com.app.university.lecture.LectureRepositary;

@RestController
public class QualificationController {
	@Autowired
	QualificationRepositary qualificationRepositary;
	@Autowired
	LectureRepositary userRepositary;
	
	@RequestMapping(value="/qulificationSave",method = RequestMethod.POST)
	public 
	@ResponseBody
	int saveQulification(@ModelAttribute("qulification") Qualification qulification,Model model) {
		qulification.setStatus("active");
		qualificationRepositary.save(qulification);
		Lecture user=userRepositary.getOne(qulification.getUserId());
		ArrayList<Qualification> qualifiactionList=new ArrayList<Qualification>();
		qualifiactionList=qualificationRepositary.findAllQulificationsofUser(qulification.getUserId(),"active");
		Qualification newQualification=new Qualification();
		model.addAttribute("user",user);
		model.addAttribute("qualificationList",qualifiactionList);
		model.addAttribute("qulification",newQualification);
		return qulification.getUserId();
	}
	
	@RequestMapping(value="/getQualification/userId{userId}",method = RequestMethod.GET)
	public @ResponseBody
	
	ArrayList<Qualification> getUserQulificationByid(@PathVariable("userId") Integer userId) {
		System.out.println(userId);
		ArrayList<Qualification> qualification=new ArrayList<Qualification>();
		qualification=qualificationRepositary.findAllQulificationsofUser(userId,"active");
		
		//return mav.addObject("qualifiaction",qualification);
		return qualification;
		
	}
	
	@RequestMapping(value="/deleteQaulification/qualificationId{qualificationId}",method = RequestMethod.GET)
	public @ResponseBody
	int deleteQulification(@PathVariable("qualificationId") Integer qualificationId) {
		
		Qualification qualification=new Qualification();
		
		qualification=qualificationRepositary.getOne(qualificationId);
		qualification.setStatus("inActive");
		Qualification savedQulifaictin=qualificationRepositary.save(qualification);
		if(savedQulifaictin!=null) {
			return 1;
		}
		else
		return 0;
	}
	
	
	
}

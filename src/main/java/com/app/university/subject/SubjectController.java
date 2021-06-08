package com.app.university.subject;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.app.university.lecture.Lecture;
import com.app.university.lecture.LectureRepositary;
import com.app.university.user.UserProfile;
import com.sun.xml.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import antlr.collections.List;

@Controller
public class SubjectController {
	
	
@Autowired 
SubjectRepositary subjectRepositary;
@Autowired
LetureSubjectRepositary lectureSubjectRepositary;
@Autowired
LectureRepositary userRepositary;

	
	
	@RequestMapping(value="/getAllSubjects{userId}",method=RequestMethod.GET)
public
 
@ResponseBody HashMap<String, ArrayList<Subject>> subjectlist(@PathVariable("userId") Integer userId){
		HashMap<String, ArrayList<Subject>> map = new HashMap<>();
		ArrayList<Subject> assignedSubjects=new ArrayList<Subject>();
	   assignedSubjects=subjectRepositary.getAllSubjectsAssingedToLecture(userId,1);
		
		ArrayList<Subject> subjectList =new ArrayList<Subject>();
		subjectList=subjectRepositary.findAllSubjects(1);
		subjectList.forEach((subject)->{
			subject.setUsers(null);
		});
		
		map.put("assigned", assignedSubjects);
		map.put("unassined", subjectList);
		
		return map;
	}
	
	
	@RequestMapping(value="/saveuserSubjects",method=RequestMethod.POST)
	public 
	@ResponseBody  int saveLeturesubjects(@ModelAttribute("lectureSubjects") LectureSubject lectureSubject,Model model,
			
			@RequestParam("subjectes[]") String subjects,@RequestParam("user_id") Integer userId
			
			) {
		
		subjectRepositary.setAssgnedSubjectInnactive(0, userId);
	
		String[] assignedSubjects=subjects.split("");
		 Integer[] subjectIdArray=new  Integer[assignedSubjects.length];
		 for(int i=0;i<assignedSubjects.length;i++) {
			 subjectIdArray[i]=Integer.parseInt(assignedSubjects[i]);
			 i++;
		 }
		 
;		 Lecture lecture=userRepositary.getOne(userId);
		 java.util.List<Subject> allSubjects=new ArrayList<Subject>();
		 
		 for (int i = 0; i < subjectIdArray.length; i++) {
			if(subjectIdArray[i]!=null) {
				int k=subjectIdArray[i];
			Subject sub= subjectRepositary.getOne(k);
					
			allSubjects.add(sub);
			}
		}
		 lecture.setSubject(allSubjects);
		 lecture=userRepositary.save(lecture);
	
	
	return 1;
    }
	
	
	
	
	
}
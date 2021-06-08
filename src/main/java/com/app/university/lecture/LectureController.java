package com.app.university.lecture;

import org.springframework.validation.BindingResult;

import java.io.IOException;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.app.university.emailConfigaration.EmailConfigaration;
import com.app.university.emailConfigaration.FeedBack;
import com.app.university.emailConfigaration.FeedbackController;
import com.app.university.qualification.Qualification;
import com.app.university.qualification.QualificationRepositary;
import com.app.university.student.Student;
import com.app.university.student.StudentPDFExpoter;
import com.app.university.study_material.StudyMaterial;
import com.app.university.study_material.StudyMaterialRepositary;
import com.app.university.user.Role;
import com.app.university.user.RoleRepository;
import com.app.university.user.User;
import com.app.university.user.UserProfile;
import com.app.university.user.UserService;
import com.lowagie.text.DocumentException;
import com.sun.el.lang.FunctionMapperImpl.Function;

import antlr.collections.List;
@Controller
public class LectureController {
	
	@Autowired
	LectureRepositary userRepositary;
	@Autowired
	QualificationRepositary qualificationRepositary;
	
	@Autowired 
	RoleRepository roleRepository;

	@Autowired
	private EmailConfigaration emailConfigaration;
	
	@Autowired
	private UserService userService;
	
	@Value("${img.upload-path}")
	private String imgUploadPath;
	@GetMapping("/register")
	public String loadUserRegisterform(Model model) {
		
		Lecture user=new Lecture();
		Qualification qulification=new Qualification();
		model.addAttribute("lecture",user);
		model.addAttribute("qulification",qulification);
		System.out.println("load reg from");
		return "views/registerFrom";
	}
	
	@GetMapping("/loadAdminlectureHandling")
	public String loadAdminlectureHandling(Model model) {
		ArrayList<Lecture> users=new ArrayList<Lecture>();
		users=(ArrayList<Lecture>) userRepositary.findAll();
		model.addAttribute("userList",users);
		
		return"views/adminLectureHandling";
	}
	
	

	@RequestMapping(value="/userSave",method=RequestMethod.POST)
	public ModelAndView registration(@Valid Lecture user,BindingResult bindingResult,ModelMap map) {
		
		Lecture  savedUser;
		Qualification qulification=new Qualification();
		if (bindingResult.hasErrors()) {
			
			if(user.getUserId()>0){
				
			Lecture	getalradyExistUser=userRepositary.getOne(user.getUserId());
				map.addAttribute("user",getalradyExistUser);
				map.addAttribute("qulification",qulification);
				
			}
			//map.addAttribute("user",user);
			//map.addAttribute("qulification",qulification);
			return new ModelAndView("views/registerFrom", map);
		}
		
		
		savedUser=userRepositary.save(user);
		qulification=new Qualification();
		map.addAttribute("lecture",savedUser);
		qulification.setUserId(savedUser.getUserId());
		System.out.println(qulification.getUserId());
		map.addAttribute("qulification",qulification);
		return new ModelAndView("views/registerFrom", map);
		

	}
	

	@RequestMapping(value="/lectureupdate",method=RequestMethod.POST)
	public ModelAndView updateLectureDetails(@Valid Lecture user,BindingResult bindingResult,ModelMap map) {
		
		Lecture  savedUser;
		Qualification qulification=new Qualification();
		if (bindingResult.hasErrors()) {
			
			if(user.getUserId()>0){
				
			Lecture	getalradyExistUser=userRepositary.getOne(user.getUserId());
				map.addAttribute("user",getalradyExistUser);
				map.addAttribute("qulification",qulification);
				
			}
			//map.addAttribute("user",user);
			//map.addAttribute("qulification",qulification);
			return new ModelAndView("views/updateLeturedetails", map);
		}
		
		
		savedUser=userRepositary.save(user);
		qulification=new Qualification();
		map.addAttribute("lecture",savedUser);
		qulification.setUserId(savedUser.getUserId());
		System.out.println(qulification.getUserId());
		map.addAttribute("qulification",qulification);
		return new ModelAndView("views/updateLeturedetails", map);
		

	}
	
	
	
	
	
	@RequestMapping(value="/sendtoApprovalLecture/userId{userId}",method = RequestMethod.GET)
	public @ResponseBody int sendtoApprovalLecture(@PathVariable("userId")Integer userId) {
		
		Lecture lecture = userRepositary.getOne(userId);
		lecture.setStatus("PENDING");
	Lecture	savedLecture=userRepositary.save(lecture);
		if(savedLecture!=null) {return 1;}
		else
		return 0;
	}
	
	@RequestMapping(value="/UpdatesendtoApprovalLecture/userId{userId}",method = RequestMethod.GET)
	public @ResponseBody int UpdatesendtoApprovalLecture(@PathVariable("userId")Integer userId) {
		
		Lecture lecture = userRepositary.getOne(userId);
		lecture.setStatus("PENDING-UPDATE");
	 Lecture	savedLecture=userRepositary.save(lecture);
		if(savedLecture!=null) {return 1;}
		else
		return 0;
	}
	
	
	@RequestMapping(value="/lecture-dashboard", method = RequestMethod.GET)
    public ModelAndView showLoginPage(ModelMap model, Principal auth){
		
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(!details.getUser().getUserType().equals("LECTURE")) {
			return new ModelAndView("403");
		}
		
  		return new ModelAndView("lecture/dashboard");
    }
	
	
	
	@RequestMapping(value="/loadUserDetails",method=RequestMethod.GET)
	
	public String loaduserDetails(Model model) {
		//nedd to get user id from login;
		UserProfile details = (UserProfile) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int userId=details.getUser().getUserId();
		Lecture logedUser=new Lecture();
		logedUser=userRepositary.getOne(userId);
		//ArrayList< Qualification> userQualifications=new ArrayList<Qualification>();
		//userQualifications=qualificationRepositary.findAllQulificationsofUser(userId);
		model.addAttribute("lecture",logedUser);
		//model.addAttribute("",userQualifications);
		
		return "views/updateLeturedetails";
	}
	
	@RequestMapping(value="/approveUser/userId{userId}",method=RequestMethod.GET)
	public @ResponseBody
	int approveUser(@PathVariable("userId") Integer userId) {
		System.out.println(userId);
		//create mail sender
		Lecture user=userRepositary.getOne(userId);
		boolean mail_status=user.getStatus().equals("PENDING-UPDATE");
		user.setStatus("APPROVED");
		userRepositary.save(user);
		if(!mail_status)
		this.GenerateEmail(user,"accept");
		
		return userId;
	}
	
@RequestMapping(value="/rejectUser/userId{userId}",method=RequestMethod.GET)
public @ResponseBody
int rejectUser(@PathVariable("userId")Integer userId) {
	
	Lecture user=userRepositary.getOne(userId);
		user.setStatus("REJECTED");
		userRepositary.save(user);

	this.GenerateEmail(user,"reject");
	
	return userId;
}


@GetMapping(value="getLecturereport")
public void print(@RequestParam(name = "reportType") String type, HttpServletResponse response) throws DocumentException, IOException {
			
	response.setContentType("application/pdf");
    DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
    String currentDateTime = dateFormatter.format(new Date());
     
    String headerKey = "Content-Disposition";
    String headerValue = "attachment; filename=Lectures_" + currentDateTime + ".pdf";
    response.setHeader(headerKey, headerValue);
     
    java.util.List<Lecture> lectures = null;
    String title = "";
    
    if(type.equals("APPROVED")) {
    	lectures=this.getAllectursBytype(type);
    	title = "Approved Lectures";
    }
    else if(type.equals("REJECTED")) {
    	lectures=this.getAllectursBytype(type);
    	title = "Rejected Lecturs";
    }
    else if(type.equals("PENDING")){
    	lectures=this.getAllectursBytype(type);
    	title = "Pending Lectures";
    } 
    else if(type.equals("PENDING-UPDATE")){
    	lectures=this.getAllectursBytype(type);
    	title = "Pending Update Lectures";
    }        
     
   LecturePDFExpoter exporter = new LecturePDFExpoter(lectures);
    exporter.export(response, title);
}



public void GenerateEmail(Lecture user, String type) {
	
	//this.emailConfigaration
	JavaMailSenderImpl mailSenderImpl =new JavaMailSenderImpl();
	
	String host=this.emailConfigaration.getHost();
	mailSenderImpl.setHost(this.emailConfigaration.getHost());
	mailSenderImpl.setPort(this.emailConfigaration.getPort());
	mailSenderImpl.setUsername(this.emailConfigaration.getUsername());
	mailSenderImpl.setPassword(this.emailConfigaration.getPassword());
	//create an mail instance
	SimpleMailMessage mailMessage=new SimpleMailMessage();
	
	if(type.equals("accept")==true){
	Lecture updatedUser=this.genarateUserNamePassword(user);
	User saveUserNamepw=new User();
		
	saveUserNamepw.setUsername(updatedUser.getUserName());
	saveUserNamepw.setPassword(updatedUser.getPassword());
	saveUserNamepw.setUserId(updatedUser.getUserId());
	saveUserNamepw.setUserType("LECTURE");
	userService.save(saveUserNamepw);
	mailMessage.setFrom("test@gmail.com");
	mailMessage.setTo(user.getEmail());
	mailMessage.setSubject("new message from "+user.getfName());
	mailMessage.setText("Congratualtions you have Selected As Lecture for SLIIT now you can continue your teaching through the Application. your UserName: "
	+updatedUser.getUserName()+" AND Paassword: "+updatedUser.getPassword());
	}
	
	if(type.equals("reject")==true) {
		mailMessage.setFrom("shiwanvir@gmail.com");
		mailMessage.setTo(user.getEmail());
		mailMessage.setSubject("new message from "+user.getfName());
		mailMessage.setText("Sorry We are Regreart To infom That you are not Selected as Lecture for SLIIT due to the lack of Experience we wish you all the best for your feture"
		);
	}
	//send mail
	 mailSenderImpl.send(mailMessage);

}


public java.util.List<Lecture> getAllectursBytype(String status){
	java.util.List<Lecture> lectures = new ArrayList<Lecture>();  
	userRepositary.getAllectursBytype(status).forEach(lecture -> lectures.add(lecture));  
	return lectures;
}

public Lecture genarateUserNamePassword(Lecture user) {
	
	String nic=user.getNicNo();
	String fname=user.getfName();
	String userId=String.valueOf(user.getUserId());
	String userName=fname.substring(0,2)+userId;
	user.setUserName(userName);
	String password=nic;
	
	 int isUpdated=userRepositary.createUserNamePassword(userName, password, user.getUserId());
	 Lecture updatedUser=userRepositary.getOne(user.getUserId());
	
	return updatedUser;
}
}
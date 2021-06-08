package com.app.university.result;

import org.springframework.stereotype.Service;

@Service
public class GradeService {
	
	public String getGrade(int marks) {
		String grade = "";
		if(marks >= 95) {
			grade = "A+";
		}
		else if(marks >= 85 && marks < 95) {
			grade = "A";
		}
		else if(marks >= 75 && marks < 85) {
			grade = "A-";
		}
		else if(marks >= 70 && marks < 75) {
			grade = "B+";
		}
		else if(marks >= 60 && marks < 70) {
			grade = "B";
		}
		else if(marks >= 55 && marks < 60) {
			grade = "B-";
		}
		else if(marks >= 50 && marks < 55) {
			grade = "C+";
		}
		else if(marks >= 45 && marks < 50) {
			grade = "C";
		}
		else if(marks >= 35 && marks < 45) {
			grade = "C";
		}
		else if(marks < 35) {
			grade = "F";
		}
		
		return grade;
	}

}

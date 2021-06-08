<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Wizard-v4</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Font-->
	<link rel="stylesheet" href="/registration_template/css/opensans-font.css">
	<link rel="stylesheet" href="/registration_template/css/roboto-font.css">
	<link rel="stylesheet" href="/registration_template/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
	<!-- datepicker -->
	<link rel="stylesheet"  href="/registration_template/css/jquery-ui.min.css">
	<!-- Main Style Css -->
	<link rel="stylesheet" href="/registration_template/css/style.css" />
</head>

<body>
	<div class="page-content" style="background-image: url('/registration_template/images/uni.jpg')">
		<div class="wizard-v4-content">
			<div class="wizard-form">
				<div class="wizard-header">
					<h3 class="heading">Student Registration Form</h3>
					<p>Fill all form field to go next step</p>
				</div>
				<div class="form-register" action="#" method="post">
					<div id="form-total">
						<!-- SECTION 1 -->
						<h2>
							<span class="step-icon"><i class="zmdi zmdi-account"></i></span>
							<span class="step-text">Personal Details</span>
						</h2>
						<section>
							<div class="inner">
								<h3>Personal Details:</h3>
								<form:form method="POST" action="/student-save" modelAttribute="student" enctype="multipart/form-data" id="form-total">
                        
                        	
                        	<form:input type="hidden" path="studentId" />
                        	
                        	<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="nameWithInitials">
										<form:input type="text" class="form-control" path="nameWithInitials" id="name_with_initials" />
										<span class="label">Name With Initials</span>
										
									</form:label>
									<form:errors path="nameWithInitials" cssClass="error" />
								</div>
							</div>
                        	<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="fullName">
										<form:input type="text" class="form-control" path="fullName" id="full_name" />
										<span class="label">Full Name</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="fullName" cssClass="error" />
							</div>                            
							<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="email">
										<form:input type="text" class="form-control" id="email" path="email"/>
										<span class="label">Email</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="email" cssClass="error" />
							</div>
                        	<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="address">
										<form:input type="text" class="form-control" id="address" path="address"/>
										<span class="label">Address</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="address" cssClass="error" />
							</div>
                        	<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="school">
										<form:input type="text" class="form-control" id="school" path="school"/>
										<span class="label">School</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="school" cssClass="error" />
							</div>
							<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="phoneHome">
										<form:input type="text" class="form-control" id="phone_home" path="phoneHome"/>
										<span class="label">Tel-Home</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="phoneHome" cssClass="error" />
							</div>
							<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="phoneMobile">
										<form:input type="text" class="form-control" id="phone_mobile" path="phoneMobile"/>
										<span class="label">Tel-Mobile</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="phoneMobile" cssClass="error" />
							</div>
							<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="nic">
										<form:input type="text" class="form-control" id="nic" path="nic"/>
										<span class="label">NIC</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="nic" cssClass="error" />
							</div>
							
							<h3>Parent Details</h3>
							
							<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="fatherName">
										<form:input type="text" class="form-control" id="father_name" path="fatherName"/>
										<span class="label">Father Name</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="fatherName" cssClass="error" />
							</div>
							<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="fatherNic">
										<form:input type="text" class="form-control" id="father_nic" path="fatherNic"/>
										<span class="label">Father NIC</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="fatherNic" cssClass="error" />
							</div>
							<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="fatherOccupation">
										<form:input type="text" class="form-control" id="father_occupation" path="fatherOccupation"/>
										<span class="label">Father Occupation</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="fatherOccupation" cssClass="error" />
							</div>
							
							<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="motherName">
										<form:input type="text" class="form-control" id="mother_name" path="motherName"/>
										<span class="label">Mother Name</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="motherName" cssClass="error" />
							</div>
							<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="motherNic">
										<form:input type="text" class="form-control" id="mother_nic" path="motherNic"/>
										<span class="label">Mother NIC</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="motherNic" cssClass="error" />
							</div>
							<div class="form-row">
								<div class="form-holder form-holder-1">
									<form:label class="form-row-inner" path="motherOccupation">
										<form:input type="text" class="form-control" id="mother_occupation" path="motherOccupation"/>
										<span class="label">Mother Occupation</span>
										<span class="border"></span>
									</form:label>
								</div>
								<form:errors path="motherOccupation" cssClass="error" />
							</div>
							<div class="form-row">
								<input type="submit" class="btn btn-primary btn-md" value="Submit"/>
							</div>
                        
                        </form:form>
							

							</div>
						</section>
						
						<!-- SECTION 3 -->
						<c:if test="${student.studentId != 0}">
						
						<h2>
							<span class="step-icon"><i class="zmdi zmdi-receipt"></i></span>
							<span class="step-text">Education Qualification</span>
						</h2>
						<section>
							<div class="inner">
								<h3>O/L Results & Subjects</h3>
								
								<form:form method="POST" action="/student-qualification-save" modelAttribute="olQualification">
								
								<div class="form-row">
									<div class="form-holder">
										<label class="form-row-inner">
											<input type="text" class="form-control" id="first-name-1"
												name="first-name-1" required>
											<span class="label">O/L Year</span>
											<span class="border"></span>
										</label>
									</div>
									<div class="form-holder">
										<label class="form-row-inner">
											<input type="text" class="form-control" id="last-name-1" name="last-name-1"
												required>
											<span class="label">O/L Index No</span>
											<span class="border"></span>
										</label>
									</div>
								</div>

								<div class="form-row">
									
									<form:input type="hidden" path="qualificationId"/>
                            		<form:input type="hidden" path="exam" value="O/L" />
                            		<form:input type="hidden" path="studentId" />
                            	
									<!--subject1-->
									<div class="form-holder">
										<form:label class="form-row-inner" path="subject">
											<form:input type="text" class="form-control" id="ol_subject" path="subject"/>
											<span class="label">Subject</span>
											<span class="border"></span>
										</form:label>
										<form:errors path="subject" cssClass="error" />
									</div>
									<div class="form-holder form-holder-2">
										<form:label class="form-row-inner" path="grade">
											<form:input type="text" class="form-control" id="ol_grade" path="grade"/>
											<span class="label">Subject</span>
											<span class="border"></span>
										</form:label>
										<form:errors path="grade" cssClass="error" />
									</div>
									
								</div>
								
								<div class="form-row">
									<input type="submit" class="btn btn-primary btn-md" value="Add"/>	
								</div>
								
								</form:form>
								
								<div class="form-row">
		                           <table class="table table-bordered">
		                           		<thead>
		                           			<tr>
		                           				<th>Subject</th>
		                           				<th>Grade</th>
		                           				<th>Action</th>
		                           			</tr>
		                           		</thead>
		                           		<tbody>
		                           			<c:forEach var="data" items="${olQualifications}">                           			
			                           			<tr>
			                           				<td>${data.subject}</td>
			                           				<td>${data.grade}</td>
			                           				<td> <a href="/student-qualification-delete/${data.qualificationId}" class="btn btn-danger btn-sm">Delete</a> </td>
			                           			</tr>
		                           			</c:forEach>
		                           		</tbody>
		                           </table>
		                       </div> 
								<br><br><br>



	
								<div class="inner">
									<h3>A/L Results & Subjects</h3>
									
									<form:form method="POST" action="/student-qualification-save" modelAttribute="alQualification">
									
									<div class="form-row">
										<div class="form-holder">
											<label class="form-row-inner">
												<input type="text" class="form-control" id="first-name-1"
													name="first-name-1" required>
												<span class="label">A/L Year</span>
												<span class="border"></span>
											</label>
										</div>
										<div class="form-holder">
											<label class="form-row-inner">
												<input type="text" class="form-control" id="last-name-1"
													name="last-name-1" required>
												<span class="label">A/L Index No</span>
												<span class="border"></span>
											</label>
										</div>
									</div>



									<div class="form-row">
									
									<form:input type="hidden" path="qualificationId"/>
                            		<form:input type="hidden" path="exam" value="A/L" />
                            		<form:input type="hidden" path="studentId" />

										<!--subject1-->
										<div class="form-holder">
											<form:label class="form-row-inner" path="subject">
												<form:input type="text" class="form-control" id="al_subject" path="subject" />
												<span class="label">Subject</span>
												<span class="border"></span>
											</form:label>
											<form:errors path="subject" cssClass="error" />
										</div>
										<div class="form-holder form-holder-2">
											<form:label class="form-row-inner" path="grade">
												<form:input type="text" class="form-control" id="al_grade" path="grade" />
												<span class="label">Subject</span>
												<span class="border"></span>
											</form:label>
											<form:errors path="grade" cssClass="error" />
										</div>
									
									</div>
									
									<div class="form-row">
										<input type="submit" class="btn btn-primary btn-md" value="Add"/>
									</div>
									
									</form:form>
									
									<div class="form-row">
			                           <table class="table table-bordered">
			                           		<thead>
			                           			<tr>
			                           				<th>Subject</th>
			                           				<th>Grade</th>
			                           				<th>Action</th>
			                           			</tr>
			                           		</thead>
			                           		<tbody>
			                           			<c:forEach var="data" items="${alQualifications}">                           			
				                           			<tr>
				                           				<td>${data.subject}</td>
				                           				<td>${data.grade}</td>
				                           				<td> <a href="/student-qualification-delete/${data.qualificationId}" class="btn btn-danger btn-sm">Delete</a> </td>
				                           			</tr>
			                           			</c:forEach>
			                           		</tbody>
			                           </table>
			                       </div>
								
							</section>
						</c:if>
					</div>
			</div>	
			</div>
		</div>
	</div>
	<script src="/registration_template/js/jquery-3.3.1.min.js"></script>
	<script src="/registration_template/js/jquery.steps.js"></script>
	<script src="/registration_template/js/jquery-ui.min.js"></script>
	<script src="/registration_template/js/main.js"></script>
</body>

</html>
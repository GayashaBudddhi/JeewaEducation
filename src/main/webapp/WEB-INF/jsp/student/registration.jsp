<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>Student Registration</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style>
body {
	color: #fff;
	background: #63738a;
	font-family: 'Roboto', sans-serif;
}
.form-control {
	height: 30px;
	box-shadow: none;
	color: #969fa4;
}
.form-control:focus {
	border-color: #5cb85c;
}
.form-control, .btn {        
	border-radius: 3px;
}
.signup-form {
	width: 450px;
	margin: 0 auto;
	padding: 30px 0;
  	font-size: 15px;
}
.signup-form h2 {
	color: #636363;
	margin: 0 0 15px;
	position: relative;
	text-align: center;
}
.signup-form h2:before, .signup-form h2:after {
	content: "";
	height: 2px;
	width: 30%;
	background: #d4d4d4;
	position: absolute;
	top: 50%;
	z-index: 2;
}	
.signup-form h2:before {
	left: 0;
}
.signup-form h2:after {
	right: 0;
}
.signup-form .hint-text {
	color: #999;
	margin-bottom: 30px;
	text-align: center;
}
.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #f2f3f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.signup-form .form-group {
	margin-bottom: 20px;
}
.signup-form input[type="checkbox"] {
	margin-top: 3px;
}
.signup-form .btn {        
	font-size: 16px;
	font-weight: bold;		
	min-width: 140px;
	outline: none !important;
}
.signup-form .row div:first-child {
	padding-right: 10px;
}
.signup-form .row div:last-child {
	padding-left: 10px;
}    	
.signup-form a {
	color: #fff;
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #5cb85c;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}  

.error {
  	color: red;
  	font-style: italic;
  	font-size: 11px;
}

.btn-xs {
	padding: 1px 5px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}
		
</style>
</head>
<body>
<div class="signup-form">
	<div class="row" style="margin-bottom:15px">
			<div class="col-md-6">
				<button class="btn btn-info btn-lg btn-block" id="btn_personal_details">Personal Details</button>
			</div>
			<c:if test="${student.studentId != 0}">
				<div class="col-md-6">
					<button class="btn btn-warning btn-lg btn-block" id="btn_education_details">Education Qualification</button>
				</div>
			</c:if>          
    </div>
    
    <form:form method="POST" action="/student-save" modelAttribute="student" enctype="multipart/form-data" id="form_personal_details">
		<h4>Personal Details</h4>
		
		<form:input type="hidden"  path="status"/>
		
        <div class="form-group">			
			<form:input type="text" class="form-control" path="nameWithInitials" placeholder="Name with Initials" />				       	
        	<form:errors path="nameWithInitials" cssClass="error" /> 
        </div>
        <div class="form-group">			
			<form:input type="text" class="form-control" path="fullName" placeholder="Full name" />				       	
        	<form:errors path="fullName" cssClass="error" /> 
        </div>
        <div class="form-group">			
			<form:input type="email" class="form-control" path="email" placeholder="Email" />				       	
        	<form:errors path="email" cssClass="error" /> 
        </div>
        <div class="form-group">			
			<form:input type="text" class="form-control" path="address" placeholder="Address" />				       	
        	<form:errors path="address" cssClass="error" /> 
        </div>
        <div class="form-group">			
			<form:input type="text" class="form-control" path="school" placeholder="School" />				       	
        	<form:errors path="school" cssClass="error" /> 
        </div>
        <div class="form-group">			
			<form:input type="text" class="form-control" path="phoneHome" placeholder="Tel-Home" />				       	
        	<form:errors path="phoneHome" cssClass="error" /> 
        </div>
		<div class="form-group">			
			<form:input type="text" class="form-control" path="phoneMobile" placeholder="Tel-Mobile" />				       	
        	<form:errors path="phoneMobile" cssClass="error" /> 
        </div>
		<div class="form-group">			
			<form:input type="text" class="form-control" path="nic" placeholder="NIC" />				       	
        	<form:errors path="nic" cssClass="error" /> 
        </div> 
            
        <h4>Parent Details</h4>
        
        <div class="form-group">			
			<form:input type="text" class="form-control" path="fatherName" placeholder="Father Name" />				       	
        	<form:errors path="fatherName" cssClass="error" /> 
        </div>
        <div class="form-group">			
			<form:input type="text" class="form-control" path="fatherNic" placeholder="Father NIC" />				       	
        	<form:errors path="fatherNic" cssClass="error" /> 
        </div>
        <div class="form-group">			
			<form:input type="text" class="form-control" path="fatherOccupation" placeholder="Father Occupation" />				       	
        	<form:errors path="fatherOccupation" cssClass="error" /> 
        </div>
        
        <div class="form-group">			
			<form:input type="text" class="form-control" path="motherName" placeholder="Mother Name" />				       	
        	<form:errors path="motherName" cssClass="error" /> 
        </div>
        <div class="form-group">			
			<form:input type="text" class="form-control" path="motherNic" placeholder="Mother NIC" />				       	
        	<form:errors path="motherNic" cssClass="error" /> 
        </div>
        <div class="form-group">			
			<form:input type="text" class="form-control" path="motherOccupation" placeholder="Mother Occupation" />				       	
        	<form:errors path="motherOccupation" cssClass="error" /> 
        </div>
        
        <div class="form-group">
        	<form:label path="file">Select Image</form:label>
        	<form:input type="file" class="form-control" path="file" />
        	<form:errors path="file" cssClass="error" />
        </div>
        
        
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Submit</button>
        </div>
        
    </form:form>
    
    <c:if test="${student.studentId != 0}">
    
    <form:form method="POST" action="/student-qualification-save" modelAttribute="olQualification" id="form_ol_qualification"> 
    	<h4>O/L Results Details</h4>
    	<form:input type="hidden" path="qualificationId"/>
      	<form:input type="hidden" path="exam" value="O/L" />
      	<form:input type="hidden" path="studentId" />
      	
      	<div class="row">
      		<div class="col-md-6">
                <form:input type="text" path="subject" class="form-control input-sm" id="ol_subject" placeholder="Subject"/>
            	<form:errors path="subject" cssClass="error" />
            </div>
            <div class="col-md-6">
                <form:input type="text" path="grade" class="form-control input-sm" id="ol_grade" placeholder="Grade"/>
            	<form:errors path="grade" cssClass="error" />
            </div>
            
      	</div>
      	<div class="row" style="margin-top:10px">
      		<div class="col-md-2">
                <input type="submit" class="btn btn-primary btn-xs" style="margin-left:5px" value="Add"/>
            </div>
      	</div>
      	<div class="row" style="margin-top:10px">
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
                				<td> <a href="/student-qualification-delete/${data.qualificationId}" class="btn btn-danger btn-xs">Delete</a> </td>
                			</tr>
               			</c:forEach>
               		</tbody>
               </table>
           </div>
    </form:form>                         
    
    <form:form method="POST" action="/student-qualification-save" modelAttribute="alQualification" id="form_al_qualification">                           
       <h5>A/L Results</h5><br>
       <div class="row">
       	<form:input type="hidden" path="qualificationId"/>
       	<form:input type="hidden" path="exam" value="A/L" />
       	<form:input type="hidden" path="studentId" />
       	
           <div class="col-md-6">
               <form:input type="text" path="subject" class="form-control" id="al_subject" placeholder="Subject"/>
           	<form:errors path="subject" cssClass="error" />
           </div>
           <div class="col-md-6">
               <form:input type="text" path="grade" class="form-control" id="al_grade" placeholder="Grade"/>
           	<form:errors path="grade" cssClass="error" />
           </div>
           
       </div>
       <div class="row" style="margin-top:10px">
       		<div class="col-md-2">
               <input type="submit" class="btn btn-primary btn-xs" style="margin-left:5px" value="Add"/>
           </div>
       </div>
       
       <div class="form-row" style="margin-top:10px">
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
          				<td> <a href="/student-qualification-delete/${data.qualificationId}" class="btn btn-danger btn-xs">Delete</a> </td>
          			</tr>
         			</c:forEach>
         		</tbody>
	          </table>
	      </div>
   </form:form>   
   </c:if>   

   <div class="row" style="margin-bottom:15px">			
		<c:if test="${student.studentId != 0}">
			<div class="col-md-12">
				<button class="btn btn-warning btn-lg btn-block" id="btn-finish"
					data-link="/student-registration-finish/${student.studentId}">Finish & Send</button>
			</div>
		</c:if>          
    </div>
    
	<div class="text-center">
		<a href="/login" style="margin-right:15px">Login</a> | 
		<a href="/" style="margin-left:15px">Home</a>
	</div>
</div>

<script>

	$(document).ready(function(){

		$('#btn_personal_details').click(function(){
			$('#form_personal_details').show();
			$('#form_ol_qualification').hide();
			$('#form_al_qualification').hide();
		});

		$('#btn_education_details').click(function(){
			$('#form_personal_details').hide();
			$('#form_ol_qualification').show();
			$('#form_al_qualification').show();
		});


		$('#form_personal_details').show();
		$('#form_ol_qualification').hide();
		$('#form_al_qualification').hide();

		$('#btn-finish').click(function(){
			var res = confirm('Do you want to finsh and send to admin?');
			if(res == true){
				window.open($(this).attr('data-link'), '_self');
			}
		});

		
	});
	
</script>


</body>
</html>
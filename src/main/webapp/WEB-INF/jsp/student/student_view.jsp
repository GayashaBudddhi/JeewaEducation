<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>View Student</title>
	<!-- Sidebar -->
    <jsp:include page="../template/head.jsp" />
    
    <style>
    
    	.error {
	    	color: red;
	    	font-style: italic;
	    	font-size: 12px;
		}
    
    </style>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:if test="${pageContext.request.userPrincipal.principal.user.userType == 'ADMIN'}">
	 		<jsp:include page="../template/menu_admin.jsp" />
		</c:if>
      

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="../template/header.jsp" />             


                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">Student - ${student.status}</h1>
                    <br>
                    <h3>Personal Details</h3>
                    <br>

                    <form:form method="POST" action="/admin-student-save" modelAttribute="student" enctype="multipart/form-data">
                        <div class="form-row">
                        	
                        	<form:input type="hidden" path="studentId" id="student_id"/>
                        	<form:input type="hidden"  path="status"/>
                        	
                            <div class="col-md-6 mb-3">
                                <form:label path="nameWithInitials">Name with Initials</form:label>
                                <form:input type="text" class="form-control" path="nameWithInitials" id="name_with_initials"
                                    placeholder="Name with Initials" />   
                                <form:errors path="nameWithInitials" cssClass="error" />                          
                            </div>
                            <div class="col-md-6 mb-3">
                                <form:label path="fullName">Full name</form:label>
                                <form:input type="text" class="form-control" path="fullName" id="full_name"
                                    placeholder="Full name"  />                               
                                <form:errors path="fullName" cssClass="error" />
                            </div>

                        </div>
                        <div class="form-row">

                            <div class="col-md-6 mb-3 mt-4">
                                <form:label path="email">Email</form:label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
                                    </div>
                                    <form:input type="email" path="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                        class="form-control" id="email" placeholder="Email"
                                        aria-describedby="validationTooltipUsernamePrepend" />
                                </div>
                                <form:errors path="email" cssClass="error" />
                            </div>

                            <div class="col-md-6 mb-3 mt-4">
                                <form:label path="address">Address</form:label>
                                <form:input type="text" path="address" class="form-control" id="address" placeholder="Address"
                                   />
                                <form:errors path="address" cssClass="error" />
                            </div>

                        </div>

                        <div class="form-row">
                            <div class="col-md-6 mb-3 mt-4">
                                <form:label path="school">School</form:label>
                                <form:input type="text" path="school" class="form-control" id="school" placeholder="School"
                                    />
                               	<form:errors path="school" cssClass="error" />
                            </div>
                            <div class="col-md-6 mb-3 mt-4">
                                <form:label path="phoneHome">Tel-Home</form:label>
                                <form:input type="text" path="phoneHome" class="form-control" id="phone_home" placeholder="Tel-Home"
                                    />
                                <form:errors path="phoneHome" cssClass="error" />
                            </div>
                            <div class="col-md-6 mb-3 mt-4">
                                <form:label path="phoneMobile">Tel-Mobile</form:label>
                                <form:input type="text" path="phoneMobile" class="form-control" id="phone_mobile"
                                    placeholder="Tel-Mobile" />
                                <form:errors path="phoneMobile" cssClass="error" />
                            </div>
                            <div class="col-md-6 mb-3 mt-4">
                                <form:label path="nic">NIC</form:label>
                                <form:input type="text" path="nic" class="form-control" id="nic" placeholder="NIC"
                                    />
                               	<form:errors path="nic" cssClass="error" />
                            </div>
                        </div>
                        <br>
                        <br>

                     
                            <h3>Parent Details</h3>
                            <div class="form-row">
                                <div class="col-md-6 mb-3">
                                    <form:label path="fatherName">Father Name</form:label>
                                    <form:input type="text" path="fatherName" class="form-control" id="father_name"
                                        placeholder="father name" />
                                    <form:errors path="fatherName" cssClass="error" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <form:label path="fatherNic">Father NIC</form:label>
                                    <form:input type="text" path="fatherNic" class="form-control" id="father_nic" placeholder="NIC"
                                        />
                                    <form:errors path="fatherNic" cssClass="error" />
                                </div><br>
                                <div class="col-md-6 mb-3">
                                    <form:label path="fatherOccupation">Father Occupation</form:label>
                                    <form:input type="text" path="fatherOccupation" class="form-control" id="father_occupation"
                                        placeholder="Occupation" />
                                    <form:errors path="fatherOccupation" cssClass="error" />
                                </div>

                            </div>

                            <br>
                            <br>


                            <div class="form-row">
                                <div class="col-md-6 mb-3">
                                    <form:label path="motherName">Mother Name</form:label>
                                    <form:input type="text" path="motherName" class="form-control" id="mother_name"
                                        placeholder="mother name" />
                                    <form:errors path="motherName" cssClass="error" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <form:label path="motherNic">Mother NIC</form:label>
                                    <form:input type="text" path="motherNic" class="form-control" id="mother_nic" placeholder="NIC"
                                        />
                                    <form:errors path="motherNic" cssClass="error" />
                                </div><br>
                                <div class="col-md-6 mb-3">
                                    <form:label path="motherOccupation">Mother Occupation</form:label>
                                    <form:input type="text" path="motherOccupation" class="form-control" id="mother_name"
                                        placeholder="Occupation" />
                                    <form:errors path="motherOccupation" cssClass="error" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <form:label path="file">Select Image</form:label>
                                    <form:input type="file" class="form-control" path="file" />
                                    <form:errors path="file" cssClass="error" />
                                </div>                                
								<div class="col-md-12">
									<input type="submit" class="btn btn-primary btn-md" value="Submit"/>
								</div>
                            </div>
                        </form:form>
                        <br>
                        <br>
                        <br>

						<c:if test="${student.studentId != 0}">

                        <form:form method="POST" action="/admin-student-qualification-save" modelAttribute="olQualification">                           
                            <h3>Education Qualification</h3><br>
                            <h5>O/L Results</h5><br>
                            <div class="form-row">
                            	<form:input type="hidden" path="qualificationId"/>
                            	<form:input type="hidden" path="exam" value="O/L" />
                            	<form:input type="hidden" path="studentId" />
                            	
                                <div class="col-md-5 mb-3">
                                    <form:input type="text" path="subject" class="form-control" id="ol_subject" placeholder="Subject"/>
                                	<form:errors path="subject" cssClass="error" />
                                </div>
                                <div class="col-md-5 mb-3">
                                    <form:input type="text" path="grade" class="form-control" id="ol_grade" placeholder="Grade"/>
                                	<form:errors path="grade" cssClass="error" />
                                </div>
                                <div class="col-md-2">
                                    <input type="submit" class="btn btn-primary btn-md" value="Add"/>
                                </div>
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
                
                       <br>
                       <br>

                       <form:form method="POST" action="/admin-student-qualification-save" modelAttribute="alQualification">                           
                            <h5>A/L Results</h5><br>
                            <div class="form-row">
                            	<form:input type="hidden" path="qualificationId"/>
                            	<form:input type="hidden" path="exam" value="A/L" />
                            	<form:input type="hidden" path="studentId" />
                            	
                                <div class="col-md-5 mb-3">
                                    <form:input type="text" path="subject" class="form-control" id="al_subject" placeholder="Subject"/>
                                	<form:errors path="subject" cssClass="error" />
                                </div>
                                <div class="col-md-5 mb-3">
                                    <form:input type="text" path="grade" class="form-control" id="al_grade" placeholder="Grade"/>
                                	<form:errors path="grade" cssClass="error" />
                                </div>
                                <div class="col-md-2">
                                    <input type="submit" class="btn btn-primary btn-md" value="Add"/>
                                </div>
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
                       
                       
                       <form:form method="POST" action="/admin-student-profile-save" modelAttribute="user">                           
                            <h3>Student profile</h3><br>
                           
                            <div class="form-row">
                            	<form:input type="hidden" path="id"/>
                            	<form:input type="hidden" path="userType" value="STUDENT" />    
                            	<form:input type="hidden" path="userId" />                           	
                            	
                                <div class="col-md-5 mb-3">
                                    <form:input type="text" path="username" class="form-control" id="username" placeholder="Enter username"/>
                                	<form:errors path="username" cssClass="error" />
                                </div>
                                <div class="col-md-5 mb-3">
                                    <form:password class="form-control" path="password" showPassword="false" placeholder="Enter password"/>
                                    <form:errors path="password" cssClass="error" />
                                </div>
                                <div class="col-md-2">
                                    <input type="submit" class="btn btn-primary btn-md" value="Save Profile Details"/>
                                </div>
                            </div>
                        </form:form>
                       
                       
                       <div class="form-row">
                       		<div class="col-md-3">
                       			<button class="btn btn-primary" id="btn_send_to_foundation" >Sent To Foundation</button>
                       		</div>
                       		<div class="col-md-3">
                       			<button class="btn btn-primary" id="btn_send_to_visa" >Sent To visa</button>
                       		</div>
                       		<c:if test="${student.status == 'FOUNDATION' || student.status == 'VISA' }">
	                       		<div class="col-md-3">
	                       			<a class="btn btn-success" href="/results-print/${student.studentId}">Print Result Sheet</a>
	                       		</div>
                       		</c:if>
                       </div>
              
					</c:if>
                        

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <jsp:include page="../template/footer.jsp" />
            

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

   

    <!-- Bootstrap core JavaScript-->
    <jsp:include page="../template/scripts.jsp" />
    
    <script>

		$(document).ready(function(){

			$('#btn_send_to_foundation').click(function(){
				var res = confirm('Do you want to send this student to foundation cource?');
				if(res == true){
					window.open('/admin-student-send-foundation/' + $('#student_id').val(), '_self');
				}
			});

			$('#btn_send_to_visa').click(function(){
				var res = confirm('Do you want to send this student to visa process?');
				if(res == true){
					window.open('/admin-student-send-visa/' + $('#student_id').val(), '_self');
				}
			});
			
		});
    
    </script>

</body>

</html>
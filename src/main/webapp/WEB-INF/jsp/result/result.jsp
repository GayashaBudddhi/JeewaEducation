<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Result</title>
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
        <c:if test="${pageContext.request.userPrincipal.principal.user.userType == 'ADMIN_LIBRARY'}">
	 		<jsp:include page="../template/menu_admin_library_handling.jsp" />
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
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">Exam Result</h1>                    
                    <br>

                    <form:form method="POST" action="/results-exam-save" modelAttribute="studentExam" onsubmit="return form_validation();">
                        <div class="form-row">
                        	
                            <div class="col-md-6 mb-3">
                                <form:label path="studentId">Student ID</form:label>
                                <form:input type="number" class="form-control" path="studentId" id="student_id" placeholder="Enter student ID" />   
                                <form:errors path="studentId" cssClass="error"/>   
                                <label Class="error" id="err_student_id"></label>                       
                            </div>
                            <div class="col-md-6 mb-3">
                                <form:label path="year">Exam Year</form:label>
                                <form:input type="number" class="form-control" path="year" id="year" placeholder="Enter exam year"  />                               
                                <form:errors path="year" cssClass="error"/>
                                <label Class="error" id="err_year"></label>
                            </div>

                        </div>
                        <div class="form-row">

                            <div class="col-md-6 mb-3">
                                <form:label path="semester">Semester</form:label>
                                <form:input type="number" class="form-control" path="semester" id="semester" placeholder="Enter semester"  />                               
                                <form:errors path="semester" cssClass="error"/>
                                <label Class="error" id="err_semester"></label>
                            </div>
                            <div class="col-md-6 mb-3">
                                <form:label path="indexNo">Index No</form:label>
                                <form:input type="text" path="indexNo" class="form-control" placeholder="Enter index no" />
                                <form:errors path="indexNo" cssClass="error" />
                            </div>
							
                        </div>
                        
                        <div class="form-row">
                        	<div class="col-md-2">
	                            <input type="submit" class="btn btn-primary btn-md" value="Save Exam Details"/>
	                        </div>
                        </div>                        
                        
                      </form:form>
                        <br>
                        <br>
                        <br>

						<c:if test="${studentExam.id != 0}">

                        <form:form method="POST" action="/results-exam-subjects-save" modelAttribute="examResult">                           
                            <h3>Subject Results</h3><br>
                           
                            <div class="form-row">
                            	<form:input type="hidden" path="studentExam"/>
                            	<form:input type="hidden" path="grade"/>
                            	
                                <div class="col-md-4 ">
                                    <form:input type="text" path="subjectCode" class="form-control" placeholder="Subject code"/>
                                	<form:errors path="subjectCode" cssClass="error" />
                                </div>
                                <div class="col-md-4 ">
                                    <form:input type="text" path="subjectName" class="form-control" placeholder="Subject name"/>
                                	<form:errors path="subjectName" cssClass="error" />
                                </div> 
                                <div class="col-md-4 ">
                                    <form:input type="text" path="marks" class="form-control" placeholder="Marks"/>
                                	<form:errors path="marks" cssClass="error" />
                                </div>
                                                               
                            </div>
                              <br>                       
                            <div class="form-row">
                            	<div class="col-md-2">
                                    <input type="submit" class="btn btn-primary btn-md" value="Add Subject Result"/>
                                </div>
                            </div>
                        </form:form>
                        <br>
                        <h5>Subjects</h5>
                        <br>
                       <div class="form-row">
                           <table class="table table-bordered">
                           		<thead>
                           			<tr>
                           				<th>Subject Code</th>
                           				<th>Subject Name</th>
                           				<th>Marks</th>
                           				<th>Grade</th>
                           				<th>Action</th>
                           			</tr>
                           		</thead>
                           		<tbody>
                           			<c:forEach var="data" items="${examResultSubjects}">                           			
	                           			<tr>
	                           				<td>${data.subjectCode}</td>
	                           				<td>${data.subjectName}</td>
	                           				<td>${data.marks}</td>
	                           				<td>${data.grade}</td>
	                           				<td> <a href="/results-exam-subjects-delete/${data.id}" class="btn btn-danger btn-sm">Delete</a> </td>
	                           			</tr>
                           			</c:forEach>
                           		</tbody>
                           </table>
                       </div>            
                
                       <br>
                       <br>                   
              
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

		function form_validation(){
			var student_id = $('#student_id').val().trim();
			var year = $('#year').val().trim();
			var semester = $('#semester').val().trim();
			var count = 0;
			
			if(student_id == ''){
				$('#err_student_id').html('Incorrect value');
				count++;
			}
			if(year == ''){
				$('#err_year').html('Incorrect value');
				count++;
			}
			if(semester == ''){
				$('#err_semester').html('Incorrect value');
				count++;
			}

			if(count > 0){
				return false;
			}
			else {
				return true;
			}
		}
    
    </script>

</body>

</html>
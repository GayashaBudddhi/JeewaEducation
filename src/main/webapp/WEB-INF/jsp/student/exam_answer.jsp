<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Student Answer Upload</title>
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
        <c:if test="${pageContext.request.userPrincipal.principal.user.userType == 'STUDENT'}">
	 		<jsp:include page="../template/menu_student.jsp" />
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
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">Upload Online Exam Answers</h1>
                    <br>

                    <form:form method="POST" action="/student-exam-answer-save" modelAttribute="examAnswer" enctype="multipart/form-data" onsubmit="return form_validation();">
                        <div class="form-row">
                        	
                        	<form:input type="hidden" path="studentId" id="student_id"/>                        	
                        	
                            <div class="col-md-6 mb-3">
                                <form:label path="subjectId">Subject</form:label>
                                <form:select class="form-control" id="subject_id" path="subjectId">
					              	<form:option value="0">..Select Subject ..</form:option>
					              	<c:forEach items="${subjects}" var="subject">
					              		<form:option value="${subject.subjectId}">${subject.subjectName}</form:option>
					            	</c:forEach>
					            </form:select> 
					            <label id="err_subject_id" class="error"></label>                         
                            </div>
                            <div class="col-md-6 mb-3">
                                <form:label path="examId">Exam</form:label>
                                <form:select class="form-control" path="examId" id="exam_id">
					              	<form:option value="0"> Mid Exam </form:option>
					              	<form:option value="1">Final Exam</form:option>
					              	<c:forEach items="${exams}" var="exam">
					              		<form:option value="${exam.documentId}" >${exam.documentId}</form:option>
					            	</c:forEach>
					            </form:select>                            
                                <label id="err_exam_id" class="error"></label>
                            </div>

                        </div>
                       

                       <div class="form-row">    
                         
                           <div class="col-md-6 mb-3">
                               <form:label path="file">Select Answers File</form:label>
                               <form:input type="file" class="form-control" path="file" id="file"/>
                               <label id="err_file" Class="error" ></label>
                           </div>                                
							<div class="col-md-12">
								<input type="submit" class="btn btn-primary btn-md" value="Submit"/>
							</div>
                       </div>
                  </form:form>
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

			$('#subject_id').change(function(){				
				window.open('/student-exam-answer-upload?subjectId=' + $('#subject_id').val(), '_self');				
			});	
			
		});

		function form_validation(){
			var subject_id = $('#subject_id').val();
			var exam_id = $('#exam_id').val();
			var file = $('#file').val();
			var err_count = 0;

			if(subject_id == null || subject_id =='' || subject_id == "0"){
				$('#err_subject_id').html('Incorrect subject');
				err_count++;
			}
			
			if(exam_id == null || exam_id =='' || exam_id == "0"){
				$('#err_exam_id').html('Incorrect exam');
				err_count++;
			}

			if(file == null || file ==''){
				$('#err_file_id').html('Incorrect file');
				err_count++;
			}

			if(err_count > 0){
				return false;
			}
			else {
				return true;
			}
		}
    
    </script>

</body>

</html>
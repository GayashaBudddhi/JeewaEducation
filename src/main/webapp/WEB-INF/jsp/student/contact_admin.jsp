<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Contact Administrator</title>
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
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">Contact Administrator</h1>
                    <br>
                  
                    <form:form method="POST" action="/student-contact-message-save" modelAttribute="contactMessage">
                        
                        <form:input type="hidden" path="id"/>
                        <form:input type="hidden" path="studentId" id="student_id"/>
                        <form:input type="hidden" path="status"/>
                        
                        <div class="form-row">
                        
                            <div class="col-md-12">
                                <form:label path="title">Title <span class="error">*</span> </form:label>
                                <form:input type="text" path="title" class="form-control" placeholder="Enter Title" />
                                <form:errors path="title" cssClass="error" />
                            </div>

                        </div>
                        
                        <div class="form-row">                        	
                        	<div class="col-md-12">
                                <form:label path="message">Message <span class="error">*</span> </form:label>
                                <form:textarea class="form-control" path="message" rows="5" cols="30" placeholder="Enter message"/>
                                <form:errors path="message" cssClass="error" />
                            </div>
                        </div>
                                                
                        <br>
                        <br>                  
                       
                         <div class="form-row">                                                    
							<div class="col-md-12">
								<input type="submit" class="btn btn-primary btn-md" value="Send"/>
							</div>
		                </div>
		                
                        </form:form>
                        <br>
                        <br>
                        <br>
                       

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
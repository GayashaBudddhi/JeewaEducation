<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Student Message</title>
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
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">Student Message</h1>
                    <br>
                                                                  
                        <div class="form-row">
                        
                        	<input type="hidden" id="id" value="${contactMessage.id}">
                        
                            <div class="col-md-6">
                                <label>Student Name</label>
                                <input type="text" value="${student.fullName}" class="form-control" readonly/>
                            </div>
                            
                            <div class="col-md-6">
                                <label>Email</label>
                                <input type="text" value="${student.email}" class="form-control" readonly/>
                            </div>

                        </div>
                        
                        <div class="form-row">
                        
                            <div class="col-md-12">
                                <label>Title</label>
                                <input type="text" value="${contactMessage.title}" class="form-control" readonly/>
                            </div>

                        </div>
                        
                        <div class="form-row">                        	
                        	<div class="col-md-12">
                                <label>Message </label>
                                <textarea class="form-control" rows="5" cols="30" readonly>${contactMessage.message}</textarea>
                            </div>
                        </div>
                                                
                        <br>
                        <br>                  
                       
                         <div class="form-row">                                                    
							<div class="col-md-12">
								<button class="btn btn-primary btn-md"  id="btn-read">Mark As Read</button>
							</div>
		                </div>
		                
                      
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

			$('#btn-read').click(function(){
				var res = confirm('Do you want to mark this message as read?');
				if(res == true){
					window.open('/admin-read-message/' + $('#id').val(), '_self');
				}
			});
			
		});
    
    </script>

</body>

</html>
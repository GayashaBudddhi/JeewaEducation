<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Library Item</title>
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
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">Library Item</h1>
                    <br>

                    <form:form method="POST" action="/library-item-save" modelAttribute="libraryItem" enctype="multipart/form-data">
                        <div class="form-row">                        	
                        	
                        	<form:input path="filePath" type="hidden"/>
                        	<form:input path="id" type="hidden"/>
                        	
                            <div class="col-md-6 mb-3">
                                <form:label path="referenceId">Reference ID</form:label>
                                <form:input type="text" class="form-control" path="referenceId" placeholder="Enter reference ID" />   
                                <form:errors path="referenceId" cssClass="error" />                          
                            </div>
                            <div class="col-md-6 mb-3">
                                <form:label path="name">Item Name</form:label>
                                <form:input type="text" class="form-control" path="name" placeholder="Enter item name"  />                               
                                <form:errors path="name" cssClass="error" />
                            </div>

                        </div>
                        <div class="form-row">

                            <div class="col-md-6 mb-3">
                                <form:label path="type">Item Type</form:label>
                                <form:select class="form-control" path="type">
								    <form:option value="Text Book">Text Book</form:option>
								    <form:option value="Past Paper">Past Paper</form:option>
								    <form:option value="Supplemental Reading">Supplemental Reading</form:option>
								</form:select>                                
                                <form:errors path="type" cssClass="error" />
                            </div>

                            <div class="col-md-6 mb-3">
                                 <form:label path="file">Select File</form:label>
                                 <form:input type="file" class="form-control" path="file" />
                                 <form:errors path="file" cssClass="error" />
                             </div>  

                        </div>

	                    <div class="form-row">                     
                             
                             <div class="col-md-6 mb-3">
                                <form:label path="description">Item Description</form:label>
                                <form:textarea class="form-control" path="description" rows="5" cols="30" placeholder="Enter description"/>                               
                                <form:errors path="description" cssClass="error" />
                            </div>                              
							
	                    </div>
	                    <div class="form-row"> 
                        	<div class="col-md-6">
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
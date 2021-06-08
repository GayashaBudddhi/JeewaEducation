<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Scholarship</title>
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
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">Student Scholarships</h1>                    
                    <br>

                    <form:form method="POST" action="/scholarship-save" modelAttribute="scholarship" onsubmit="return form_validation();">
                        <div class="form-row">
                        	
                        	<form:input type="hidden" path="id" />
                        	
                            <div class="col-md-4">
                                <form:label path="studentId">Student ID</form:label>
                                <form:input type="number" class="form-control" path="studentId" id="student_id" placeholder="Enter student ID" />   
                                <form:errors path="studentId" cssClass="error"/>   
                                <label Class="error" id="err_student_id"></label>                       
                            </div>
                            <div class="col-md-4">
                                <form:label path="year">Exam Year</form:label>
                                <form:input type="number" class="form-control" path="year" id="year" placeholder="Enter exam year"  />                               
                                <form:errors path="year" cssClass="error"/>
                                <label Class="error" id="err_year"></label>
                            </div>
							<div class="col-md-4">
                                <form:label path="semester">Semester</form:label>
                                <form:input type="number" class="form-control" path="semester" id="semester" placeholder="Enter semester"  />                               
                                <form:errors path="semester" cssClass="error"/>
                                <label Class="error" id="err_semester"></label>
                            </div>
                        </div>
                        <div class="form-row">
                               
                        </div>
                        
                        <div class="form-row">
                        	<div class="col-md-2">
	                            <input type="submit" class="btn btn-primary btn-md" value="Add To Scholarship"/>
	                        </div>
                        </div>                        
                        
                      </form:form>
                        <br>
                        <br>
                        <br>

                        <div class="col-md-12">
						<table id="example" class="display" style="width:100%">
					        <thead>
					            <tr>
					                <th>Student ID</th>
					                <th>Year</th>
					                <th>Semester</th>					               
					                <th>Actions</th>
					            </tr>
					        </thead>					        
					    </table>
					</div>

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

    	//alert();
    	$('#example').DataTable( {
            "ajax": '/scholarship-list',
            //processing: true,
           	//serverSide: true,
            columns: [
            	{data : 'studentId'},
            	{data : 'year'},
            	{data : 'semester'},
            	{ 
            		data : 'id',
            		render : function(data,arg,full){
            			//var str = '<a class="btn btn-success btn-sm" href="/scholarship-view/'+data+'">View</a>';               
            			var str = '<a class="btn btn-danger btn-sm" style="margin-left:10px;cursor:pointer" onclick="delete_scholarship('+data+')">Delete</a>';
    	                return str;
            		}
            	}
            ]
        });

    });


    function delete_scholarship(_id){
    	var res = confirm('Do you want to delete this student scholarship?');
    	if(res == true){
    		window.open("/scholarship-delete/" + _id, '_self');
    	}
    }


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
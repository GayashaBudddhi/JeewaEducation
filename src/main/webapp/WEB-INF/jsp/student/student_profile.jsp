<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Student Profile</title>
	<!-- Sidebar -->
    <jsp:include page="../template/head.jsp" />
    
    <style>
    
    img{
        max-width: 100%;
        max-height: 100%;
        display: block; /* remove extra space below image */
    }
    .box{
        width: 250px;        
        border: 5px solid black;
    }    
    .box.large{
        height: 300px;
    }
    .box.small{
        height: 100px;
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
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">My Profile</h1>
                    <br>
                    <h3>Personal Details</h3>
                    <br>
                    
                     <div class="form-row">
                     	
                     	<input type="hidden" value="${student.studentId}" id="student_id" readonly/>
                     	
                         <div class="col-md-6 mb-3">
                             <label>Name with Initials</label>
                             <input type="text" class="form-control" value="${student.nameWithInitials}" readonly/>                                                        
                         </div>
                         <div class="col-md-6 mb-3">
                             <label path="fullName">Full name</label>
                             <input type="text" class="form-control" value="${student.fullName}" readonly /> 
                         </div>

                     </div>
                     <div class="form-row">

                         <div class="col-md-6 mb-3 mt-4">
                             <label>Email</label>
                             <div class="input-group">
                                 <div class="input-group-prepend">
                                     <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
                                 </div>
                                 <input type="email" value="${student.email}" class="form-control" readonly/>
                             </div>
                         </div>

                         <div class="col-md-6 mb-3 mt-4">
                             <label>Address</label>
                             <input type="text" value="${student.address}" class="form-control" readonly/>
                         </div>

                     </div>

                     <div class="form-row">
                         <div class="col-md-6 mb-3 mt-4">
                             <label>School</label>
                             <input type="text" value="${student.school}" class="form-control" readonly/>
                         </div>
                         <div class="col-md-6 mb-3 mt-4">
                             <label>Tel-Home</label>
                             <input type="text" value="${student.phoneHome}" class="form-control" readonly/>
                         </div>
                         <div class="col-md-6 mb-3 mt-4">
                             <label>Tel-Mobile</label>
                             <input type="text" value="${student.phoneMobile}" class="form-control" readonly/>
                         </div>
                         <div class="col-md-6 mb-3 mt-4">
                             <label>NIC</label>
                             <input type="text" value="${student.nic}" class="form-control" readonly/>
                         </div>
                     </div>
                     <br>
                     <br>

                  
                       <h3>Parent Details</h3>
                       <div class="form-row">
                           <div class="col-md-6 mb-3">
                               <label>Father Name</label>
                               <input type="text" value="${student.fatherName}" class="form-control" readonly/>
                           </div>
                           <div class="col-md-6 mb-3">
                               <label>Father NIC</label>
                               <input type="text" value="${student.fatherNic}" class="form-control" readonly/>
                           </div><br>
                           <div class="col-md-6 mb-3">
                               <label>Father Occupation</label>
                               <input type="text" value="${student.fatherOccupation}" class="form-control" readonly/>
                           </div>

                       </div>

                         <br>
                         <br>


                         <div class="form-row">
                             <div class="col-md-6 mb-3">
                                 <label>Mother Name</label>
                                 <input type="text" value="${student.motherName}" class="form-control" readonly/>
                             </div>
                             <div class="col-md-6 mb-3">
                                 <label>Mother NIC</label>
                                 <input type="text" value="${student.motherNic}" class="form-control" readonly/>
                             </div><br>
                             <div class="col-md-6 mb-3">
                                 <label>Mother Occupation</label>
                                 <input type="text" value="${student.motherOccupation}" class="form-control" readonly/>
                             </div>                                        
					
                         </div>
                        
                        <br>
                        <br>
                        <br>

						

                                                  
                      <h3>Education Qualification</h3><br>
                      <h5>O/L Results</h5><br>                
                        
                       <div class="form-row">
                           <table class="table table-bordered">
                           		<thead>
                           			<tr>
                           				<th>Subject</th>
                           				<th>Grade</th>
                           			</tr>
                           		</thead>
                           		<tbody>
                           			<c:forEach var="data" items="${olQualifications}">                           			
	                           			<tr>
	                           				<td>${data.subject}</td>
	                           				<td>${data.grade}</td>	                           				
	                           			</tr>
                           			</c:forEach>
                           		</tbody>
                           </table>
                       </div>            
                
                       <br>
                       <br>

                                                  
                      <h5>A/L Results</h5><br>                                      
                    
						<div class="form-row">
                           <table class="table table-bordered">
                           		<thead>
                           			<tr>
                           				<th>Subject</th>
                           				<th>Grade</th>
                           			</tr>
                           		</thead>
                           		<tbody>
                           			<c:forEach var="data" items="${alQualifications}">                           			
	                           			<tr>
	                           				<td>${data.subject}</td>
	                           				<td>${data.grade}</td>	                           				
	                           			</tr>
                           			</c:forEach>
                           		</tbody>
                           </table>
                       </div>
                       
                       
                                                 
                      <h3>Result Sheet</h3><br>
                     
                      <div class="row">                      	
                          <div class="col-md-5 ">
                              <input type="text" class="form-control" value="${user.username}" readonly/>
                          </div>   
                          <c:if test="${student.status == 'FOUNDATION' || student.status == 'VISA' }">
                       		<div class="col-md-3">
                       			<a class="btn btn-success" href="/results-print/${student.studentId}">Print Result Sheet</a>
                       		</div>
                      	  </c:if>                     
                      </div>           
                                
              		<br><br>
					<div class="col-md-6 mb-3">
                        <img alt="" src="/students-get-image/${student.studentId}">
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

			/*$('#btn_send_to_foundation').click(function(){
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
			});*/
			
		});
    
    </script>

</body>

</html>
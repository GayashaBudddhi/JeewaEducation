<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Visa Students</title>
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
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">Visa Students</h1>
                  
					<div class="col-md-12">
						<table id="example" class="display" style="width:100%">
					        <thead>
					            <tr>
					                <th>Name With Initials</th>
					                <th>Full Name</th>
					                <th>NIC</th>
					                <th>Address</th>
					                <th>Email</th>
					                <th>Actions</th>
					            </tr>
					        </thead>					        
					    </table>
					</div>
					<div class="col-md-12">
	                  	<a class="btn btn-success" href="/students-list-print/VISA">Print</a>
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
    
  
    <script src="views/student/visa_students.js"></script>    
   

</body>

</html>
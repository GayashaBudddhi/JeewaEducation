<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Results</title>
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
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">Student Results 
                    	<a class="btn btn-primary btn-sm" href="/results-add">Add Result</a>
                    </h1>
                  
					<div class="col-md-12">
						<table id="example" class="display" style="width:100%">
					        <thead>
					            <tr>
					                <th>Student ID</th>
					                <th>Year</th>
					                <th>Semester</th>	
					                <th>Index No</th>					               
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
            "ajax": '/results-list',
            //processing: true,
           	//serverSide: true,
            columns: [
            	{data : 'studentId'},
            	{data : 'year'},
            	{data : 'semester'},
            	{data : 'indexNo'},
            	{ 
            		data : 'id',
            		render : function(data,arg,full){
            			var str = '<a class="btn btn-success btn-sm" href="/results-exam-view/'+data+'">View</a>';               
    	                str += '<a class="btn btn-danger btn-sm" style="margin-left:10px;cursor:pointer" onclick="delete_exam('+data+')">Delete</a>';
    	                return str;
            		}
            	}
            ]
        });

    });


    function delete_exam(_id){
    	var res = confirm('Do you want to delete this student exam?');
    	if(res == true){
    		window.open("/results-exam-delete/" + _id, '_self');
    	}
    }

    </script>    
   

</body>

</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Sidebar -->
    <jsp:include page="../template/head.jsp" />
    
    <style>
    
    	.error {
	    	color: red;
	    	font-style: italic;
	    	font-size: 12px;
		}
    
    </style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/chosen.min.css" />
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/chosen.jquery.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>

<!-- ms -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- /ms -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.22/datatables.min.css" />



<script type="text/javascript"
	src="https://cdn.datatables.net/v/dt/dt-1.10.22/datatables.min.js"></script>


<script type="text/javascript">

$(document).ready(function() {
  var table=$('#example').DataTable(); 
 // Hide  columns
  table.columns( [0] ).visible( false );	
} );

function deleteMaterial(id){

var r=confirm("Do You want to delete this document?")
if(r==true){
$.ajax({
	url:"deleteStudyematerial/doc_id"+id,
	type:"GET",
	dataType:"JSON",
	success:function(data){
		debugger
		if(data==1){
			
			alert("Document Deleted Sucessfully");
			document.location.href="/viewUplodedMaterail"
			}

		}
});
	
}


	
}



</script>

<meta charset="ISO-8859-1">
<title>Study Material View</title>
</head>


<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:if test="${pageContext.request.userPrincipal.principal.user.userType == 'LECTURE'}">
	 		<jsp:include page="../template/menu_lecture.jsp" />
		</c:if>
      

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="../template/header.jsp" />             


                <!-- Begin Page Content -->
                <div class="container-fluid">

                   				<table  class="display" style="width:100%"
					id="example">
					<thead>
						<tr>
							<th>DocumentId</th>
							<th>Lecture name</th>
							<th>Subject</th>
							<th>Material type</th>
							<th>File Name</th>
							<th>File path</th>
							<th>Status</th>
							<th>Action</th>
							
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${materialList}" var="material">
							<tr>
								<td><c:out value="${material.documnetId}" /></td>
								<td><c:out value="${material.fName }" /></td>
								<td><c:out value="${material.subjetCode }" /></td>
								<td><c:out value="${material.materialType }" /></td>
								<td><c:out value="${material.fileName }" /></td>
								<td><c:out value="${material.filePath }" /></td>
								<td><c:out value="${material.status }" /></td>
							
							 	<td>
									<button type="button" class="btn btn-danger btn-sm"
									onclick="deleteMaterial(${material.documnetId})">Delete</button>
							
								</td>
							</tr>
						</c:forEach>

					</tbody>


				</table>
                   

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


   
    
  
     

</html>
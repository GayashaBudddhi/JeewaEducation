<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

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
    <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- datatables -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.css" />


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){

$('#fileImage').change(function(){
	debugger
//showImageThumbnail(this);

	file=this.files[0]
	reader=new FileReader();
	reader.onload=function(e){

	$('#thumbNail').attr('src',e.target.result);
		
	};
	reader.readAsDataURL(file);	
	
});
	
})







</script>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <c:if test="${pageContext.request.userPrincipal.principal.user.userType == 'LECTURE'}">
	 		<jsp:include page="../template/menu_lecture.jsp" />
		</c:if>
        <c:if test="${pageContext.request.userPrincipal.principal.user.userType == 'ADMIN-LECTURE'}">
	 		<jsp:include page="../template/menu_admin_lecture_handling.jsp" />
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
                    <h1 class="h3 mb-2 text-gray-800" id="pending_stu_update_text">Lecture Material Upload</h1>
                  
							<div class="col-md-12">

			<form:form action="uploadlecturematerial" method="post"
				modelAttribute="study_material"  enctype="multipart/form-data">
				<fieldset class="content-group">
					<form:label path="">Subject </form:label>
					<select name="subject" class="custom-select mr-sm-2">
						<c:forEach items="${subjectList}" var="subject">
							<option value="${subject.subjectId}">${subject.subjectCode}</option>
						</c:forEach>
					</select>
				</fieldset>
				<fieldset class="content-group">
					<form:label path="">Material Type</form:label>
					<select name="materaial_type" class="custom-select mr-sm-2">
						<c:forEach items="${materilTypeList}" var="type">
							<option value="${type.materialTypeId}">${type.materialType}</option>
						</c:forEach>
					</select>
				</fieldset>
				<fieldset class="content-group">
					<form:label path="Description">Description</form:label>
					<form:textarea class="form-control" path="description" rows="5"
						cols="30" />
				</fieldset>

				<fieldset class="content-group">
				
				 <form:label path="">Select a file to upload</form:label>
                   <input type="file" name="fileImage"  id="fileImage"/>
                   <img id="thumbNail"  alt="Document Preview"/>
				
				</fieldset>
				<br>
								
				<form:button  type="submit" class="btn btn-success" data-toggle="modal"
					data-target="#exampleModal" >Upload Material</form:button>
									
				<form:button type="button" class="btn btn-primary"
					data-toggle="modal" data-target="#exampleModal">Cancel</form:button>

			</form:form>

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
    
  
    <script src="views/student/pending_students.js"></script>    
   	<!-- datatables -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.js"></script>
	<script>
		function saveUser() {

			//var x = document.getElementById("userfrom")
			var queryString = $('#userfrom').formSerialize();
			$.post('/userSave', queryString, function(response) {
				// Log the response to the console
				//debugger
			});
		}
	</script>

</body>

</html>
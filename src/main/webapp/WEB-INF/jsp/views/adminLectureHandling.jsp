
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

$(document).ready(function() {
    var table=$('#qualification_table').DataTable(); 
 // Hide columns
    table.columns( [0] ).visible( false );
} );

function lodaQualification(id){
	//debugger
$(document).ready( function(){
$("#exampleModal").modal("show");

$('#qualification_table').dataTable().fnDestroy();
$.ajax({
	url:"/getQualification/userId"+id,
	type:"GET",
	dataType:"JSON",
	success:function(data)
	{
		//debugger
		$('#qualification_table').dataTable({
			"aaData":data,
			"scrollx":true,
			"scrollCollapse": true,
			"aoColumns":
				[
				{"sTitle":"Qualification Name","mData":"qulificationName"},
				{"sTitle":"Date From","mData":"fromDate"},
				{"sTitle":"Date To","mData":"toDate"},
				{"sTitle":"Qualification Type","mData":"qulificationType"},
				{"sTitle":"Institute/Company","mData":"instituteOrCompay"},
				{"sTitle":"Major","mData":"major"}
				]
		
		

			})

		}
});


}
);
}
//approve a user
function approveUser(id){
var r=confirm("Do You Want to Aprove User")
if(r==true)	  {	
$.ajax({
	url:"/approveUser/userId"+id,
	type:"GET",
	dataType:"JSON",
	success:function(data){
		alert("User Aproved Sucessfully");
		document.location.href="/loadAdminlectureHandling";
		}
})
}
	
}

//reject user
function rejectUser(id){
	var r=confirm("Do You Want to rejcct User")	
	if(r==true){
$.ajax({
	url:"/rejectUser/userId"+id,
	type:"GET",	
	dataType:"JSON",
	success:function(data){
		alert("User Rejected Sucessfully");
		document.location.href="/loadAdminlectureHandling";
		}
})
	}	
} 




$('#subejectsModel').on('shown.bs.modal', function (e) {
	debugger
	$('#framework').val(null).trigger('change');
	})


//asign subjets to lectures
function addSubjects(id){

	
debugger

$(document).ready(function(){

	
	$("#subejectsModel").modal("show")	
	
	document.getElementById("user_id_subject").value=id;
	var newnotesecurity = $("#framework").val();
	//debugger
	$.ajax({
		url:"/getAllSubjects"+id,
		type:"GET",
		success: function (data) {
			debugger
			var unassined_len=data.unassined.length;
			var str = '';
			for(var i=0;i<unassined_len;i++){
				
			var id=data.unassined[i]['subjectId'];
			var code=data.unassined[i]['subjectCode'];
			str += "<option value='"+id+"'>"+code+"</option>";

				}	
			$("#framework").html(str);
			var assgnedArray = new Array(data.assigned.length);
			var assignedd_len=data.assigned.length;
			for(var i=0;i<assignedd_len;i++){
				assgnedArray[i]=data.assigned[i]['subjectId'];
			
			}
	
			
			$('#framework').select2().select2('val', assgnedArray)
		
			
			
			}
		});

})
	
	
}

$(document).ready(function(){
    $(".mul-select").select2({
            placeholder: "Assign Subjects", //placeholder
            tags: true,
            tokenSeparators: ['/',',',';'," "] 
        });
    })

    
    
    function saveSubjects(){
   //debugger
	var form = $('#SubjectsForm');
	var x= form.serialize();
	var subjects = $("#framework").val();
	var user_id =document.getElementById("user_id_subject").value
	//debugger
	var subArray = new Array(subjects.length);

	//var v=JSON2.stringify(subArray ); 
	debugger
	$.ajax({
		type: "POST",
		dataType: "JSON",
		url: "/saveuserSubjects",
		data: {
			subjectes: subjects,
			user_id:user_id

			},
				success: function (data) {
		var result=data;
		
		
		}
		});

    }


function resetModel(){
	//debugger
	//var len=data.length;

	x=document.getElementById("#framework").value;

}

function validateForm() {
	debugger
	var report_type=document.getElementById("type").value
	  if (report_type == "") {
	    alert("Please Selcet valid Report type");
	    return false;
	  }
	}
</script>

<meta charset="ISO-8859-1">
<title>admin Lecture Hadling</title>
</head>


<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
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

                   				<table  class="display" style="width:100%"
					id="example">
					<thead>
						<tr>
							<th>UserID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Gender</th>
							<th>Email</th>
							<th>Birthday</th>
							<th>National Id No</th>
							<th>University</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${userList}" var="user">
							<tr>
								<td><c:out value="${user.userId }" /></td>
								<td><c:out value="${user.fName }" /></td>
								<td><c:out value="${user.lName }" /></td>
								<td><c:out value="${user.gender }" /></td>
								<td><c:out value="${user.email }" /></td>
								<td><c:out value="${user.birthday }" /></td>
								<td><c:out value="${user.nicNo }" /></td>
								<td><c:out value="${user.university }" /></td>
								<td><c:out value="${user.status }" /></td>
								<td>
										<button type="button" class="btn btn-warning btn-sm"
										onclick="lodaQualification(${user.userId})">show
										Qualification</button> 
									<button type="button" class="btn btn-success btn-sm"
										onclick="approveUser(${user.userId})">Approve User</button> <!--<a href="/rejectUser?userId=${user.userId}" class="btn btn-danger btn-sm">Reject User</a>  -->
									<button type="button" class="btn btn-danger btn-sm"
										onclick="rejectUser(${user.userId})">Reject User</button>
									<button type="button" class="btn btn-info btn-sm"
										onclick="addSubjects(${user.userId})">Assign Subjects</button>

								</td>
							</tr>
						</c:forEach>

					</tbody>


				</table>
                   

                </div>

				<div class="col-md-12">
					<form action="getLecturereport" onsubmit="return validateForm()" method="get" id="reortGen">
					<div class="row">
						<div class="col-md-1">
							<button type="submit"class="btn btn-success">Print</button>
						</div>
						<div  class="col-md-2">
							<select class="custom-select mr-sm-2" id="type" name="reportType">
								<option value="" disabled selected hidden>Choose Type</option>
								<option value="APPROVED">APPROVED</option>
								<option value="REJECTED">REJECTED</option>
								<option value="PENDING">PENDING</option>
								<option value="PENDING-UPDATE">PENDING-UPDATE</option>
								
							</select>
							</div>
						
						</div>
					</form>
				</div>
				<!-- /.container-fluid -->
                
                	<!-- Modal  Qualification -->
	<div class="modal fade bd-example-modal-xl" id="exampleModal"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">

		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Qualifications</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<table border="1" class="table table-striped table-borded"
								id="qualification_table">
								<thead>
									<tr>
										<th>Qualification Name</th>
										<th>Date From</th>
										<th>Date To</th>
										<th>Qualification Type</th>
										<th>Institute/Company</th>
										<th>Major</th>


									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
					</div>

				</div>

			</div>
		</div>

	</div>
	<!-- Model Assign Subjects -->

	<div class="modal" tabindex="-1" role="dialog" id="subejectsModel">

		<form method="post" id="SubjectsForm">

			<input type="hidden" class="form-control" name="userId"
				id="user_id_subject" />
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Assign Subjects for lecture</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div align="center">

							<label>Assigned Subjects: </label> <select class="mul-select"
								id="framework" name="subject_id" style="width: 400px"
								multiple="true">

							</select>

						</div>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onClick="saveSubjects()">Save changes</button>
						<button type="button" class="btn btn-secondary"
							onClick="resetModel()" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</form>
	</div>
                
                

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
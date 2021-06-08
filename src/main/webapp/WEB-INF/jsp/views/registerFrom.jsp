<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Bootstrap Simple Registration Form</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>


<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


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


<!--datepic-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--datepic-->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<!-- datatables -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.css" />


<style>
body {
	color: #fff;
	background: #63738a;
	font-family: 'Roboto', sans-serif;
}
.form-control {
	height: 30px;
	box-shadow: none;
	color: #969fa4;
}
.form-control:focus {
	border-color: #5cb85c;
}
.form-control, .btn {        
	border-radius: 3px;
}
.signup-form {
	width: 450px;
	margin: 0 auto;
	padding: 30px 0;
  	font-size: 15px;
}
.signup-form h2 {
	color: #636363;
	margin: 0 0 15px;
	position: relative;
	text-align: center;
}
.signup-form h2:before, .signup-form h2:after {
	content: "";
	height: 2px;
	width: 30%;
	background: #d4d4d4;
	position: absolute;
	top: 50%;
	z-index: 2;
}	
.signup-form h2:before {
	left: 0;
}
.signup-form h2:after {
	right: 0;
}
.signup-form .hint-text {
	color: #999;
	margin-bottom: 30px;
	text-align: center;
}
.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #f2f3f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.signup-form .form-group {
	margin-bottom: 20px;
}
.signup-form input[type="checkbox"] {
	margin-top: 3px;
}
.signup-form .btn {        
	font-size: 16px;
	font-weight: bold;		
	min-width: 140px;
	outline: none !important;
}
.signup-form .row div:first-child {
	padding-right: 10px;
}
.signup-form .row div:last-child {
	padding-left: 10px;
}    	
.signup-form a {
	color: #fff;
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #5cb85c;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}  

.error {
  	color: red;
  	font-style: italic;
  	font-size: 11px;
}

.btn-xs {
	padding: 1px 5px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}
.modal-header {
    padding:9px 15px;
    border-bottom:1px solid #eee;
    background-color: #63738a;
    -webkit-border-top-left-radius: 5px;
    -webkit-border-top-right-radius: 5px;
    -moz-border-radius-topleft: 5px;
    -moz-border-radius-topright: 5px;
     border-top-left-radius: 5px;
     border-top-right-radius: 5px;
 }
		
</style>
</head>
<body>
<div class="signup-form">
			<form:form action="userSave" method="post" modelAttribute="lecture" id="userfrom">
			<h4>Personal Details</h4>
			<form:input type="hidden" class="form-control" path="userId"
				id="user_id" />
			<div class="form-group">		
			<form:input class="form-control" path="fName"  placeholder="first Name"/>
			<form:errors path="fName" cssClass="error" /> 
			</div>
			<div class="form-group">	
			<form:input class="form-control" path="lName" placeholder="Last Name"/>
			<form:errors path="lName" cssClass="error" /> 
			</div>
			<div class="form-group">	
			<form:input class="form-control" path="email"  placeholder="Email" />
			<form:errors path="email" cssClass="error" /> 
			</div>
			<div class="form-group">	
				<form:select path="gender" class="form-control" placeholder="Gender">
				 <form:option value="default-value" label="Please Select" />
				<form:option value="Male" />
				<form:option value="Female" />
			</form:select>
			<form:errors path="gender" cssClass="error" /> 
			</div>
			<div class="form-group">	
			<form:input path="birthday" class="form-control" type="text" id="datepickerBirthday"  placeholder="BirthDay"/>
			<form:errors path="birthday" cssClass="error" /> 
			</div>
			<div class="form-group">
			<form:input path="nicNo" class="form-control" placeholder="Nic No" />
			<form:errors path="nicNo" cssClass="error" /> 
			</div>
			<div class="form-group">	
				<form:select path="userType" class="form-control" placeholder="Application Type">
				 <form:option value="default-value" label="Please Select" />
				<form:option value="Lecture"  />
				<form:option value="Student" />
			</form:select>
			<form:errors path="userType" cssClass="error" /> 
			</div>
			<div class="form-group">	
			<form:input path="university" class="form-control" placeholder="University" />
			<form:errors path="university" cssClass="error" /> 
			</div>
			<div class="form-group">	
			<form:button class="btn btn-success" style="margin-left: 10%" onClick="saveUser()">Register</form:button>
				<form:button type="button" class="btn btn-primary"
				  onClick="test()">Qualifications</form:button>
				</div>
			
		</form:form>

</div>

		
			<!-- Modal -->
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
					<form action="POST" id="qulificationform">
						<div class="row">
							<div class="col-md-3">
								<fieldset class="content-group">
									<input type="hidden" class="form-control" name="userId"
										id="user_id-qualification" /> 
										 <input class="form-control" name="qulificationName" placeholder="Qualification Type" />
								</fieldset>
							</div>
							<div class="col-md-3">
								<fieldset class="content-group">
									 <input class="form-control"
										name="fromDate" type="text" id="datepickerFrom" placeholder="Date From" />
								</fieldset>
							</div>
							<div class="col-md-3">
								<fieldset class="content-group">
									<input class="form-control"
										name="toDate" type="text" id="datepickerTo" placeholder="Date To"/>
								</fieldset>
							</div>
							<div class="col-md-3">
								<fieldset class="content-group">
									 <select
										class="custom-select mr-sm-2" name="qulificationType">
										 <option value="" disabled selected hidden>Choose Type</option>
										<option value="Educational">Educational</option>
										<option value="Professional">Professional</option>
									</select>
								</fieldset>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<fieldset class="content-group">
									 <input class="form-control"
										name="instituteOrCompay" placeholder="Institute/Company" />
								</fieldset>
							</div>
							<div class="col-md-3">
								<fieldset class="content-group">
								<textarea class="form-control" name="major" placeholder="Major" rows="3"></textarea>
								</fieldset>
							</div>
							<div id="btn-cluster" class="pull-right">
								<br /> <br />
								<button type="button"  class="btn btn-success"  onclick="dd()">Add
									Qulification</button>
								<!-- <button type="submit" class="btn btn-danger btn-sm" data-dismiss="modal">Clear</button>  -->
							</div>

						</div>

					</form>

					<div class="container" style="margin-top: 50px">
						<div class="row">
							<div class="col-md-12">
								<table id="qualification_table" border="1"
									class="table table-striped table-borded">
									<thead>
										<tr class="thead-dark">
											<th>Qualification Name</th>
											<th>Date From</th>
											<th>Date To</th>
											<th>Qualification Type</th>
											<th>Institute/Company</th>
											<th>Major</th>
											<th>Action</th>
											</tr>
									</thead>
									<tbody>
										<c:forEach items="${qualificationList}" var="qualification">
											<tr>
												<td><c:out value="${qualification.qulificationName }" /></td>
												<td><c:out value="${qualification.fromDate }" /></td>
												<td><c:out value="${qualification.toDate }" /></td>
												<td><c:out value="${qualification.qulificationType }" /></td>
												<td><c:out value="${qualification.instituteOrCompay }" /></td>
												</tr>

										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>




				</div>





				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" onClick="sendtoApprovalLecture()" class="btn btn-primary">Send to Approval</button>
				</div>
			</div>
		</div>

	</div>


	<!-- datatables -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#qualification_table').DataTable();
		});
		$(function() {
			$("#datepickerFrom").datepicker({
				dateFormat : 'yy-mm-dd'
			});
			$("#datepickerTo").datepicker({
				dateFormat : 'yy-mm-dd'
			});
			$("#datepickerBirthday").datepicker({
				dateFormat : 'yy-mm-dd'
			});
			$('#myModal').on('shown.bs.modal', function() {
				$('#myInput').trigger('focus')
			})
		});

		function saveUser() {

			//var x = document.getElementById("userfrom")
			var queryString = $('#userfrom').formSerialize();
			$.post('/userSave', queryString, function(response) {
				// Log the response to the console
				//debugger
			});
		}

		function lodaQualification() {
			debugger
			var user = document.getElementById("user_id").value;
			$('#qualification_table').DataTable().clear().destroy();
			$(document).ready(function() {
				$.ajax({
					url : "/getQualification/userId" + user,
					type : "GET",
					dataType : "JSON",
					success : function(data) {
						//debugger
						$('#qualification_table').dataTable({
							"aaData" : data,
							"scrollx" : true,
							"scrollCollapse" : true,
							"aoColumns" : [ {
								"sTitle" : "Qualification Name",
								"mData" : "qulificationName"
							}, {
								"sTitle" : "Date From",
								"mData" : "fromDate"
							}, {
								"sTitle" : "Date To",
								"mData" : "toDate"
							}, {
								"sTitle" : "Qualification Type",
								"mData" : "qulificationType"
							}, {
								"sTitle" : "Institute/Company",
								"mData" : "instituteOrCompay"
							}, {
								"sTitle" : "Major",
								"mData" : "major"
							},  {
							      "mData": null,
							      "bSortable": false,
							      "mRender": function(data, type, full,row,meta) {
								      //debugger
							    	  return '<button class="btn btn-danger btn-sm" data-name="' + data.qualificationId+ '">Delete</button>';
							      }
							    }
							 ]

						})

					}
				});

			});
		}

		function dd() {
			//$('#qualification_table').dataTable().fnDestroy();
			var user = document.getElementById("user_id").value;
			document.getElementById("user_id-qualification").value = user;
			var c = 0;
			var form = $('#qulificationform');
				$.ajax({
					type : "POST",
					url : "/qulificationSave",
					data : form.serialize(),
					success : function(data) {
						debugger
						var result = data;
						$("#qualification_table").dataTable().fnDestroy();
						lodaQualification(user)

					}
				});

		}

		function sendtoApprovalLecture(){
debugger
				
			var user = document.getElementById("user_id").value;
			document.getElementById("user_id-qualification").value = user;
				$.ajax({
					type : "GET",
					url : "/sendtoApprovalLecture/userId"+user,
					success : function(data) {
						if(data==1){
							 alert("Send to Approval Sucessfully..!");
							 document.location.href="/login";
							}
						

					}
				});

			}

		$('#qualification_table').on('click', 'button', function() {
			debugger
			var userId=$(this).data('name');
			$.ajax({
				type : "GET",
				url : "/deleteQaulification/qualificationId"+userId,
				success : function(data) {
					var result = data;
					$("#qualification_table").dataTable().fnDestroy();
					lodaQualification()

				}
			});
			});
		
	function test(){
			debugger
			var user = document.getElementById("user_id").value;
			if(user==0){
			alert("Plese save persoanl Details...")
			}
			else{
			$('#exampleModal').modal("show");
			}
		}
	
	</script>

</body>
</html>
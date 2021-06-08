<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Dashboard</title>
	<!-- Sidebar -->
    <jsp:include page="../template/head.jsp" />
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
    
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

			<c:if test="${pageContext.request.userPrincipal.principal.user.userType == 'ADMIN2'}">
		 		<h1 class="h3 mb-0 text-gray-800">3333333</h1>
			</c:if>
                    <!-- Content Row -->
                    <div class="row">
                         
                             <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <a href="/loadAdminlectureHandling">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                   Lecture Handling</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>    
                        
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

    	load_chart();

    });


	function load_chart(){
		$.ajax({
			'url' : '/admin-get-chart-data',
			dataType : 'json',
			success : function(res){

				var data = {
				        labels: ['Pending', 'Foundation', 'visa'],
				        datasets: [{
				            label: '# of Votes',
				            data: [res.pending, res.foundation, res.visa],
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)'
				            ],
				            borderWidth: 1
				        }]
				    };

				var myDoughnutChart = new Chart(ctx, {
				    type: 'doughnut',
				    data: data,
				    //options: options
				});
			},
			error : function(err){
			}
		})
	}

    
var ctx = document.getElementById('myChart').getContext('2d');





</script>
    

</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>E-Library</title>

  <!-- Bootstrap core CSS -->
  <link href="/library_template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/library_template/css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/e-library">E-Library</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="/">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/e-library-search/All?search=">Materials</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/e-library-exams?search=">Online Exams</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Library Materials</h1>

    <div class="row">   

      <!-- Sidebar Widgets Column -->
      <div class="col-md-12">

        <!-- Search Widget -->
        <div class="card mb-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
            	
              <select class="form-control" style="margin-right:20px" id="select_type">
              	<option value="All">All</option>
              	<option value="Text Book" ${type == 'Text Book' ? 'selected' : ''}>Text Books</option>
              	<option value="Past Paper" ${type == 'Past Paper' ? 'selected' : ''}>Past Papers</option>
              	<option value="Supplemental Reading" ${type == 'Supplemental Reading' ? 'selected' : ''}>Supplemental Readings</option>
              </select>
            
              <input type="text" class="form-control" placeholder="Search for..." id="txt_search" value="${search}">
              <span class="input-group-append">
                <button class="btn btn-secondary" type="button" id="btn_search">Go!</button>
              </span>
            </div>
          </div>
        
        </div>
      </div>

    </div>
    
    <div class="row">
    
    <c:forEach var="item" items="${items}"> 
    	<div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="/e-library-download-item/${item.id}"></a>
          <div class="card-body">
            <h4 class="card-title">
              <img src="/library_template/img/file48.png" alt=""><a href="/e-library-download-item/${item.id}" style="font-size:14px">${item.name}</a>
            </h4>
            <p class="card-text" style="font-size:12px"><b>Reference ID -</b> ${item.referenceId}</p>
            <p class="card-text" style="font-size:12px"><b>Type -</b> ${item.type}</p>
            <p class="card-text" style="font-size:12px"><i>${item.description}</i></p>
          </div>
        </div>
      </div>
    </c:forEach>
        
    </div>
    
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Jeewa Education</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/library_template/vendor/jquery/jquery.min.js"></script>
  <script src="/library_template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script>

	$(document).ready(function(){
		
		$('#btn_search').click(function(){
			var type = $('#select_type').val();
			var search = $('#txt_search').val();

			window.open('/e-library-search/' + type + '?search=' + search, '_self');
		});
	});

  </script>

</body>
</html>
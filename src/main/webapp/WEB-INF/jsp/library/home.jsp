<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
      <a class="navbar-brand" href="/e-library">E - Library</a>
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

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: ">
        <img alt="" src="/library_template/img/elib2.jpg" style="width:100%">
          <div class="carousel-caption d-none d-md-block">
           <b> <h3 style="color:	   #993333">JEEWA </b><b>LIBRARY</h3> </b>
            
          <b><p style="color:	#867979">Welcome to the e-library system.</p></b>  
          </div>
        </div>        
      </div>     
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">
    

    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="/e-library-search/Text Book?search="><img class="card-img-top" src="#" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="/e-library-search/Text Book?search=">Text Books</a>
            </h4>
            <p class="card-text">Find all text books for every subjects.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="/e-library-search/Past Paper?search="><img class="card-img-top" src="#" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="/e-library-search/Past Paper?search=">Past Papers</a>
            </h4>
            <p class="card-text">Find all past papers for all subjects.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="/e-library-search/Supplemental Reading?search="><img class="card-img-top" src="#" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="/e-library-search/Supplemental Reading?search=">Supplemental Readings</a>
            </h4>
            <p class="card-text">Find all other supplemental reading materials.</p>
          </div>
        </div>
      </div>    
    </div>
    <!-- /.row -->

    <hr>


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

</body>
</html>
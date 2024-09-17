<%@page import="model.apointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	//Insert item---------------------------------
	if (request.getParameter("fName") != null) {
		apointment itemObj = new apointment();
		String stsMsg = itemObj.insertItem(request.getParameter("fName"), request.getParameter("lName"),
		request.getParameter("type"), request.getParameter("phone"), request.getParameter("date"),
		request.getParameter("time"), request.getParameter("messege"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Mediplus - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">
    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  	<div class="py-1 bg-black top">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ 1235 2355 98</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">youremail@email.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
						    <p class="mb-0 register-link"><a href="#" class="mr-3">Sign Up</a><a href="#">Sign In</a></p>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
     <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Mediplus</a>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav nav ml-auto">
	          <li class="nav-item"><a href="index.jsp" class="nav-link"><span>Home</span></a></li>
	          <li class="nav-item"><a href="Logincheck.jsp" class="nav-link"><span>Admin Login</span></a></li>
	          <li class="nav-item"><a href="PatientMain.jsp" class="nav-link"><span>Patient</span></a></li>
	          <li class="nav-item"><a href="#doctor-section" class="nav-link"><span>Doctors Login</span></a></li>
	          <li class="nav-item"><a href="#blog-section" class="nav-link"><span>Accountant Login</span></a></li>
	          <li class="nav-item"><a href="#contact-section" class="nav-link"><span>Contact</span></a></li>
	          <li class="nav-item cta mr-md-2"><a href="appointment.html" class="nav-link">Appointment</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	  <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-4">
            <h1 class="mb-3 bread">Appointment</h1>
             <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Appointment <i class="ion-ios-arrow-forward"></i></span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-counter img ftco-section ftco-no-pt ftco-no-pb">
    	<div class="container">
    		<div class="row d-flex">
    			<div class="col-md-6 col-lg-5 d-flex">
    				<div class="img d-flex align-self-stretch align-items-center" style="background-image:url(images/about.jpg);">
    				</div>
    			</div>
    			
        </div>
    	</div>
    </section>

    <section class="ftco-section ftco-no-pt ftco-no-pb ftco-services-2 bg-light">
			<div class="container">
        <div class="row d-flex">
	        <div class="col-md-7 py-5">
	        	<div class="py-lg-5">
		        	<div class="row justify-content-center pb-5">
			          <div class="col-md-12 heading-section ftco-animate">
			            <h2 class="mb-3">Our Services</h2>
			          </div>
			        </div>
			        <div class="row">
			        	<div class="col-md-6 d-flex align-self-stretch ftco-animate">
			            <div class="media block-6 services d-flex">
			              <div class="icon justify-content-center align-items-center d-flex"><span class="flaticon-ambulance"></span></div>
			              <div class="media-body pl-md-4">
			                <h3 class="heading mb-3">Emergency Services</h3>
			                <p>We provide 24x7 Emergency service for your helth problem and protection </p>
			              </div>
			            </div>      
			          </div>
			          <div class="col-md-6 d-flex align-self-stretch ftco-animate">
			            <div class="media block-6 services d-flex">
			              <div class="icon justify-content-center align-items-center d-flex"><span class="flaticon-doctor"></span></div>
			              <div class="media-body pl-md-4">
			                <h3 class="heading mb-3">Qualified Doctors</h3>
			                <p>A We have qulified docters in our hospital they are ready for treat you</p>
			              </div>
			            </div>      
			          </div>
			          <div class="col-md-6 d-flex align-self-stretch ftco-animate">
			            <div class="media block-6 services d-flex">
			              <div class="icon justify-content-center align-items-center d-flex"><span class="flaticon-stethoscope"></span></div>
			              <div class="media-body pl-md-4">
			                <h3 class="heading mb-3">Outdoors Checkup</h3>
			                <p>our hospital have indor and outdoor checkups.</p>
			              </div>
			            </div>      
			          </div>
			          <div class="col-md-6 d-flex align-self-stretch ftco-animate">
			            <div class="media block-6 services d-flex">
			              <div class="icon justify-content-center align-items-center d-flex"><span class="flaticon-24-hours"></span></div>
			              <div class="media-body pl-md-4">
			                <h3 class="heading mb-3">24 Hours Service</h3>
			                <p>We provide 24 hours service for your protection.</p>
			              </div>
			            </div>      
			          </div>
			        </div>
			      </div>
		      </div>
		      <div class="col-md-5 d-flex">
	        	<div class="appointment-wrap bg-white p-5 d-flex align-items-center">
		        	<form method="POST" action="appointment.jsp"  class="appointment-form ftco-animate">
		        		<h3>Free Consultation</h3>
		    				<div class="">
			    				<div class="form-group">
			    					<input type="text" class="form-control" placeholder="First Name" name='fName'>
			    				</div>
			    				<div class="form-group">
			    					<input type="text" class="form-control" placeholder="Last Name" name='lName'>
			    				</div>
		    				</div>
		    				<div class="">
		    					<div class="form-group">
			    					<div class="form-field">
	          					<div class="select-wrap">
	                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                      <select name="type" id="type" class="form-control">
	                      	<option value="">Select Your Services</option>
	                        <option value="">Neurology</option>
	                        <option value="">Cardiology</option>
	                        <option value="">Dental</option>
	                        <option value="">Ophthalmology</option>
	                        <option value="">Other Services</option>
	                      </select>
	                    </div>
			              </div>
			    				</div>
		    					<div class="form-group">
			    					<input type="text" class="form-control" placeholder="Phone" name= "phone">
			    				</div>
		    				</div>
		    				<div class="">
			    				<div class="form-group">
			    					<div class="input-wrap">
			            		<div class="icon"><span class="ion-md-calendar"></span></div>
			            		<input type="text" class="form-control appointment_date" placeholder="Date" name="date">
		            		</div>
			    				</div>
			    				<div class="form-group">
			    					<div class="input-wrap">
			            		<div class="icon"><span class="ion-ios-clock"></span></div>
			            		<input type="text" class="form-control appointment_time" placeholder="Time" name= "time">
		            		</div>
			    				</div>
		    				</div>
		    				<div class="">
		    					<div class="form-group">
			              <input type= "text" name="messege" id="messege" cols="30" rows="2" class="form-control" placeholder="Message">
			            </div>
			            <div class="form-group">
			              <input type="submit" value="Appointment" class="btn btn-secondary py-3 px-4" >
			            </div>
		    				</div>
		    			</form>
		    		</div>
	        </div>
		    </div>
			</div>
		</section>

		


    <footer class="ftco-footer ftco-section img" style="background-image: url(images/footer-bg.jpg);">
    	
	
          
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | SLIIT <i class="icon-heart color-danger" aria-hidden="true"></i> 
 
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  
  <script src="js/main.js"></script>
    
  </body>
</html>
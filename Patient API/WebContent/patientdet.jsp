<%@page import="model.PatientRegister"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	//Delete item----------------------------------
if (request.getParameter("PID") != null) {
	PatientRegister itemObj = new PatientRegister();
	String stsMsg = itemObj.deleteItem(request.getParameter("PID"));
	session.setAttribute("statusMsg", stsMsg);
}
%>
<%
	//Update item---------------------------------
	if (request.getParameter("Pcode") != null) { //`PID`,`Pcode`,`PName`,`PNIC`,`PhoneNo`,`Email`,`Address`,`Password`
		PatientRegister itemObj = new PatientRegister();
		String stsMsg = itemObj.updateItem(request.getParameter("Pcode"), request.getParameter("PName"),
		request.getParameter("PNIC"), request.getParameter("PhoneNo"), request.getParameter("Email"),
		request.getParameter("Address"), request.getParameter("Password"), request.getParameter("PID_form"));
		session.setAttribute("statusMsg", stsMsg);
	}
%> 
<!DOCTYPE html>
<html>
<head>
<title>Patient details</title>
<meta charset="ISO-8859-1">

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
						    <span class="text">+011 2 609 832</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">Mediplus@gmail.com</span>
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
	          <li class="nav-item"><a href="#home-section" class="nav-link"><span>Home</span></a></li>
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
	  


</head>


<br>
<br>
<br>
<br><br><br>
<br><br>
<center>
<body style="background-image: /Hospital_Management/WebContent/images/image_8.jpg" >
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Update Patient Details</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">          
          
          <form method="POST" action="pRedirectUpdate">
          	<input type="hidden" id="PID_form" name="PID_form"/>
						<div class="form-row m-b-55">
							<div class="name">Patient code</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="Pcode" id="Pcode_form">
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Name</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="PName" id="PName_form">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">NIC Number</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="PNIC" id="PNIC_form">
								</div>
							</div>
						</div>
						<div class="form-row m-b-55">
							<div class="name">Phone Number</div>
							<div class="value">
								<div class="row row-refine">
									<div class="col-9">
										<div class="input-group-desc">
											<input class="form-control" type="text" name="PhoneNo" id="PhoneNo_form">

										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Email</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="email" name="Email" id="Email_form">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Address</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="Address" id="Address_form">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Password</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="password" name="Password" id="Password_form">
								</div>
							</div>
						</div>

						<div>
							<button class="btn btn-primary" type="submit"
								value="Save">Update</button>


						</div>
					</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

	<%
		PatientRegister docobj = new PatientRegister();
		out.print(docobj.readItems());
	%>
	<script>
	$(document).ready(function() {

		  $('a[data-toggle=modal], button[data-toggle=modal]').click(function () {
	
		    var data_id = '';
		    
		    if (typeof $(this).data('id') !== 'undefined') {

		      data_id = $(this).data('id');
		    }
		    
		    $('#PID_form').val(data_id);
		    $('#Pcode_form').val($(this).data('todo').Pcode);
		    $('#PName_form').val($(this).data('todo').PName);
		    $('#PNIC_form').val($(this).data('todo').PNIC);
		    $('#PhoneNo_form').val($(this).data('todo').PhoneNo);
		    $('#Email_form').val($(this).data('todo').Email);
		    $('#Address_form').val($(this).data('todo').Address);
		    $('#Password_form').val($(this).data('todo').Password);
		    
		  })
		});
	</script>
	
</body>
</center>
</html>
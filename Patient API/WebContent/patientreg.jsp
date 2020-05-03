<%@page import="model.PatientRegister"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	//Insert item---------------------------------
	if (request.getParameter("Pcode") != null) { //`PID`,`Pcode`,`PName`,`PNIC`,`PhoneNo`,`Email`,`Address`,`Password`
		PatientRegister itemObj = new PatientRegister();
		String stsMsg = itemObj.insertItem(request.getParameter("Pcode"), request.getParameter("PName"),
		request.getParameter("PNIC"), request.getParameter("PhoneNo"), request.getParameter("Email"),
		request.getParameter("Address"), request.getParameter("Password"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/style.css">

<!-- Title Page-->
<title>Patient registration</title>

<!-- Icons font CSS-->
<link href="vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link href="vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet"
	media="all">

<!-- Main CSS-->
<link href="./css/adminreg.css" rel="stylesheet" media="all">

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="py-1 bg-black top">
		<div class="container">
			<div
				class="row no-gutters d-flex align-items-start align-items-center px-md-0">
				<div class="col-lg-12 d-block">
					<div class="row d-flex">
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-phone2"></span>
							</div>
							<span class="text">+011 2 609 832</span>
						</div>
						<div class="col-md pr-4 d-flex topper align-items-center">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-paper-plane"></span>
							</div>
							<span class="text">Mediplus@gmail.com</span>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="login.html">Mediplus</a>
			<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
				type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav nav ml-auto">
					<li class="nav-item"><a href="index.html class="nav-link"><span>Home</span></a></li>

					<li class="nav-item"><a href="adminHome.html" class="nav-link"><span>Admin</span></a></li>

				</ul>
			</div>
		</div>
	</nav>
	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">Patient Registration Form</h2>
				</div>
				<div class="card-body">
					<form method="POST" action="patientreg.jsp">
						<div class="form-row m-b-55">
							<div class="name">Patient Code</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="Pcode">

								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Name</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="PName">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">NIC Number</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="PNIC">
								</div>
							</div>
						</div>
						<div class="form-row m-b-55">
							<div class="name">Phone Number</div>
							<div class="value">
								<div class="row row-refine">
									<div class="col-9">
										<div class="input-group-desc">
											<input class="input--style-5" type="text" name="PhoneNo">

										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Email</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="email" name="Email">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">Address</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="Address">
								</div>
							</div>
						</div>


						<div class="form-row">
							<div class="name">Password</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="password" name="Password">
								</div>
							</div>
						</div>

						<div>
							<button class="btn btn--radius-2 btn--red" type="submit"
								value="Save">Register</button>

							<a class="btn btn-primary" href="adminHome.html" role="button">Go
								To Admin Home Page</a>

						</div>
					</form>
					<%
						out.print(session.getAttribute("statusMsg"));
					%>
					<br>

				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/datepicker/moment.min.js"></script>
	<script src="vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script src="js/global.js.js.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>

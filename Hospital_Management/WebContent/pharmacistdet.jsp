<%@page import="model.PharmacistRegister"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
//Delete item----------------------------------
if (request.getParameter("PID") != null) {
	PharmacistRegister itemObj = new PharmacistRegister();
	String stsMsg = itemObj.deleteItem(request.getParameter("PID"));
	session.setAttribute("statusMsg", stsMsg);
}
%>
<%
	//Update item---------------------------------
	if (request.getParameter("Pcode") != null) { //`PID`,`Pcode`,`PName`,`PNIC`,`PhoneNo`,`Email`,`Address`,`Password`
		PharmacistRegister itemObj = new PharmacistRegister();
		String stsMsg = itemObj.updateItem(request.getParameter("Pcode"), request.getParameter("PName"),
				request.getParameter("PNIC"), request.getParameter("PhoneNo"), request.getParameter("Email"),
				request.getParameter("Address"), request.getParameter("Password"), request.getParameter("PID_form"));
		session.setAttribute("statusMsg", stsMsg);
	}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<title>Pharmacist details</title>
</head>
<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="adminHome.html"> Go To Admin Home <span class="sr-only">(current)</span>
			</a></li>

		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
</nav>
<br>
<br>
<br>
<br>
<body>
<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Update Pharmacist Details</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">          
          
          <form method="POST" action="pRedirectUpdate">
          	<input type="hidden" id="PID_form" name="PID_form"/>
						<div class="form-row m-b-55">
							<div class="name">Pharmacist code</div>
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
		PharmacistRegister docobj = new PharmacistRegister();
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
</html>
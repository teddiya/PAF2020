<%@page import="model.DoctorRegister"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%


//Delete item----------------------------------
if (request.getParameter("DocID") != null) {
	DoctorRegister itemObj = new DoctorRegister();
	String stsMsg = itemObj.deleteItem(request.getParameter("DocID"));
	session.setAttribute("statusMsg", stsMsg);
}
%>
<%
	//Update item---------------------------------
	if (request.getParameter("DocLNo") != null) { //`PID`,`Pcode`,`PName`,`PNIC`,`PhoneNo`,`Email`,`Address`,`Password`
		DoctorRegister itemObj = new DoctorRegister();
		String stsMsg = itemObj.updateItem(request.getParameter("DocLNo"), request.getParameter("Name"),
				request.getParameter("NIC"), request.getParameter("PhoneNo"), request.getParameter("Email"),
				request.getParameter("Address"), request.getParameter("DocSpeacialist"),request.getParameter("WorkingXp"),
				request.getParameter("Password"), request.getParameter("DocID_form"));
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

<title>Doctor details</title>
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
          <h4 class="modal-title">Update Doctor Details</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">          
          
          <form method="POST" action="dRedirectUpdate">
          	<input type="hidden" id="DocID_form" name="DocID_form"/>
						<div class="form-row m-b-55">
							<div class="name">Doctor Licen code</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="DocLNo" id="DocLNo_form">

								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="name">Name</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="Name" id="Name_form">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">NIC Number</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="NIC" id="NIC_form">
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
							<div class="name">Speacialist for:</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="DocSpeacialist" id="DocSpeacialist_form">
								</div>
							</div>
						</div>
						
						<div class="form-row">
							<div class="name">Working experience</div>
							<div class="value">
								<div class="input-group">
									<input class="form-control" type="text" name="WorkingXp" id="WorkingXp_form">
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
		DoctorRegister docobj = new DoctorRegister();
	out.print(docobj.readItems());
	%>
	<script>
	$(document).ready(function() {

		  $('a[data-toggle=modal], button[data-toggle=modal]').click(function () {
	
		    var data_id = '';
		    
		    if (typeof $(this).data('id') !== 'undefined') {

		      data_id = $(this).data('id');
		    }
		    
		    $('#DocID_form').val(data_id);
		    $('#DocLNo_form').val($(this).data('todo').DocLNo);
		    $('#Name_form').val($(this).data('todo').Name);
		    $('#NIC_form').val($(this).data('todo').NIC);
		    $('#PhoneNo_form').val($(this).data('todo').PhoneNo);
		    $('#Email_form').val($(this).data('todo').Email);
		    $('#Address_form').val($(this).data('todo').Address);
		    $('#DocSpeacialist_form').val($(this).data('todo').DocSpeacialist);
		    $('#WorkingXp_form').val($(this).data('todo').WorkingXp);
		    $('#Password_form').val($(this).data('todo').Password);
		    
		  })
		});
	</script>
	
</body>
</html>
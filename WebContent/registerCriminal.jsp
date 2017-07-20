<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>


<title>CALCUTTA CRIME BRANCH</title>
<link rel="icon" type="image/jpg" href="images/Kolkata police.jpeg.jpg"/>

<style type="text/css">
body{
background-image:url("images/12.png");
width:100%;
height:680px;
background-size: 100% 100%;
color:black;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 16px;
line-height: 1.5em;
}
</style>
</head>
<body>
	<% String msg = request.getParameter("add_criminal");	
		//List<Citi> courses = (List<Course>)session.getAttribute("courses");		
	%>
	<center><h2>ADDITION CRIMINAL Page</h2></center>
	<center>
		<%	if(msg!=null){
				if(msg.equals("success")){
		%>
			<b>Criminal Registered Successfully...!</b>
		<%			
				}else if(msg.equals("failed")){
		%>
					<b> Criminal Registration Failed...!</b>
		<%		
				}
			}
		%>
	</center>	
	
<div class="container col-sm-6 col-sm-offset-3" style="background: #eee;">
<h2><bold>ADD CRIMINAL DETAILS</bold></h2>
<form action="add_criminal" method="POST">
	<div class="form-group">
      		<label class="control-label">Criminal Name:</label>
      		<input class="form-control" type="text" required name="CmName">
      		<span class="help-block" ></span>
      	</div>
      	<div class="form-group">
      		<label class="control-label">Criminal Age:</label>
      		<input class="form-control" type="number" required name="Cmage">
      		<span class="help-block" ></span>
      	</div>
      	<div class="form-group">
      		<label class="control-label">Address:</label>
      		<select class="form-control" name="Cmaddress"">
     			<option>Select your Address</option>
	 			<option value="BANGALORE">BANGALORE</option>
	 			<option value="PUNE">PUNE </option>
	 			<option value="CHENNAI">CHENNAI</option>
	 			<option value="HYDERABAD">HYDERABAD</option>
	 		</select>
	 	</div>
	 	<div class="form-group">
      		<label class="control-label">Criminal Marks:</label>
      		<input class="form-control" type="text" required name="Cmmarks">
      		<span class="help-block" ></span>
      	</div>
      	<div class="form-group">
      		<label class="control-label">Crime Details:</label>
      		<input class="form-control" type="text" required name="Cmcrimedetails">
      		<span class="help-block" ></span>
      	</div>
      	<button type="submit" class="btn btn-info" value="Sign Up"> Add Criminal Details</button><br><br>
</form>
</div><br>
	
</body>
</html>
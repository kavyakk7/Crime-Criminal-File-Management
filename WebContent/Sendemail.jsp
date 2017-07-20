<%@page import="beans.Complaint"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<style type="text/css">
body {
background: #eee;
/* background-image:url("images/10.jpg");
width:100%;
height:710px;
background-size: 100% 100%;
color: red;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 36px; */
}
</style>

</head>
<body><br><br>
	<center><h1>Complaint lodged successfully</h1></center>
	<div class="container col-sm-6 col-sm-offset-3">
	<div class="panel panel-default">
	
	<%
		String msg = request.getParameter("lodge_comp");
		Complaint c =(Complaint)session.getAttribute("comp"); 
	%>
	<div class="well">
		<h3>COMPLAINT NAME:-&nbsp; &nbsp;&nbsp;<%= c.getComp_name() %> </h3></div>
		<div class="well">
		<h3>COMPLAINT details:-&nbsp; &nbsp;&nbsp; <%= c.getComp_details() %></h3> </div>
		<div class="well">
		<h3>Your complaint id is:-&nbsp; &nbsp;&nbsp; <%= c.getComp_caseid() %> </h3></div>
		
	</div>
		 <a href="CtHome.jsp">BACK TO HOME</a>
		
</div>
</body>
</html>
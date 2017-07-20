 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
    <%@page import="beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <style>
  body{
  background: #eee;
 
  }</style>
<title>CALCUTTA CRIME BRANCH</title>
<link rel="icon" type="image/jpg" href="images/Kolkata police.jpeg.jpg"/>
</head>
<body><br><br><br>
<div class="container">
<h1>COMPLAINT LODGE FORM</h1>
<%
Citizen c =(Citizen)session.getAttribute("user");
String add = c.getC_address();
%>
<form action="lodge_comp" method="post">
  <div class="form-group">
  	  <label class="control-label">Complaint Type :</label>
      <input type="text" class="form-control" name="comp_name">      
  </div>
  <div class="form-group">
  <label class="control-label">Complaint Details:</label>
  <textarea class="form-control" rows="5" cols="50" name="comp_details"></textarea>
  <%Random rand = new Random();int randomnumber = rand.nextInt(90000);%>
  <input type="hidden" name="case_id" value="<%=randomnumber%>"/>
  <input type="hidden" name="c_address" value="<%=add%>"/>
</div>
<button class="btn btn-info type="submit" name="sbmt" value="Register">Register</button>
</form>
</div>
</body>
</html>
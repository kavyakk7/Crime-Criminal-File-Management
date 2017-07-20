<%@page import="beans.*"%>
<%@page import="utils.*"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CALCUTTA CRIME BRANCH</title>
<link rel="icon" type="image/jpg" href="images/Kolkata police.jpeg.jpg"/>
<link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

<style type="text/css">
body {
background: #eee !important;
}
</style>
</head>
<body><br><br><br><br><br><br><br><br>
	<% HttpSession sess=request.getSession();
	ComplaintUtilsDAO dao=new ComplaintUtilsDAOImpl();
	Citizen c =(Citizen)session.getAttribute("user");
	   %>
	<div class="panel panel-default col-sm-8 col-sm-offset-2">
	<center><h1>Citizen Home Page</h1></center>
	<center>
	<h2>Hello <%= c.getC_name()%>  Welcome! </h2><br>
	<%if(!sess.isNew())
		{
		List<Complaint> complaint = dao.getAllComplaintsbyCID(c.getC_id());
		for(Complaint comp : complaint) 
		{%>
			My complaint status is:-<br> <font size=40px><%=comp.getComp_name()%> ||||| <%= comp.getComp_status()  %> </font><br>
		<% }
	%>
	</center>	
	<a type="button" class="btn btn-primary col-sm-3 col-sm-offset-3" href="LodgeComp.jsp">Lodge Complaint</a>
  <a type="button" class="btn btn-primary col-sm-2 col-sm-offset-1" href="login_crime_branch.jsp">LOGOUT</a><br><br><br><br>
			
		
		<%}
		else 
		{%>WHO ARE YOU??<%
	}%>	 
	</div>	 
</body>
</html>
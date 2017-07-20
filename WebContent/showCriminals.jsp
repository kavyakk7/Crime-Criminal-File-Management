<%@page import="beans.Criminal"%>
<%@page import="java.util.List"%>
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
 body{
	background-image:url("images/9.jpg");
	width:100%;
	height:680px;
	background-size: 100% 100%;
	color:white;
	font-family: 'Britannic Bold', Arial, Helvetica, sans-serif;
	font-size: 46px;
	color: black;
	}


</style>
</head>
<body>
	<center>THE LIST OF CRIMINALS IN THE AREA ARE:</center>
	<% 
		String msg = request.getParameter("show_criminals");
		List<Criminal> criminals = (List<Criminal>)session.getAttribute("criminal");
	%>
	<div class="container" style="background: #eee;">
	<center><table class="table table-bordered">
	<tr> <thead>
      <tr>
        <th>NAME<%=" "%></th>
        <th>AGE<%=" "%></th>
        <th>CRIME<%=" "%></th>
        <th>LOCATION<%=" "%></th>
      </tr>
    </thead></tr>
	
		
	<%for(Criminal cm: criminals) {%>
			
				<tr>
				<td><%=cm.getCm_name()+" "%></td><td><%= cm.getCm_age()+" "%></td><td><%=cm.getCm_crimedetails()+" "%></td><td><%=cm.getCm_address()+" "%></td>
				</tr>
				
			<%} %>
			</table></center></div>
		
		 <a style="background: #eee;" href="PoliceLoginpage.jsp">BACK TO HOME</a>

</body>
</html>
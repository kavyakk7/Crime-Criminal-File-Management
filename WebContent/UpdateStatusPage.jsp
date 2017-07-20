<%@page import="beans.Complaint"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %> 
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
</head>
<body>

	<%
	int comp_id = Integer.parseInt(request.getParameter("comp_id"));
	String status = request.getParameter("status");
System.out.println(status);
	%>
	<center><h1>UPDATE THE LIST OF COMPLAINTS</h1></center>	
		<div class="panel panel-default col-sm-6 col-sm-offset-3">
		<div class="panel-body">
		<%
	 	ResultSet rs = null;
		String connectionURL = "jdbc:mysql://localhost:3307/crime_info"; 
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "root");
		String query = "update complaint set comp_status = '"+status+"', update_time=CURRENT_TIMESTAMP where comp_id = '"+comp_id+"'";
	    PreparedStatement preparedStmt = connection.prepareStatement(query);
	    preparedStmt.executeUpdate();
		%>
		<div class="panel-body">
			Successfully Updated status!
		</div>
	</div>
	</div>

	
</body>
</html>
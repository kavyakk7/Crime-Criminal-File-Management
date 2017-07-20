<%@page import="beans.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.PriorityQueue"%>
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
<body><br>
<% HttpSession sess=request.getSession();
	Police c =(Police)session.getAttribute("user"); 
	%>
	<div class="container">
	<h2> Crimes in : <%=c.getPs_location() %> :</h2>
	<table class="table table-bordered" >
	<tr><thead>
      <tr>
      			<th>CASE ID<%=" "%></th>
				<th>COMPLAINT NAME<%=" "%></th>
				<th>COMPLAINT DETAILS<%=" "%></th>				
				<th>COMPLAINT AREA<%=" "%></th>
				<th>COMPLAINT STATUS<%=" "%></th>
				<th>COMPLAINT TIME<%=" "%></th>
	</tr></thead>
		<tbody>
	<%
	Statement statement = null;
 	ResultSet rs = null;
	String connectionURL = "jdbc:mysql://localhost:3307/crime_info"; 
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root", "root");
	statement = connection.createStatement();
	String QueryString = "Select case_id,comp_name,comp_details,comp_area, comp_status,complaint_date from complaint WHERE comp_area='"+c.getPs_location()+"'";
	rs = statement.executeQuery(QueryString);
	while(rs.next())
	{
		%>
		<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				</tr>
		<%
	}
	%>
	</tbody>
</table></div>

</body>
</html>
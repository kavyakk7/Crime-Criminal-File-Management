<%@page import="beans.*"%>
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
HttpSession sess=request.getSession();
Police c =(Police)session.getAttribute("user"); 	
 %>
	<center><h1>UPDATE THE LIST OF COMPLAINTS</h1></center>	
	<h2>To update the status of complaint, click on the radio button of the complaint you want to update<br>
	and set the status from the dropdown</h2>
	<form action="UpdateStatusPage.jsp" method=POST>
		<div class="panel-body">
	<table class="table table-bordered" >
	<tr><thead>
      <tr>
      			<th>SELECT<%=" "%></th>
				<th>CASE ID<%=" "%></th>
				<th>COMPLAINT NAME<%=" "%></th>				
				<th>COMPLAINT DETAILS<%=" "%></th>
				<th>COMPLAINT STATUS<%=" "%></th>
				<th>COMPLAINT DATE<%=" "%></th>
				<th>STATUS UPDATE<%=" "%></th>
	</tr></thead>
		<%
		String status = null;
		Statement statement = null;
	 	ResultSet rs = null;
		String connectionURL = "jdbc:mysql://localhost:3307/crime_info"; 
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "root");
		statement = connection.createStatement();
		String QueryString = "Select comp_id, case_id ,comp_name, comp_details, comp_status, complaint_date from complaint where comp_area='"+c.getPs_location()+"'";
		rs = statement.executeQuery(QueryString);
		while(rs.next())
		{
		%>
				<tr>
				<td><input type=radio name="comp_id" value="<%=rs.getString(1)%>"></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><select name="status">
				<option>--Select Status--</option>		
				<option>SOLVED</option>
				<option>PENDING</option>
				<option>EVIDENCE COLLECTED</option>
				<option>CRIMINAL SUSPECTED</option>
				<option>IN PROGRESS</option>
				</select></td>
				</tr>
				
			<%} %>
	</table></div>
		 <div class="container" style="padding-left:60px;">  	
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="UPDATE STATUS"><br>
		</div>
	
		</form>
		<br>
</body>
</html>
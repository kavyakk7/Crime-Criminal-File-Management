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

	<% 
		String caseid = request.getParameter("caseid");		
	%>
	
	<div class="container">
	<h2> Report of Case ID : <%=caseid %> :</h2>
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
	String QueryString = "Select case_id,comp_name,comp_details,comp_area, comp_status,complaint_date,comp_c_id,comp_cm_id from complaint WHERE case_id='"+caseid+"'";
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
			if(rs.getString(5).equals("SOLVED"))
			{
			%>
			<tr>
      			<th>CITIZEN ID<%=" "%></th>
				<th>CITIZEN NAME<%=" "%></th>
				<th>CITIZEN EMAIL<%=" "%></th>				
				<th>CITIZEN ADDRESS<%=" "%></th>
				<th>CITIZEN CONTACT<%=" "%></th>
			</tr>
			<% 
			Statement statement1 = null;
		 	ResultSet rs1 = null;
		 	statement1 = connection.createStatement();
			String citizen_query = "Select c_id,c_name,c_email,c_address,c_contact from citizen WHERE c_id='"+rs.getString(7)+"'";
			rs1 = statement1.executeQuery(citizen_query);
			while(rs1.next())
			{
			%>
			<tr>
				<td><%=rs1.getString(1)%></td>
				<td><%=rs1.getString(2)%></td>
				<td><%=rs1.getString(3)%></td>
				<td><%=rs1.getString(4)%></td>
				<td><%=rs1.getString(5)%></td>
			</tr>
			<tr>
      			<th>CRIMINAL ID<%=" "%></th>
				<th>CRIMINAL NAME<%=" "%></th>
				<th>CRIMINAL AGE<%=" "%></th>				
				<th>CRIMINAL ADDRESS<%=" "%></th>
				<th>CRIMINAL MARKS<%=" "%></th>
				<th>CRIMINAL CRIME DETAILS<%=" "%></th>
			</tr>
			<% 
			Statement statement2 = null;
		 	ResultSet rs2 = null;
		 	statement2 = connection.createStatement();
			String criminal_query = "Select cm_id,cm_name,cm_age,cm_address,cm_marks,cm_crimedetails from criminal WHERE cm_id='"+rs.getString(8)+"'";
			rs2 = statement2.executeQuery(criminal_query);
			while(rs2.next())
			{
			%>
			<tr>
				<td><%=rs2.getString(1)%></td>
				<td><%=rs2.getString(2)%></td>
				<td><%=rs2.getString(3)%></td>
				<td><%=rs2.getString(4)%></td>
				<td><%=rs2.getString(5)%></td>
				<td><%=rs2.getString(6)%></td>
			</tr>
		<%
		}
		}
	}
	}
	rs.close();
	
	%>
	</tbody>
</table></div>

</body>
</html>
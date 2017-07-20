<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
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
<form action="ViewPolice.jsp" method=POST>
<% HttpSession sess=request.getSession();
	Police c =(Police)session.getAttribute("user"); 
	PriorityQueue<Integer> pq = new PriorityQueue<Integer>();	
	%>
	<div class="container">
	<h2> Priority List :</h2>
	
	<%
	Statement statement = null;
 	ResultSet rs = null;
	String connectionURL = "jdbc:mysql://localhost:3307/crime_info"; 
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root", "root");
	statement = connection.createStatement();
	//case_id, int comp_id, String comp_name, String comp_details, Citizen cityzn, String comp_status,String comp_area
	String QueryString = "Select comp_id from complaint";
	rs = statement.executeQuery(QueryString);
	while(rs.next())
	{
		int cid = Integer.parseInt(rs.getString(1));
		pq.add(cid);
	}
	rs.close();
	String cids ="(";
	Iterator<Integer> itr = pq.iterator();
//	System.out.println("Iterating over PriorityQueue"); 
	while(itr.hasNext())
	{
		cids += itr.next().toString()+","; 
	}
	cids = cids.substring(0, cids.length()-1);
	cids += ')';
	
	String areas = "(";
	Statement s1 = connection.createStatement();
	String query11="Select area from state_and_area where state='"+c.getPs_location()+"'";
 	ResultSet rs3 = s1.executeQuery(query11);
 	while(rs3.next())
 	{
 		areas += "'"+rs3.getString(1)+"',";
 	}
 	areas = areas.substring(0, areas.length()-1);
 	areas += ")";
	%>
	<h2>Displaying all pending cases in the order of priority!</h2>
	<table class="table table-bordered" >
	<tr><thead>
      <tr>
      			<th>SELECT<%=" "%></th>
      			<th>CASE ID<%=" "%></th>
				<th>COMPLAINT NAME<%=" "%></th>
				<th>COMPLAINT DETAILS<%=" "%></th>				
				<th>COMPLAINT AREA<%=" "%></th>
				<th>COMPLAINT DATE<%=" "%></th>
				<th>COMPLAINT STATUS<%=" "%></th>
				<th>DAYS FROM CASE UPDATE<%=" "%></th>
	</tr></thead>
		<tbody>
		<%
		Statement statement1 = null;
		ResultSet rs1 = null;
		statement1 = connection.createStatement();
		//case_id, int comp_id, String comp_name, String comp_details, Citizen cityzn, String comp_status,String comp_area
		String QueryString1 = "Select case_id,comp_name,comp_details,comp_area,complaint_date,comp_status,DATEDIFF(CURRENT_TIMESTAMP,update_time) from complaint where comp_area in "+areas+" and comp_id in "+cids+" and comp_status<>'SOLVED'";
		rs1 = statement1.executeQuery(QueryString1);
		while(rs1.next())
		{
			%>
			<tr>
				<td><input type = radio name="caseid" value="<%=rs1.getString(1)%>"></td>
				<td><%=rs1.getString(1)%></td>
				<td><%=rs1.getString(2)%></td>
				<td><%=rs1.getString(3)%></td>
				<td><%=rs1.getString(4)%></td>
				<td><%=rs1.getString(5)%></td>
				<td><%=rs1.getString(6)%></td>
				<td><%=rs1.getString(7)%></td>
			</tr>			
			<%
		}
		%>
	</tbody>
</table></div>
<center><input type = submit value="CHECK ASSIGNED POLICE"></center>
</form>
<br>
<br>
</body>
</html>
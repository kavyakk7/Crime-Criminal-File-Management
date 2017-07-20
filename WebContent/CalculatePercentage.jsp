<%@page import="beans.*"%>
<%@page import="utils.*"%>
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
<div class="container col-sm-6 col-sm-offset-3">	 
<div class="panel panel-default ">
<center><h2>View Percentage By Area or Crime </h2></center>
  <div class="panel-heading">
  <div class="container" style="padding-left:60px;">
<% HttpSession sess=request.getSession();
	ComplaintUtilsDAO dao=new ComplaintUtilsDAOImpl();
	Police c =(Police)session.getAttribute("user");
	   if(!sess.isNew())
	   {%>
<form action="CalculatePercentage.jsp" method=POST>
<%
String connectionURL = "jdbc:mysql://localhost:3307/crime_info"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "root");

String areas = "(";
Statement statement0 = connection.createStatement();
String query12="Select area from state_and_area where state='"+c.getPs_location()+"'";
ResultSet rs0 = statement0.executeQuery(query12);
while(rs0.next())
{
	areas += "'"+rs0.getString(1)+"',";
}
areas = areas.substring(0, areas.length()-1);
areas += ")";	

int total_complaints = 0;
Statement statement1 = null;
ResultSet rs1 = null;

statement1 = connection.createStatement();
String QueryString1 = "Select COUNT(*) from complaint";
rs1 = statement1.executeQuery(QueryString1);
while(rs1.next())
{
	total_complaints = Integer.parseInt(rs1.getString(1));
}
%>
<select name = "crime">
<option>--Select Crime--</option>
<%
Statement statement = null;
ResultSet rs = null;
statement = connection.createStatement();
String QueryString = "Select DISTINCT comp_name from complaint where comp_area in "+areas;
rs = statement.executeQuery(QueryString);
while(rs.next())
{
%>
	<option><%=rs.getString(1) %></option>
<%
}
%>
</select>
<br><br>
	<% 
		String crime = null;
		if(request.getParameter("crime")!=null)
		{
			crime = request.getParameter("crime");
			int total_crime = 0;
			Statement statement2 = null;
			ResultSet rs2 = null;
			statement2 = connection.createStatement();
			String QueryString2 = "Select COUNT(*) from complaint where comp_name='"+crime+"' and comp_area in "+areas;
			rs2 = statement2.executeQuery(QueryString2);
			while(rs2.next())
			{
				total_crime = Integer.parseInt(rs2.getString(1));
			}%>
			<h2> Percentage of crime : <%=crime %> :</h2>
			<%
			System.out.println("complaints:"+total_complaints);
			System.out.println("location:"+total_crime);
			double per_crime = (total_crime*100)/total_complaints;
			System.out.println("per_crime:"+per_crime);
			%>
				===> <%=per_crime %>
			<%
		}
		else
		{
			%>
			Select a crime to view it's percentage!
			<%
		}
	%>
	<br><br>
	<input type=submit value=" View Percentage of Crime ">
	
<br>
<br>
<select name = "loc">
<option>--Select Location--</option>
<%
Statement statement3 = null;
ResultSet rs3 = null;
statement3 = connection.createStatement();
String QueryString3 = "Select DISTINCT comp_area from complaint where comp_area in "+areas;
rs3 = statement3.executeQuery(QueryString3);
while(rs3.next())
{
%>
	<option><%=rs3.getString(1) %></option>
<%
}
%>
</select>
<br><br>
	<% 
		String location = null;
		int total_crime = 0;
		if(request.getParameter("loc")!=null)
		{
			location = request.getParameter("loc");
			int total_location = 0;
			Statement statement4 = null;
			ResultSet rs4 = null;
			statement4 = connection.createStatement();
			String QueryString4 = "Select COUNT(*) from complaint where comp_area='"+location+"' and comp_area in "+areas;
			rs4 = statement4.executeQuery(QueryString4);
			while(rs4.next())
			{
				total_location = Integer.parseInt(rs4.getString(1));
			}%>
			<h2> Percentage of crime in <%=location %> :</h2>
			<%
			System.out.println("complaints:"+total_complaints);
			System.out.println("location:"+total_location);
			double per_crime = (total_location*100)/total_complaints;
			System.out.println("location crimes:"+per_crime+"%");
			%>
				===> <%=per_crime %>
			<%
		}
		else
		{
			%>
			Select a location to view it's crime percentage!
			<%
		}
	   }
	%>
	<br><br>
	<input type=submit value=" View Percentage of Crime at Location ">
</form>
</div>
</div>
</div>
</div>
</body>
</html>
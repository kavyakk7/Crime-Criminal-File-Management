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
<form action="AssignNewPolice.jsp" method=POST>
<%
String caseid = request.getParameter("caseid");
String area = null;
String old_police = null;
String connectionURL = "jdbc:mysql://localhost:3307/crime_info"; 
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "root");
Statement statement3 = null;
ResultSet rs3 = null;
statement3 = connection.createStatement();
String QueryString3 = "Select ps_name,ps_location from police where case_assigned LIKE '%"+caseid+"%' and ps_name<>'"+c.getPs_name()+"'";
rs3 = statement3.executeQuery(QueryString3);
while(rs3.next())
{
	old_police = rs3.getString(1);
	area = rs3.getString(2);
	System.out.println("old police:"+old_police);
	System.out.println("area:"+area);
%>
	<br>
	Currently the case <%=caseid %> is assigned to Police <label><%=rs3.getString(1) %></label>
	<br>
	<br>
<%
}
%>
<input type=hidden name="caseid" value="<%=caseid%>">
<input type=hidden name="old_police" value="<%=old_police%>">
<select name = "police">
<option>--Select Police--</option>
<%
Statement s = connection.createStatement();
ResultSet rs = null;
String query = "Select ps_name from police where ps_location = '"+area+"' and ps_name<>'"+old_police+"'";
rs = s.executeQuery(query);
while(rs.next())
{
%>
	<option><%=rs.getString(1) %></option>
<%
}
}
%>
</select>
	<br><br>
	<input type=submit value=" Assign New Police ">
</form>
</div>
</div>
</div>
</div>
</body>
</html>
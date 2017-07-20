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

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<style type="text/css">
body{
	background : url("images/police-tape1.jpg");
	width:100%;
	height:680px;
	background-size: 100% 100%;
	background-color:light turquoise;
	
	background-repeat:repeat-x;
	padding:50px 30px 50px 80px;
	}
.infos{
	 
     
     width:500px;
     height: 300px;
     font-variant:small-caps;
     font_style:bold;
     float:center;
     }
    #link{
    background-color:blue;}
     </style>


</head>
<body>
	<%-- <% HttpSession sess=request.getSession();
	ComplaintUtilsDAO dao=new ComplaintUtilsDAOImpl();
	Police c =(Police)session.getAttribute("user");
	   if(!sess.isNew())
	   {
	%>
		<center>
		<font size=30px>Hello <%= c.getPs_name() %> Sir,  Welcome! <br>
		<font size=20px color="red">Your Area is <%= c.getPs_location() %> </font>
		</font>
		</center>
		<%}
		else 
		{%>
		WHO ARE YOU??
		<%
	}%> --%>
<div class="container col-sm-6 col-sm-offset-3">	 
<div class="panel panel-default ">
  <div class="panel-heading">
  	<h1><center>POLICE LOGIN PAGE</center></h1>
  </div>
  <div class="panel-body">
  <div>
  <% HttpSession sess=request.getSession();
	ComplaintUtilsDAO dao=new ComplaintUtilsDAOImpl();
	Police c =(Police)session.getAttribute("user");
	   if(!sess.isNew())
	   {%><div class="well">
  <center><h1>Hello <i><%= c.getPs_name() %></i> Sir,  Welcome!</h1>
		<h2>Your Area is <%= c.getPs_location() %> </h2></center>
		<%}
		else 
		{%>
		WHO ARE YOU??
		<%
	}%>	</div><br>	
  </div><div class="container" style="padding-left:60px;">
  	
  	</div><div class="container" style="padding-left:60px;">
  	<form action="registerCriminal.jsp" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value=" ADD CRIMINAL INFO"><br>
	</form><br>  	
  	<form action="show_criminals" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value=" LIST ALL CRIMINAL"><br>
	</form><br>
	<form action="GenerateReportPage.jsp" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="GENERATE REPORT"><br>
	</form><br>
	<%
	String rank = null;
	Statement statement = null;
 	ResultSet rs = null;
	String connectionURL = "jdbc:mysql://localhost:3307/crime_info"; 
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root", "root");
	statement = connection.createStatement();
	String QueryString = "Select ps_rank from police WHERE ps_name='"+c.getPs_name()+"'";
	rs = statement.executeQuery(QueryString);
	while(rs.next())
	{
		rank = rs.getString(1);
	}
	System.out.println(rank);
	if(rank.equalsIgnoreCase("Deputy Commissioner of Police")) 
	{
		%>
		<form action="ViewAllComplaintsDCP.jsp" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="VIEW All COMPLAINTS"><br>
		</form><br>	
		<form action="ViewComplaintByCrimePage.jsp" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="VIEW COMPLAINTS BY CRIME"><br>
		</form><br>
		<form action="ViewComplaintByAreaPage.jsp" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="VIEW COMPLAINTS BY AREA"><br>
		</form><br>
		<form action="AssignCasePage.jsp" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="Assign Case To Police"><br>
		</form><br>
		<form action="ViewComplaintsByPriorityPage.jsp" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="View Pending Cases By Priority"><br>
		</form><br>
		<form action="CalculatePercentage.jsp" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="Calculate Percentage"><br>
		</form><br>
		<%
	}
	else
	{
	%>
	<form action="ViewAllComplaintsACP.jsp" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="VIEW All COMPLAINTS"><br>
	</form><br>	
	<form action="update_status" method="POST">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value=" UPDATE COMPLAINTS"><br>
	</form><br>
	<%
	}
	%>
	</div>
  </div>
  <div class="panel-footer">
  	<a type="button" class="btn btn-primary pull-right" href="login_crime_branch.jsp" id="link">LOG OUT</a>
  </div><br><br>
</div>
</div>	
</body>
</html>
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
  	<h1><center>POLICE</center></h1>
  </div>
  <div class="panel-body">
  <div>
  <% HttpSession sess=request.getSession();
	ComplaintUtilsDAO dao=new ComplaintUtilsDAOImpl();
	Police c =(Police)session.getAttribute("user");
	   if(!sess.isNew())
	   {%><div class="well">
  <center><h1>Hello <i><%= c.getPs_name() %></i> Sir,  Welcome!</h1>
		
		<form action="ViewComplaintByArea.jsp" method="POST">
  	<select name="crime">
  	<option>--Select Area--</option>
  	<% 
		//String msg = request.getParameter("show_complaints");
		String ar = (String)session.getAttribute("areas");
		Statement statement = null;
     	ResultSet rs = null;
		String connectionURL = "jdbc:mysql://localhost:3307/crime_info"; 
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "root");
		String areas = "(";
		Statement statement1 = connection.createStatement();
		String query="Select area from state_and_area where state='"+c.getPs_location()+"'";
     	ResultSet rs1 = statement1.executeQuery(query);
     	while(rs1.next())
     	{
     		areas += "'"+rs1.getString(1)+"',";
     	}
     	areas = areas.substring(0, areas.length()-1);
     	areas += ")";		
		statement = connection.createStatement();
		String QueryString = "Select DISTINCT comp_area from complaint where comp_area in "+areas;
		rs = statement.executeQuery(QueryString);
		while(rs.next())
		{
			%>
			<option><%=rs.getString(1) %></option>
			<%
		}
	%>
  	</select>
		</center>
		<%}
		else 
		{%>
		WHO ARE YOU??
		<%
	}%>	</div><br>	
	
  </div>
  <div class="container" style="padding-left:60px;">
  	
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="VIEW All COMPLAINTS"><br>
	</form><br>
  	</div>
  </div>
  <br><br>
</div>
</div>	
</body>
</html>
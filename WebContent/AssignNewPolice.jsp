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
	Police c =(Police)session.getAttribute("user");
	   if(!sess.isNew())
	   {%><div class="well">
  <center><h1>Hello <i><%= c.getPs_name() %></i> Sir,  Welcome!</h1>
		<%
		String old_police = request.getParameter("old_police");
		String ps_name = request.getParameter("police");
		String caseid = request.getParameter("caseid");
		ResultSet rs = null;
		String connectionURL = "jdbc:mysql://localhost:3307/crime_info"; 
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "root");
		String query = "UPDATE police SET case_assigned = CONCAT(if(case_assigned is null ,'"+caseid+"', '"+caseid+",')) where ps_name = '"+ps_name+"'";
	    PreparedStatement preparedStmt = connection.prepareStatement(query);
	    preparedStmt.executeUpdate();
	    String query1 = "UPDATE police SET case_assigned=REPLACE(case_assigned,'"+caseid+",','') where ps_name = '"+old_police+"'";
	    PreparedStatement preparedStmt1 = connection.prepareStatement(query1);
	    preparedStmt1.executeUpdate();
		%>
			CASE #<%=caseid %> has been successfully assigned to Police <%=ps_name %>!
		</center>
		<%}
		else 
		{%>
		WHO ARE YOU??
		<%
	}%>	</div><br>	
	
  </div>
  <div class="container" style="padding-left:60px;">
  	<br>
  	</div>
  </div>
  <br><br>
</div>
</div>	
</body>
</html>
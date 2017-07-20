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
	   %><div class="well">
  <center><h1>Hello <i><%= c.getPs_name() %></i> Sir,  Welcome!</h1>
		
		<form action="AssignCaseToPolice.jsp" method="POST">
		
		<%
		String connectionURL = "jdbc:mysql://localhost:3307/crime_info"; 
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		connection = DriverManager.getConnection(connectionURL, "root", "root");
		String case_id = request.getParameter("case");
		String area=null;
		Statement statement1 = connection.createStatement();
		String query="Select comp_area from complaint where case_id='"+case_id+"'";
     	ResultSet rs1 = statement1.executeQuery(query);
     	while(rs1.next())
     	{
     		area = rs1.getString(1);
     	}
     	String police_assigned_to = null;
     	Statement statement4 = connection.createStatement();
		String query4="Select assigned_to_police from complaint where case_id='"+case_id+"'";
     	ResultSet rs4 = statement4.executeQuery(query4);
     	while(rs4.next())
     	{
     		 police_assigned_to = rs4.getString(1);
     	}
     	if(police_assigned_to==null)
     	{
		%>
		<input type=hidden name="ps_name" value=<%=c.getPs_name() %>>
  	<select name="police">
  	<option>--Select Police--</option>
  	<% 
		//String msg = request.getParameter("show_complaints");
		
		Statement statement = null;
     	ResultSet rs = null;
		statement = connection.createStatement();
		String QueryString = "Select ps_name from police where ps_name<>'"+c.getPs_name()+"' and ps_location='"+area+"'";
		rs = statement.executeQuery(QueryString);
		while(rs.next())
		{
			%>
			<option><%=rs.getString(1) %></option>
			<%
		}
				
	%>
  	</select>
  	<input type=hidden name="caseid" value=<%=case_id %>>
		</center>
			</div><br>	
	
  </div>
  <div class="container" style="padding-left:60px;">
		<input type="submit" name="sbmt" class="btn btn-primary col-sm-4" value="Assign Case to Police"><br>
	<%
	}
     	else
     	{
     		%>
     		<center><h2>The case #<%=case_id %> is already assigned to <%=police_assigned_to %></h2></center>
     		<%
     		}
     		%>
	</form><br>
  	</div>
  </div>
  <br><br>
</div>
</div>	
</body>
</html>
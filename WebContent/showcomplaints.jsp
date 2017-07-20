<%@page import="beans.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.PriorityQueue"%>
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
		String msg = request.getParameter("show_complaints");
		List<Complaint> complaints = (List<Complaint>)session.getAttribute("complaint");		
	%>
	<div class="container"><table class="table table-bordered" >
	<tr><thead>
      <tr>
      			<th>CASE ID<%=" "%></th>
				<th>COMPLAINT NAME<%=" "%></th>
				<th>COMPLAINT DETAILS<%=" "%></th>				
				<th>COMPLAINT STATUS<%=" "%></th>
				<th>COMPLAINT TIME<%=" "%></th>
	</tr></thead>
	
	<%for(Complaint c:complaints) {%>
				<tr>
				<td><%=c.getComp_caseid()+" "%></td>
				<td><%=c.getComp_name()+" "%></td>
				<td><%=c.getComp_details()%></td>
				<td><%=c.getComp_status()%></td>
				<td><%=c.getComp_date() %></td>
				</tr>
				
			<%} %>
</table></div>

</body>
</html>
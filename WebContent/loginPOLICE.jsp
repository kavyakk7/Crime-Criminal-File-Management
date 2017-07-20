<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<title>CALCUTTA CRIME BRANCH</title>
<link rel="icon" type="image/jpg" href="images/Kolkata police.jpeg.jpg"/>

<style type="text/css">
body {
background-color: #f4f4f4;
background-image:url("images/7.jpg");
no-repeat;
}
</style> 
</head>
<body>
<!--  <div id="login">
<form action="loginpolice" method="POST">
<fieldset>
<p><input type="text" required name="name"  placeholder="Enter your Name Sir"></p>
<p><input type="password" required name="password" placeholder="Enter your Password"></p>
<p><input type="submit" name="sbmt" value="Login"></p>
</fieldset>
</form>
</div> --><br><br>

<div class="container col-sm-4 col-sm-offset-4" style="background-color:#eee;">
<div class="wrapper" id="login">
    <form class="form-signin" action="loginpolice" method="POST">       
      <h3>Welcome To POLICE LoginPage</h3>
      <div class="form-group" id="email-group">                           
        <input class="form-control" type="text" required name="name"  placeholder="Enter your Name Sir">
        <span class="help-block" ></span>
      </div>
      <div class="form-group" id="user-password-group">
      	<input type="password" class="form-control" required name="password" placeholder="Enter your Password">
      	<span class="help-block" ></span>
      </div>      
      <button class="btn btn-lg btn-primary btn-block" type="submit" name="sbmt" value="Login">Login</button>   
      <br>
    </form>
</div>
</div>

</body>
</html>
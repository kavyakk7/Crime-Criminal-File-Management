<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

<title>CALCUTTA CRIME BRANCH</title>
<link rel="icon" type="image/jpg" href="images/Kolkata police.jpeg.jpg"/>
<style type="text/css">
@import "bourbon";
body {
	background: #eee !important;	
}

.wrapper {	
	margin-top: 80px;
  margin-bottom: 80px;
}

.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  

  .form-signin-heading,
	.checkbox {
	  margin-bottom: 30px;
	}

	.checkbox {
	  font-weight: normal;
	}

	.form-control {
	  position: relative;
	  font-size: 16px;
	  height: auto;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
		}
	}

	input[type="text"] {
	  margin-bottom: -1px;
	  border-bottom-left-radius: 0;
	  border-bottom-right-radius: 0;
	}

	input[type="password"] {
	  margin-bottom: 20px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
}
</style>
</head>
<body>
  <div class="wrapper" id="login">
    <form class="form-signin" action="login_citizen" method="POST" onsubmit="return validLogin();">       
      <h3>Welcome To Citizen LoginPage</h3>
      <div class="form-group" id="email-group">                           
          <input type="text" class="form-control" required name="email" placeholder="Enter your Email">
          <span class="help-block" ></span>
      </div>
      <div class="form-group" id="user-password-group">
      <input type="password" class="form-control" required name="password" placeholder="Enter your Password">
      <span class="help-block" ></span>
      </div>      
      <button class="btn btn-lg btn-primary btn-block" type="submit" name="sbmt" value="Login">Login</button>   
      <h4>Don't Have a Account ? <a href="Register.jsp">  Register Now</a></h4>
    </form>
  </div>
</body>
</html>
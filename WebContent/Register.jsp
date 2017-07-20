<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap-select.min.css">
  <script src="js/jquery-1.11.0.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.min.js"></script>	
<style>
  body{
  background: #eee;
 
  }</style>
<title>CALCUTTA CRIME BRANCH</title>
<link rel="icon" type="image/jpg" href="images/Kolkata police.jpeg.jpg"/>




</head>
<body>

	<script type="text/javascript">
$(document).ready(function () {
    $('#checkBtn').click(function() {
      checked = $("input[type=checkbox]:checked").length;

      if(!checked) {
        alert("You must check at least one checkbox.");
        return false;
      }

    });
});
function phonenumber(inputtxt)
{
  var phoneno = /^\d{10}$/;
  if(inputtxt.value.match(phoneno))
  {
      return true;
  }
  else
  {
     alert("Not a valid Phone Number");
     return false;
  }
}
function checkPassword(str)
{
  var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/;
  return re.test(str);
}
function checkForm(form1)
{
 
  if(!checkPassword(form1.password.value)) {
      alert("The password you have entered is not valid!");
      form1.password.focus();
      return false;
    }
  return true;
}

function validateEmail(Cemail){
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

    if (reg.test(Cemail.value) == false) 
    {
        alert('Invalid Email Address');
        return false;
    }

    return true;

}

function ValidateFileUpload() {
    var fuData = document.getElementById('fileChooser');
    var FileUploadPath = fuData.value;

//To check if user upload any file
    if (FileUploadPath == '') {
    	
        alert("Please upload an image");

    } else {
        var Extension = FileUploadPath.substring(
                FileUploadPath.lastIndexOf('.') + 1).toLowerCase();

//The file uploaded is an image

if (Extension == "gif" || Extension == "png" || Extension == "bmp"
                || Extension == "jpeg" || Extension == "jpg") {

//To Display
            if (fuData.files && fuData.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#blah').attr('src', e.target.result);
                }

                reader.readAsDataURL(fuData.files[0]);
            }

        } 

//The file upload is NOT an image
else {
            alert("Photo only allows file types of GIF, PNG, JPG, JPEG and BMP. ");

        }
    }
}


</script>
<%
		String msg = request.getParameter("reg_citizen");
		
	
		//List<Citi> courses = (List<Course>)session.getAttribute("courses");
		
	%>

	<center>
		<%
			if(msg!=null){
				if(msg.equals("success")){
		%>
			<b>Citizen Registered Successfully...!</b>
		<%			
				}else if(msg.equals("failed")){
		%>
					<b> Citizen Registration Failed...!</b>
		<%		
				}
				
			}
		%>
	</center>
	


 <center>
<h2><bold>REGISTRATION FORM FOR CITIZEN</bold></h2>
</center><br><br>
 <div id="login" class="container col-sm-6 col-sm-offset-3">
	<form name="form1" action="reg_citizen" method="POST" onsubmit="return checkForm(this);">		
 		<div class="form-group">
 		  <label class="control-label">Citizen Name:</label>                          
          <input class="form-control" type="text" name="CtName" required placeholder="Enter your Name">
          <span class="help-block" ></span>
      	</div>
      	<div class="form-group">
      		<label class="control-label">Email ID:</label>
      		<input class="form-control" id ="email" type="text" name="Cemail" onblur="validateEmail(this);" placeholder="Enter your Email" required>
      		<span class="help-block" ></span>
      	</div>
      	<div class="form-group">
 		  <label class="control-label">Password:(Enter atleast 1 numeric digit,1 uppercase and 1 lowercase)</label>                          
          <input class="form-control" type="password" name="password" placeholder="Enter your Password">
          <span class="help-block" ></span>
      	</div>
      	<div class="form-group">
      		<label class="control-label">Contact:</label>
      		<input class="form-control" name="Ccontact" placeholder="Enter your number">
      		<span class="help-block" ></span>
      	</div>
      	<div class="form-group">
      		<label class="control-label">Address:</label>
      		<select class="form-control" name="Caddress" onchange="this.form1.submit()">
     			<option>Select your Address</option>
	 			<option value="BANGALORE">BANGALORE</option>
	 			<option value="PUNE">PUNE </option>
	 			<option value="CHENNAI">CHENNAI</option>
	 			<option value="HYDERABAD">HYDERABAD</option>
	 		</select>
	 	</div>
    	<div class="form-group">
      		<label class="control-label">Please select Documents.</label>
      			<div class="checkbox">
  					<label><input type="checkbox" name = "Adhar Card" value = "Adhar Card"> Adhar Card</label>
				</div>
				<div class="checkbox">
  					<label><input type="checkbox" name = "Pan Card" value = "Pan Card"> Pan Card </label>
				</div>
				<div class="checkbox">
  					<label><input type="checkbox" name = "Voter Card" value = "Voter Card"> Voter ID Card</label>
				</div>
				<div class="checkbox">
  					<label><input type="checkbox" name = "Passport" value = "Passport"> Passport</label>
				</div>
      	</div>
      	<input type="file" name="dataFile" id="fileChooser" onchange="return ValidateFileUpload()" />
      	<input type="submit" value="Sign Up" id="checkBtn" onclick="return phonenumber(document.form1.Ccontact)">
 </form>
 </div>
</body>
</html>
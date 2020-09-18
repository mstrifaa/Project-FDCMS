<?php
include('includes/config.php');
error_reporting(0);
if(isset($_POST['submit']))
{
	$name=$_POST['name'];
	$email=$_POST['email'];
	$sid=$_POST['sid'];
	$password=md5($_POST['password']);
	$contactno=$_POST['contactNo'];
	$status=1;
	$query=mysqli_query($con,"insert into users(name,email,sid,password,contactNo,status) values('$name','$email','$sid',$password','$contactno','$status')");
	$msg="Signed in successfully. Now You can log in !";
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>FDCMS | Sign In </title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    	<script>
function userAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'email='+$("#email").val(),
type: "POST",
success:function(data){
$("#user-availability-status1").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>
  </head>

  <body>
	  <div style="margin-top: 20px;" id="login-page">
	  	<div class="container">
	<h3 align="center" style="color:#fff">Female Dormitory Complaint Management System</h3>
	<hr />
		      <form class="form-login" method="post">
		        <h2 class="form-login-heading">Sign in</h2>
		        <p style="padding-left: 1%; color: green">
		        	<?php if($msg){echo htmlentities($msg);}?>


		        </p>
		        <div class="login-wrap">
		         <input type="text" class="form-control" placeholder="Full Name" name="name" required="required" autofocus>
		            <br>
		            <input type="email" class="form-control" placeholder="Email ID" id="email" onBlur="userAvailability()" name="email" required="required">
		             <span id="user-availability-status1" style="font-size:12px;"></span>
		            <br>
		            <input type="number" class="form-control" placeholder="Student ID" id="sid" name="sid" required="required"><br>
		            <input type="password" class="form-control" placeholder="Password" required="required" name="password"><br >
		             <input type="text" class="form-control" maxlength="11" name="contactno" placeholder="Contact no" required="required" autofocus>
		            <br>
		            
		            <button class="btn btn-theme btn-block"  type="submit" name="submit" id="submit"><i class="fa fa-user"></i> Sign in</button>
		            <hr>
		            
		            <div class="registration">
		                Already have an account?<br/>
		                <a class="" href="index.php">
		                   Log in
		                </a>
		            </div>
		
		        </div>
		
		      
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/iut3.png", {speed: 100});
    </script>


  </body>
</html>

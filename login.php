<?php
session_start();
error_reporting(0);
include('includes/config.php');
// Code user Registration
if(isset($_POST['submit']))
{
$name=$_POST['fullname'];
$email=$_POST['emailid'];
$contactno=$_POST['contactno'];
$password=md5($_POST['password']);
$query=mysqli_query($con,"insert into users(name,email,contactno,password) values('$name','$email','$contactno','$password')");
if($query)
{
	echo "<script>alert('You are successfully register');</script>";
}
else{
echo "<script>alert('Not register something went worng');</script>";
}
}
// Code for User login
if(isset($_POST['login']))
{
   $email=$_POST['email'];
   $password=md5($_POST['password']);
$query=mysqli_query($con,"SELECT * FROM users WHERE email='$email' and password='$password'");
$num=mysqli_fetch_array($query);
if($num>0)
{
$extra="./index.php";
$_SESSION['login']=$_POST['email'];
$_SESSION['id']=$num['id'];
$_SESSION['username']=$num['name'];
$uip=$_SERVER['REMOTE_ADDR'];
$status=1;
$log=mysqli_query($con,"insert into userlog(userEmail,userip,status) values('".$_SESSION['login']."','$uip','$status')");
$host=$_SERVER['HTTP_HOST'];
$uri=rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
header("location:http://$host$uri/$extra");
exit();
}
else
{
$extra="login.php";
$email=$_POST['email'];
$uip=$_SERVER['REMOTE_ADDR'];
$status=0;
$log=mysqli_query($con,"insert into userlog(userEmail,userip,status) values('$email','$uip','$status')");
$host  = $_SERVER['HTTP_HOST'];
$uri  = rtrim(dirname($_SERVER['PHP_SELF']),'/\\');
header("location:http://$host$uri/$extra");
$_SESSION['errmsg']="Invalid email id or Password";
exit();
}
}


?>


<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>Vantage | Signi-in | Signup</title>

	    
	    
	    <!-- Customizable CSS -->
		
	    
		<link rel="stylesheet" href="./css/account.css">
		<link rel="stylesheet" href="./css/index.css">
		


		

		
		
<script type="text/javascript">
function valid()
{
 if(document.register.password.value!= document.register.confirmpassword.value)
{
alert("Password and Confirm Password Field do not match  !!");
document.register.confirmpassword.focus();
return false;
}
return true;
}
</script>
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

 <!-- Header -->
 <header id="home" class="header">
    <!-- Navigation -->
    <nav class="nav">
      <div class="navigation container">
        <div class="logo">
          <h1>Vantage</h1>
        </div>

        <div class="menu">
          <div class="top-nav">
            <div class="logo">
              <h1>Vantage</h1>
            </div>
            <div class="close">
              <i class="bx bx-x"></i>
            </div>
          </div>

          <ul class="nav-list">
          <li class="nav-item">
              <a href="./index.php" class="nav-link">Home</a>
            </li>
            <li class="nav-item">
              <a href="./mobile.php" class="nav-link">Mobile</a>
            </li>
            <li class="nav-item">
              <a href="./accessories.php" class="nav-link">Accessories</a>
            </li>
            <li class="nav-item">
              <a href="./tablet.php" class="nav-link">Tablet</a>
            </li>
            
            
			<?php if(strlen($_SESSION['login']))
    {   ?>
				<li class="nav-item"><a href="my-account.php" class="nav-link"><i class="far fa-user">Welcome -</i><?php echo htmlentities($_SESSION['username']);?></a></li>
				<?php } ?>

					<li class="nav-item"><a href="my-wishlist.php" class="nav-link"><i class="far fa-heart"></i>  favorites</a></li>
					<li class="nav-item"><a href="my-cart.php" class="nav-link"><i class="icon bx bx-shopping-bag"></i></a></li>
					<?php if(strlen($_SESSION['login'])==0)
    {   ?>
<li><a href="login.php" class="nav-link"><i class="icon fa fa-sign-in"></i>Login</a></li>
<?php }
else{ ?>
	
				<li><a href="logout.php" class="nav-link"><i class="icon fa fa-sign-out"></i>Logout</a></li>
				<?php } ?>	
				</ul>
          
        </div>

        <a href="cart.html" class="cart-icon">
          <i class="bx bx-shopping-bag"></i>
        </a>

        <div class="hamburger">
          <i class="bx bx-menu"></i>
        </div>
</DIV>



	

<div class="cont">
	<div class="form sign-in">
		
				<!-- Sign-in -->			
					
						<h4 class="sign">SIGN-IN</h4>
						
					<form class="register-form outer-top-xs" method="post">
						<span style="color:red;" >
							<?php
							echo htmlentities($_SESSION['errmsg']);
							?>
							<?php
							echo htmlentities($_SESSION['errmsg']="");
							?>
						</span>
							<div class="form-group">
								<label class="info-title" for="exampleInputEmail1">Email Address <span>*</span></label>
								<input type="email"  name="email" class="form-control unicase-form-control text-input" id="exampleInputEmail1" placeholder="Vantage" >
							</div>
							<div class="form-group">
								<label class="info-title" for="exampleInputPassword1">Password <span>*</span></label>
							<input type="password" name="password" placeholder="Vantage" class="form-control unicase-form-control text-input" id="exampleInputPassword1" >
							</div>
							<div class="radio outer-xs">
								<a href="forgot-password.php" class="forgot-password pull-right">Forgot your Password?</a>
							</div>
							<button type="submit" class="submit" name="login">Login</button>
					</form>	
					<div class="social-media">
        <ul>
          <li><img src="./Images/Slider social/facebook.png"></li>
          <li><img src="./Images/Slider social/instagram.png"></li>
          <li><img src="./Images/Slider social/linkedin.png"></li>
          <li><img src="./Images/Slider social/twitter.png"></li>
        </ul>
      </div>
    </div>				
	

<!-- Sign-in -->
<div class="sub-cont">
      <div class="img">
        	<div class="img-text m-up">
          		<h2>Welcome back</h2>
          		<p>Sign up and discover great amount of new opportunities!</p>
       		 </div>
			<div class="img-text m-in">
				<h2>New to here?</h2>
				<p>If you already has an account, just sign in. We've missed you!</p>
			</div>
			<div class="img-btn">
				<span class="m-up">Sign Up</span>
				<span class="m-in">Sign In</span>
			</div>
      </div>
	  

		<!-- create a new account -->

		<div class="form sign-up">
			<h4 class="checkout-subtitle">Create a New Account</h4>
				<form class="register-form outer-top-xs" role="form" method="post" name="register" onSubmit="return valid();">
					<div class="form-group">
						<label class="info-title" for="fullname">Full Name <span>*</span></label>
						<input type="text" class="form-control unicase-form-control text-input" id="fullname" name="fullname" required="required" placeholder="Vantage">
					</div>


					<div class="form-group">
						<label class="info-title" for="exampleInputEmail2">Email Address <span>*</span></label>
						<input type="email" class="form-control unicase-form-control text-input" id="email" onBlur="userAvailability()" name="emailid" required placeholder="Vantage" >
							<span id="user-availability-status1" style="font-size:12px;"></span>
					</div>

					<div class="form-group">
						<label class="info-title" for="contactno">Contact No. <span>*</span></label>
						<input type="text" class="form-control unicase-form-control text-input" id="contactno" name="contactno" maxlength="10" required placeholder="Vantage" >
					</div>

					<div class="form-group">
						<label class="info-title" for="password">Password. <span>*</span></label>
						<input type="password" class="form-control unicase-form-control text-input" id="password" name="password"  required placeholder="Vantage">
					</div>

					<div class="form-group">
						<label class="info-title" for="confirmpassword">Confirm Password. <span>*</span></label>
						<input type="password" class="form-control unicase-form-control text-input" id="confirmpassword" name="confirmpassword" required placeholder="Vantage" >
					</div>


					<button type="submit" name="submit" class="submit" id="submit">Sign Up</button>
				</form>

			
		</div>
	</div>
</header>	
	
	<script src="./JS/slider.js"></script>
</body>
</html>
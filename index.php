<?php
session_start();
error_reporting(0);
include('includes/config.php');
$cid=intval($_GET['cid']);
if(isset($_GET['action']) && $_GET['action']=="add"){
	$id=intval($_GET['id']);
	if(isset($_SESSION['cart'][$id])){
		$_SESSION['cart'][$id]['quantity']++;
	}else{
		$sql_p="SELECT * FROM products WHERE id={$id}";
		$query_p=mysqli_query($con,$sql_p);
		if(mysqli_num_rows($query_p)!=0){
			$row_p=mysqli_fetch_array($query_p);
			$_SESSION['cart'][$row_p['id']]=array("quantity" => 1, "price" => $row_p['productPrice']);
				echo "<script>alert('Product has been added to the cart')</script>";
		echo "<script type='text/javascript'> document.location ='my-cart.php'; </script>";
		}else{
			$message="Product ID is invalid";
		}
	}
	
}
// COde for Wishlist
if(isset($_GET['pid']) && $_GET['action']=="wishlist" ){
	if(strlen($_SESSION['login'])==0)
    {   
header('location:login.php');
}
else
{
mysqli_query($con,"insert into wishlist(userId,productId) values('".$_SESSION['id']."','".$_GET['pid']."')");
echo "<script>alert('Product aaded in wishlist');</script>";
header('location:my-wishlist.php');

}
}
?>






<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
  <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon">
  <!-- Box icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
  <link rel="stylesheet" href="./CSS/index.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
 
  
  <title>Vantage</title>
</head>
<body>
<!-- Header -->
<header id="home" class="header">
  
  <?php include('includes/main-header.php');?>

       <!-- Hero -->
        <div class="hero">
          <img src="./Images/Hero/222.jpg" alt="" class="hero-img" />
            <div class="preorder">
               <h1>VANTAGE<br></h1>
               <small>Deal With Best<br></small>      
               <a href="#" class="pro">pre-order </a> 
            </div>
        </div>
  </header>

   <!--------------- CAT---------------- -->
  <!-- features -->
  <section id = "features" class = "features">
    <div class = "container-fet">
      <div class = "features-wrapper">
        <!-- item -->
        <div class = "feature-item">
          <span class = "feature-icon">
            <i class = "fas fa-volume-up fa-fw"></i>
          </span>
          <h2 class = "feature-title">
            Industry-leading noise cancelation
          </h2>
          <p class = "text">
            Industry-leading noise cancellation technology means you hear every word, note, and tune with incredible clarity, no matter your environment. These noise canceling headphones feature additional microphones that assist in isolating sound for a reduction of even more high and mid frequency sounds.
          </p>
        </div>
        <!-- end of item -->
        <!-- item -->
        <div class = "feature-item">
          <span class = "feature-icon">
            <i class = "fas fa-headset fa-fw"></i>
          </span>
          <h2 class = "feature-title">
            Optimizing noise canceling
          </h2>
          <p class = "text">
            To maximize noise-canceling performance, the WH-1000XM4 headphones incorporate two technologies: Personal Noise-Canceling Optimizer, designed specifically for you, and Atmospheric Pressure Optimizing, designed specifically for air travel.
          </p>
        </div>
        <!-- end of item -->
        <!-- item -->
        <div class = "feature-item">
          <span class = "feature-icon">
            <i class = "fas fa-volume-down fa-fw"></i>
          </span>
          <h2 class = "feature-title">
            Ambient Sound Control
          </h2>
          <p class = "text">
            Adjust ambient sound with the airpod max | Headphones Connect app to cancel noise while still allowing essential sounds, like overhead announcements, through when you're listening on the move.
          </p>
        </div>
        <!-- end of item -->
        <!-- item -->
        <div class = "feature-item">
          <span class = "feature-icon">
            <i class = "fab fa-bluetooth-b fa-fw"></i>
          </span>
          <h2 class = "feature-title">
            Wireless freedom, premium sound
          </h2>
          <p class = "text">
            LDAC transmits approximately three times more data (at the maximum transfer rate of 990 kbps) than conventional BLUETOOTH® audio, allowing you to enjoy High-Resolution Audio content in exceptional quality, as close as possible to that of a dedicated wired connection.
          </p>
        </div>
        <!-- end of item -->
      </div>
    </div>
  </section>
  <!-- end of features -->

  <div class="cat">
    <!-- watch -->
        <div class="cat-watch">
            <img 
             data-aos="zoom-in"
             data-aos-duration="3000"
             data-aos-delay="900"
                  src="./Images/Hero/watch.jpg" alt="" class="iwatch" />
                     <div class="watch">
                        <img src="./Images/Hero/logo.jpg" alt="">
                         <h1>Accessories<br></h1>
                         <a href="accessories.php" class="buywatch">Buy </a>       
                     </div>
          </div>
  
    <!-- Phone -->
        <div class="cat-mobile">
              <img 
              data-aos="fade-right"
              data-aos-duration="3000"
              data-aos-delay="900"
                  src="./Images/Hero/pho1234.jpg" alt="" class="phone" />
                    <div class="fphone">
                        <img src="./Images/Hero/logo.jpg" alt="">  
                          <h1>Mobile phone<br></h1>
                          <a href="mobile.php" class="buyphone">Buy </a>  
                     </div>
           </div>
  
    <!-- IPad -->
          <div class="cat-tab">
                <img 
                data-aos="fade-left"
                data-aos-duration="3000"
                data-aos-delay="900"
                    src="./Images/Hero/ipad.png" alt="" class="ipad" />
                      <div class="fpad">
                         <img src="./Images/Hero/logo.jpg" alt="">
                            <h1>Tablet<br></h1>
                            <a href="tablet.php" class="buypad">Buy </a>  
                       </div>
           </div>

  </div>


  




 <!-- newsletter -->
 <section class = "newsletter center">
   <div class="connect">
  <div class = "container-letter">
    <div class = "newsletter-wrapper">
      <h2 class = "newsletter-title">
        Stay Connected
      </h2>
      <input type = "email" class = "form-control" placeholder="Your Email">
      <button type = "submit" class = "btn-trans">Subscribe</button>
    </div>
  </div>
   </div>
</section>
<!-- end of newsletter -->

  <!-- banner full width end -->
  <!-- Footer -->
<footer id="footer" class="section footer">
  <div class="container">
    <div class="footer-container">
      <div class="footer-center">
        <h3>EXTRAS</h3>
        <a href="#">Brands</a>
        <a href="#">Gift Certificates</a>
        <a href="#">Affiliate</a>
        <a href="#">Specials</a>
        <a href="#">Site Map</a>
      </div>
      <div class="footer-center">
        <h3>INFORMATION</h3>
        <a href="#">About Us</a>
        <a href="#">Privacy Policy</a>
        <a href="#">Terms & Conditions</a>
        <a href="#">Contact Us</a>
        <a href="#">Site Map</a>
      </div>
      <div class="footer-center">
        <h3>MY ACCOUNT</h3>
        <a href="#">My Account</a>
        <a href="#">Order History</a>
        <a href="#">Wish List</a>
        <a href="#">Newsletter</a>
        <a href="#">Returns</a>
      </div>
      <div class="footer-center">
        <h3>CONTACT US</h3>
        <div>
          <span>
            <i class="fas fa-map-marker-alt"></i>
          </span>
          42 Dream House, Dreammy street, 7131 Dreamville, USA
        </div>
        <div>
          <span>
            <i class="far fa-envelope"></i>
          </span>
          company@gmail.com
        </div>
        <div>
          <span>
            <i class="fas fa-phone"></i>
          </span>
          456-456-4512
        </div>
        <div>
          <span>
            <i class="far fa-paper-plane"></i>
          </span>
          Dream City, USA
        </div>
      </div>
    </div>
  </div>
  </div>
</footer>
<!-- End Footer -->





  <script>
    function changeBackground(){
      if(window.scrollY > window.innerHeight /2){
        document.body.classList.add('bg-color');
       }else{
         document.addEventListener('scroll', changeBackground);
       }
    }
  </script>
  




  <!-- GSAP -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
  <!-- Custom Script -->
  <script src="./JS/index.js"></script>

    
</body>
</html>
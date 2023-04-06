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
  
    <title>Mobile Phones</title>
</head>




</body>


<body>

<!-- Header -->
<header id="home" class="header">
  
  <?php include('includes/main-header.php');?>

   <!-- Hero -->
   <div class="hero-mobile">
                <img src="./Images/Hero/hero_endframe__e24jfrox7nu6_large.jpg" alt="" class="hero-img-tablet" />
                <div class="preorder">
                  <h1>VANTAGE<br></h1>
                    <small>Deal With Best<br></small>      
                     <a href="#" class="pro">pre-order </a> 
                </div>
        </div>


  </header>

  <body>
  
  <div class = "products">
        <div class = "container">
            <h1 class = "lg-title">Which Apple is right for you??</h1>
            <p class = "text-light">Designed with your heart in mind.</p>

  <?php
$ret=mysqli_query($con,"select * from products where category='4'");
$num=mysqli_num_rows($ret);
if($num>0)
{
	while ($row=mysqli_fetch_array($ret)) 
{?>							
	<div class="product">
    <div class="img-product">
    <a href="product-details.php?pid=<?php echo htmlentities($row['id']);?>"><img  src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage1']);?>" alt="product image" ></a>
    </div>

    <div class="product-details">
          <h3 class="value"><?php echo htmlentities($row['productCompany']);?></h3><br>
          <h3 class = "head"><?php echo htmlentities($row['productName']);?></h3><br> 
         <h3 class="des"><?php echo $row['productDescription'];?></h3>
         <div class = "product-btns">
         <li class="add-cart-button btn-group">
						
                        <?php if($row['productAvailability']=='In Stock'){?>
                               
                        												
                   
                    <a href="mobile.php?page=product&action=add&id=<?php echo $row['id']; ?>">
                    <button class="btn-cart" type="button">GET LOAN</button></a>
                        <?php } else {?>
                    <div class="action" style="color:red">Out of Stock</div>
            <?php } ?>
                                            
                </li>
               
                <li class="lnk wishlist">
                    <a class="btn-buy" href="mobile.php?pid=<?php echo htmlentities($row['id'])?>&&action=wishlist" title="Wishlist">
                    Whishlist
                    </a>
                </li>
                        </div>                    

        </div>
        

  </div>
   				
	  <?php } } else {?>
	
		<div class="col-sm-6 col-md-4 wow fadeInUp"> <h3>No Product Found</h3>
			
		
<?php } ?>

</div>
</div>
      

	
		
		
	
		
	
		
	
    <div class = "product-collection">
        <div class = "container">
            <div class = "product-collection-wrapper">
                <!-- product col left -->
                <div class = "product-col-left flex">
                    <div class = "product-col-content">
                        <h2 class = "sm-title">Apple Air pod max </h2>
                        <h2 class = "md-title">Magic runs in the family </h2>
                        <p class = "text-light">AirPods deliver an unparalleled listening experience with all your devices. Every model connects effortlessly and packs rich, high-quality sound into an innovative wireless design..</p>
                        <button type = "button" class = "btn-dark">Shop now</button>
                    </div>
                </div>

                <!-- product col right -->
                <div class = "product-col-right">
                    <div class = "product-col-r-top flex">
                        <div class = "product-col-content">
                            <h2 class = "sm-title">New Arrival </h2>
                            <h2 class = "md-title">Air pod max </h2>
                            <p class = "text-light">Introducing AirPods Max — a perfect balance of exhilarating high-fidelity audio and the effortless magic of AirPods. The ultimate personal listening experience is here..</p>
                            <button type = "button" class = "btn-dark">Shop now</button>
                        </div>
                    </div>

                    <div class = "product-col-r-bottom">
                        <!-- left -->
                        <div class = "product-col-r-br flex">
                            <div class = "product-col-content">
                                <h2 class = "sm-title">Apple Watch series 6 </h2>
                                <h2 class = "md-title">The future of health is on your wrist. </h2>
                                <p class = "text-light">Any case. Any band. Any style you want.</p>
                                <button type = "button" class = "btn-dark">Shop now</button>
                            </div>
                        </div>
                        <!-- right -->
                        <div class = "product-col-r-bl flex">
                            <div class = "product-col-content">
                                <h2 class = "sm-title">Apple </h2>
                                <h2 class = "md-title">iPad mini </h2>
                                <p class = "text-light">Compact. Portable.
                                    Pocketable.</p>
                                <button type = "button" class = "btn-dark">Shop now</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>


<?php include('includes/footer.php');?>


<script src="assets/js/jquery-1.11.1.min.js"></script>
	
	
	
	<script src="assets/js/owl.carousel.min.js"></script>
	
	<script src="assets/js/echo.min.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/scripts.js"></script>



  


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
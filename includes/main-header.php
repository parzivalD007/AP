<?php 
session_start();

?>
 
 
 
 
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
            <li class="nav-item">
              <a href="./search-result.php" class="nav-link"><i class="fas fa-search"></i></a>
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
      </div>
    </nav>

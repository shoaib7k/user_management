<?php session_start(); ?>
<html>

<head>
  <?php include "head.php"; ?>
</head>

<body>
  <?php include "header.php" ?>
<div class="content">
          <?php
        if($_SESSION['logged_in']==1){
          if ($_SESSION['user_type']=='A') {
            $user_type="Admin";
          }
          else{
            $user_type="User";
          }
echo '<div class="alert alert-success" role="alert">
  Your logged in as '.$user_type.' with login name '.$_SESSION['login_name'].'
</div>';
        }
        ?>
    
</div>


  <div class="container">
    <div class="card-deck mb-3 text-center">
      <div class="card mb-4 box-shadow">
        <div class="card-header">
      
        
        </div>
      </div>

    </div>


  </div>

  <?php include 'footer.php';?>
</body>

</html>
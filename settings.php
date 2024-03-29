<?php
session_start();
$lang_users_title="Users";
$lang_groups_title="Groups";
$lang_group_structure_title="Group Structure";
$lang_department_title="Department";
$lang_location_title="Location";


?>
<html>
   <body>
    <div class="body-container">
      <?php include 'left_menu.php'; ?>
          <div role="main" class="main-content">

          <div class="page-content container container-plus">
            <!-- page header and toolbox -->
            <div class="page-header pb-2">
            <nav class="breadcrumb">
                <a style="1px solid #000000; padding: 0 5px" href="home.php?app=default&lang=<?php echo detect_language(); ?>">Home</a>
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active">Admin</a>
            </nav>
            </div>
            <?php 
            if($_SESSION['user_type']=='U'){
                echo ' <div class="alert d-flex bgc-red-l3 brc-success-m4 border-0 p-0" role="alert">
                      <div class="bgc-red px-3 py-1 text-center radius-l-1">
                        <span class="fa-2x text-white">
                ⚠ <!-- &#9888; -->
              </span>
                      </div><span class="ml-3 align-self-center text-dark-tp3 text-110">
              You do not have permission to access this page!
            </span></div>';
            }
            else {
            ?>

    
      <div class="container">
       <div class="card" >
  <ul class="list-group list-group-flush">
    <a href="user_list.php?app=default&lang=<?php echo detect_language(); ?>"><li class="list-group-item"><?php echo $_user; ?></li></a>
    <a href="group_list.php?app=default&lang=<?php echo detect_language(); ?>"><li class="list-group-item"><?php echo $_groups; ?></li></a>
    <!-- <a href=""><li class="list-group-item"><?php echo $lang_group_structure_title; ?></li></a>
    <a href=""><li class="list-group-item"><?php echo $lang_department_title; ?></li></a>
    <a href=""><li class="list-group-item"><?php echo $lang_location_title; ?></li></a> -->
  </ul>
</div>
      </div>
      <?php
}
?>
   </div>

  </div>
 </div>

<?php include 'footer.php'; ?>
</body>
</html>
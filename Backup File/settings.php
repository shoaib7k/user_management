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
            <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="home.php">Home</a></li>
              <li class="breadcrumb-item active">Setting</li>
            </ol>
          </nav>
            </div>

    
      <div class="container">
       <div class="card" >
  <ul class="list-group list-group-flush">
    <a href="user_list.php"><li class="list-group-item"><?php echo $lang_users_title; ?></li></a>
    <a href="group_list.php"><li class="list-group-item"><?php echo $lang_groups_title; ?></li></a>
    <a href=""><li class="list-group-item"><?php echo $lang_group_structure_title; ?></li></a>
    <a href=""><li class="list-group-item"><?php echo $lang_department_title; ?></li></a>
    <a href=""><li class="list-group-item"><?php echo $lang_location_title; ?></li></a>
  </ul>
</div>
      </div>
   </div>

  </div>
 </div>

<?php include 'footer.php'; ?>
</body>
</html>
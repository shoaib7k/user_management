<?php
session_start();
include('paginator.class.php'); 
 ?>
<?php
include 'db_connect.php';
$lang_users_title = "Users";
$lang_groups_title = "Groups";
$lang_group_structure_title = "Group Structure";
$lang_department_title = "Department";
$lang_location_title = "Location";
?>
<?php
if ($_GET['act'] == 'useradd') {
  $first_name = $_POST['first_name'];
  $last_name = $_POST['last_name'];
  $login_name = $_POST['login_name'];
  $password = $_POST['password'];
  $user_type = $_POST['user_type'];
  $telephone1=$_POST['telephone1'];
  $telephone2=$_POST['telephone2'];
  $telephone3=$_POST['telephone3'];
  $email1=$_POST['email1'];
  $email2=$_POST['email2'];
  $email3=$_POST['email3'];
  $company=$_POST['company'];
  $add_to_contact = isset($_POST['add_to_contact']);
  if ($db_connection) {
    $sql = "insert into users (login_name,first_name,last_name,password,user_type,telephone1,telephone2,telephone3,email1,email2,email3,company) values ('" . $login_name . "','" . $first_name . "','" . $last_name . "','" . $password . "','" . $user_type . "','".$telephone1."','".$telephone2."','".$telephone3."','".$email1."','".$email2."','".$email3."','".$company."') RETURNING id";
    $db_result = pg_query($db_connection, $sql);
    if ($db_result) {
      $row = pg_fetch_row($db_result);
      $inserted_id = $row[0];
      pg_free_result($db_result);
      // header("location: group_list.php");
      foreach ($_POST['group_id'] as $gid) {
        $sql1 = "insert into user_groups (user_id,group_id) values ('" . $inserted_id . "','" . $gid . "')";
        $db_result1 = pg_query($db_connection, $sql1);
        if ($db_result1) {
          pg_free_result($db_result1);
          // header("location: group_list.php");
        }
      }
      if ($add_to_contact == 1) {
        $sql2 = "insert into kontakte (vorname,nachname,user_id,telefon1,telefon2,telefon3,email1,email2,email3,firma) values ('" . $first_name . "','" . $last_name . "','" . $inserted_id . "','".$telephone1."','".$telephone2."','".$telephone3."','".$email1."','".$email2."','".$email3."','".$company."')";
        $db_result2 = pg_query($db_connection, $sql2);
        if ($db_result2) {
          pg_free_result($db_result2);
          // header("location: group_list.php");
        }
      } else {
       /* $sql2 = "insert into kontakte (vorname,nachname,user_id) values ('" . $first_name . "','" . $last_name . "','" . $inserted_id . "')";
        $db_result2 = pg_query($db_connection, $sql2);
        if ($db_result2) {
          pg_free_result($db_result2);
          // header("location: group_list.php");
        }
        */
      }
      header("location: user_list.php");
    }
  }
}
if ($_GET['act'] == 'update_user') {
  $user_id=$_POST['id'];
  $first_name = $_POST['first_name'];
  $last_name = $_POST['last_name'];
  $login_name = $_POST['login_name'];
  $password = $_POST['password'];
  $user_type = $_POST['user_type'];
    $user_type = $_POST['user_type'];
  $telephone1=$_POST['telephone1'];
  $telephone2=$_POST['telephone2'];
  $telephone3=$_POST['telephone3'];
  $email1=$_POST['email1'];
  $email2=$_POST['email2'];
  $email3=$_POST['email3'];
  $company=$_POST['company'];
  $add_to_contact = isset($_POST['add_to_contact']);
  $show_to_contact = isset($_POST['show_to_contact']);
  if ($show_to_contact!=1) {
  $show_to_contact=0;
  }
  if ($db_connection) {
    if(empty($password)){
    $sqlu1 = "UPDATE users SET login_name='".$login_name."',first_name='".$first_name."',last_name='".$last_name."',user_type='".$user_type."',telephone1='".$telephone1."',telephone2='".$telephone2."',telephone3='".$telephone3."',email1='".$email1."',email2='".$email2."',email3='".$email3."',company='".$company."' where id='".$user_id."'";  
    }
    else{
    $sqlu1 = "UPDATE users SET login_name='".$login_name."',first_name='".$first_name."',last_name='".$last_name."',user_type='".$user_type."',password='".$password."',telephone1='".$telephone1."',telephone2='".$telephone2."',telephone3='".$telephone3."',email1='".$email1."',email2='".$email2."',email3='".$email3."',company='".$company."' where id='".$user_id."'";
  }
   $sql_contactu = "UPDATE kontakte SET vorname='".$first_name."',nachname='".$last_name."',telefon1='".$telephone1."',telefon2='".$telephone2."',telefon3='".$telephone3."',email1='".$email1."',email2='".$email2."',email3='".$email3."',firma='".$company."',showing='".$show_to_contact."' where user_id='".$user_id."'";
   $db_resultcontactu = pg_query($db_connection, $sql_contactu);
   if($add_to_contact==1){
      $sql_addtocontact = "insert into kontakte (vorname,nachname,user_id,telefon1,telefon2,telefon3,email1,email2,email3,firma) values ('" . $first_name . "','" . $last_name . "','" . $user_id . "','".$telephone1."','".$telephone2."','".$telephone3."','".$email1."','".$email2."','".$email3."','".$company."')";
        $db_result_addcon = pg_query($db_connection, $sql_addtocontact);
        if ($db_result_addcon) {
          pg_free_result($db_result_addcon);
          // header("location: group_list.php");
        }
   }
    $db_resultu1 = pg_query($db_connection, $sqlu1);
    if ($db_resultu1) {
      $row = pg_fetch_row($db_resultu1);
      pg_free_result($db_resultu1);
      $group_id_array=array();
      foreach ($_POST['group_id'] as $gid) {
         $db_sqlu2 = "select * from user_groups where user_id='".$user_id."' and group_id='".$gid."'";
          $db_resultu2 = pg_query($db_connection, $db_sqlu2);
                        if (!$db_resultu2) {
                          echo 'Es ist ein Datenbankfehler aufgetreten.';
                        } else {
                          if (pg_num_rows($db_resultu2) < 1) {
           
               $sqlin1 = "insert into user_groups (user_id,group_id) values ('" . $user_id . "','" . $gid . "')";
                      $db_result1 = pg_query($db_connection, $sqlin1);
        if ($db_result1) {
          pg_free_result($db_result1);
        }
                          }
                        }
          array_push($group_id_array, $gid);
      }

         $db_sql = "select id,group_id from user_groups where user_id='".$user_id."'";
          $db_result = pg_query($db_connection, $db_sql);

                        if (!$db_result) {

                          echo 'Es ist ein Datenbankfehler aufgetreten.';
                        } else {

                          if (pg_num_rows($db_result) > 0) {

                            for ($i = 0; $i < pg_num_rows($db_result); $i++) {
                              $db_record = pg_fetch_array($db_result, $i, PGSQL_BOTH);
                              $user_group_id=$db_record['id'];
                              $group_id = $db_record['group_id'];
                              if(!in_array($group_id, $group_id_array)){ 
           $db_sqld = "delete from user_groups where id='".$user_group_id."'";
          $db_resultd = pg_query($db_connection, $db_sqld);                              
                              }
                             
                             
                            }
                          }
                        }
      header("location: user_list.php");
    }
  }
}
if($_GET['act']=='delete'){
  $id=$_GET['id'];
  $sqld1="DELETE from users where id=".$id."";
  $db_resultd1=pg_query($db_connection,$sqld1);
  if($db_resultd1){
    pg_free_result($db_resultd1);
  $sqld2="DELETE from user_groups where user_id=".$id."";
  $db_resultd2=pg_query($db_connection,$sqld2);
 if($db_resultd2){
    pg_free_result($db_resultd2);
    //header("location: user_list.php");
  }
  $sqld3="DELETE from kontakte where user_id=".$id."";
  $db_resultd3=pg_query($db_connection,$sqld3);
 if($db_resultd3){
    pg_free_result($db_resultd3);
    header("location: user_list.php");
  }
  }
}
?>
      <?php include 'left_menu.php'; ?>
      
          <div role="main" class="main-content">
 
          <div class="page-content container container-plus">
            <!-- page header and toolbox -->
            <div class="page-header pb-2">
            <nav class="breadcrumb">
                <a style="1px solid #000000; padding: 0 5px" href="home.php">Home</a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="settings.php">Admin</a>
               
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active">User List</a>
            </nav>
            </div>
            <?php 
            if($_SESSION['user_type']=='U'){
                echo '<div class="alert d-flex bgc-red-l3 brc-success-m4 border-0 p-0" role="alert">
                      <div class="bgc-red px-3 py-1 text-center radius-l-1">
                        <span class="fa-2x text-white">
                ⚠ <!-- &#9888; -->
              </span>
                      </div><span class="ml-3 align-self-center text-dark-tp3 text-110">
              You do not have permission to access this page!
            </span></div>';
            }
            else
            {
            ?>

              <div class="text-center mb-4">
                            <a href="#aside-compose" data-toggle="modal" data-target="#userModal" class="btn btn-blue px-45 py-2 text-105 radius-2">
                              <i class="fa fa-pencil-alt mr-1"></i>
                            Add New User</a>
                          </div>

          <!-- Modal -->
          <div class="modal fade modal-fs" id="userModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">New User</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form method="POST" action="user_list.php?act=useradd&lang=<?php echo detect_language(); ?>">
                    <div class="form-group row">
                   
                    <div class="col">
                      <div class="form-group">
                      <label for="formGroupExampleInput">First Name</label>
                      <input type="text" name="first_name" class="form-control" id="first_name" placeholder="First Name">
                    </div>
                  </div>
                  <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput2">Last Name</label>
                      <input type="text" name="last_name" class="form-control" id="last_name" placeholder="Last Name">
                    </div>
                    </div>
                  </div>
          <div class="form-group row">
                    <div class="col">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Login Name</label>
                      <input type="text" name="login_name" class="form-control" id="login_name" aria-describedby="emailHelp" placeholder="Login Name">
                    </div>
                  </div>
                  <div class="col">
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                    </div>
                  </div>
                </div>
                <div class="form-group row">
                   
                    <div class="col">
                      <div class="form-group">
                      <label for="formGroupExampleInput">Email-1</label>
                      <input type="text" name="email1" class="form-control" id="email1" placeholder="Email-1">
                    </div>
                  </div>
                  <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">Email-2</label>
                      <input type="text" name="email2" class="form-control" id="email2" placeholder="Email-2">
                    </div>
                    </div>
                    <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">Email-3</label>
                      <input type="text" name="email3" class="form-control" id="email3" placeholder="Email-3">
                    </div>
                    </div>
                  </div>
                   <div class="form-group row">
                   
                    <div class="col">
                      <div class="form-group">
                      <label for="formGroupExampleInput">Telephone-1</label>
                      <input type="text" name="telephone1" class="form-control" id="telephone1" placeholder="Telephone-1">
                    </div>
                  </div>
                  <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">Telephone-2</label>
                      <input type="text" name="telephone2" class="form-control" id="telephone2" placeholder="Telephone-2">
                    </div>
                    </div>
                    <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">Telephone-3</label>
                      <input type="text" name="telephone3" class="form-control" id="telephone3" placeholder="Telephone-3">
                    </div>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col">
                    <div class="form-group">
                      <label for="user_type">User Type</label>
                      <select class="form-control" id="user_type" name="user_type">
                        <option value="U">User</option>
                        <option value="A">Admin</option>
                      </select>
                    </div>
                    </div>
                    <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">Company</label>
                      <input type="text" name="company" class="form-control" id="company" placeholder="Company">
                    </div>
                    </div>
                    <div class="col">
                       <div class="form-group">
                      <label for="group_add">Select Groups</label>
                  <select id="example-getting-started" class="form-control selectpicker" name="group_id[]" multiple="multiple" data-show-subtext="true" data-live-search="true">

                        <?php
                        $db_sql = "select id, group_name from groups";

                        $db_result = pg_query($db_connection, $db_sql);

                        if (!$db_result) {

                          echo 'Es ist ein Datenbankfehler aufgetreten.';
                        } else {

                          if (pg_num_rows($db_result) > 0) {

                            for ($i = 0; $i < pg_num_rows($db_result); $i++) {

                              $db_record = pg_fetch_array($db_result, $i, PGSQL_BOTH);

                              $group_id = $db_record['id'];
                              $group_name = $db_record['group_name'];
                              echo '<option data-tokens="' . $group_name . '" value="' . $group_id . '">' . $group_name . '</option>';
                            }
                          }
                        }
                        ?>

                      </select>

                    </div>
                    </div>
                    </div>      
                   

                    <div class="form-group">
                      <div class="card-body">
                      <input type="checkbox" name="add_to_contact" class="form-check-input" id="exampleCheck1" value="1">
                      <label class="form-check-label" for="exampleCheck1">I want to add this user to contact information</label>
                    </div>
                    </div>

                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <input type="submit" class="btn btn-primary" value="Add">
                    </div>
                  </form>
                </div>

              </div>
            </div>
          </div>
       

      
      <div class="container">
        <h1><a href="">User List</a></h1>
           
        <hr>
        <?php
        $pages = new Paginator;
        $pages->default_ipp = 15;
        $sql_forms = pg_query("SELECT * FROM users");
        $pages->items_total = pg_num_rows($sql_forms);
        $pages->mid_range = 9;
        $pages->paginate();
        //echo "SELECT * FROM groups ORDER BY id ASC '".$pages->limit."'";
        //echo $pages->limit;
        $result = pg_query("SELECT * FROM users ORDER BY id ASC " . $pages->limit . "");
        ?>
        <div class="clearfix"></div>

        <div class="row marginTop">
          <div class="col-sm-12 paddingLeft pagerfwt">
            <?php if ($pages->items_total > 0) { ?>
              <?php echo $pages->display_pages(); ?>
              <?php echo $pages->display_items_per_page(); ?>
              <?php echo $pages->display_jump_menu(); ?>
            <?php } ?>
          </div>
          <div class="clearfix"></div>
        </div>

        <div class="clearfix"></div>

        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>Sr#</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Login Name</th>
              <th>User Type</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php
            if ($pages->items_total > 0) {
              $n  =   1;
              while ($val  =   pg_fetch_array($result)) {
                $showing=0;
                $userid=$val['id'];
                $q1 = pg_query("SELECT showing FROM kontakte where user_id='".$userid."'");
                $number_row=pg_num_rows($q1);
                $row1=pg_fetch_assoc($q1);
                $showing=$row1['showing'];

            ?>
                <tr>
                  <td><?php echo $n++; ?></td>
                  <td><?php echo ($val['first_name']); ?></td>
                  <td><?php echo ($val['last_name']); ?></td>
                  <td><?php echo $val['login_name']; ?></td>
                  <td><?php echo $val['user_type']; ?></td>
                  <td> 
    <a onClick="return confirm('Are you sure you want to delete user <?php echo $val['login_name'];?>')" href="user_list.php?act=delete&id=<?php echo $val['id']; ?>" class="btn btn-primary a-btn-slide-text" type="button">
       <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        <span><strong>Delete</strong></span>            
    </a>
    <a href="#editUser<?php echo $val['id'];?>" class="btn btn-primary a-btn-slide-text" data-id="<?php echo $val['id'];?>" data-toggle="modal">
        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        <span><strong>Edit</strong></span>            
    </a>
            <div class="modal fade modal-fs" id="editUser<?php echo $val['id']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                   <form method="POST" action="user_list.php?act=update_user&lang=<?php echo detect_language(); ?>">
                    <input type="hidden" name="id" value="<?php echo $val['id']; ?>">
                    <div class="form-group row">
                      <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">First Name</label>
                      <input type="text" name="first_name" class="form-control" id="first_name" placeholder="First Name" value="<?php echo $val['first_name']; ?>">
                    </div>
                  </div>
                  <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput2">Last Name</label>
                      <input type="text" name="last_name" class="form-control" id="last_name" placeholder="Last Name" value="<?php echo $val['last_name']; ?>">
                    </div>
                  </div>
                </div>
                  <div class="form-group row">
                    <div class="col">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Login Name</label>
                      <input type="text" name="login_name" class="form-control" id="login_name"  value="<?php echo $val['login_name']; ?>" aria-describedby="emailHelp" placeholder="Login Name">
                    </div>
                  </div>
                  <div class="col">
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                    </div>
                  </div>
                </div>
                <div class="form-group row">
                   
                    <div class="col">
                      <div class="form-group">
                      <label for="formGroupExampleInput">Email-1</label>
                      <input type="text" name="email1" class="form-control" id="email1" placeholder="Email-1" value="<?php echo $val['email1']; ?>">
                    </div>
                  </div>
                  <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">Email-2</label>
                      <input type="text" name="email2" class="form-control" id="email2" value="<?php echo $val['email2']; ?>" placeholder="Email-2">
                    </div>
                    </div>
                    <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">Email-3</label>
                      <input type="text" name="email3" class="form-control" id="email3" value="<?php echo $val['email3']; ?>" placeholder="Email-3">
                    </div>
                    </div>
                  </div>
                    <div class="form-group row">
                   
                    <div class="col">
                      <div class="form-group">
                      <label for="formGroupExampleInput">Telephone-1</label>
                      <input type="text" name="telephone1" class="form-control" id="telephone1" value="<?php echo $val['telephone1']; ?>" placeholder="Telephone-1">
                    </div>
                  </div>
                  <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">Telephone-2</label>
                      <input type="text" name="telephone2" class="form-control" id="telephone2" value="<?php echo $val['telephone2']; ?>" placeholder="Telephone-2">
                    </div>
                    </div>
                    <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">Telephone-3</label>
                      <input type="text" name="telephone3" class="form-control" id="telephone3" value="<?php echo $val['telephone3']; ?>" placeholder="Telephone-3">
                    </div>
                    </div>
                  </div>
                                    <div class="form-group row">
                    <div class="col">
                    <div class="form-group">
                      <label for="user_type">User Type</label>
                      <select class="form-control" id="user_type" name="user_type">
                    <?php 
                if($val['user_type']=='U') { echo '<option value="U">User</option>'; }
                else { echo '<option value="A">Admin</option>';}
                      ?>
                        <option value="U">User</option>
                        <option value="A">Admin</option>
                      </select>
                    </div>
                  </div>
                   <div class="col">
                    <div class="form-group">
                      <label for="formGroupExampleInput">Company</label>
                      <input type="text" name="company" class="form-control" id="company" placeholder="Company" value="<?php echo $val['company']; ?>">
                    </div>
                    </div>
                    <div class="col">
                      <div class="form-group">
                      <label for="group_add">Select Groups</label>
                      <select id="example-getting-started" class="form-control selectpicker" name="group_id[]" multiple="multiple" data-show-subtext="true" data-live-search="true">

                        <?php
                        $db_sql = "select id, group_name from groups";

                        $db_result = pg_query($db_connection, $db_sql);

                        if (!$db_result) {

                          echo 'Es ist ein Datenbankfehler aufgetreten.';
                        } else {

                          if (pg_num_rows($db_result) > 0) {

                            for ($i = 0; $i < pg_num_rows($db_result); $i++) {

                              $db_record = pg_fetch_array($db_result, $i, PGSQL_BOTH);

                              $group_id = $db_record['id'];
                              $group_name = $db_record['group_name'];
    echo '<option data-tokens="' . $group_name . '" value="' . $group_id . '"';
     $db_sql3 = "select id, group_id from user_groups where user_id='".$val['id']."' and group_id='".$group_id."'";

                        $db_result3 = pg_query($db_connection, $db_sql3);

                        if (!$db_result3) {

                          echo 'Es ist ein Datenbankfehler aufgetreten.';
                        } else {
                          if (pg_num_rows($db_result3) > 0) {
                          echo "selected";
                          }
                        }

    
    echo '>' . $group_name . '</option>';
                            }
                          }
                        }
                        ?>

                      </select>

                    </div>
                    </div>
                    </div>    
                    <?php if($number_row==1){ ?>
                  <div class="form-group">
                      <div class="card-body">
                      <input type="checkbox" name="show_to_contact" class="form-check-input" id="exampleCheck1" value="<?php echo $showing; ?>" <?php if($showing==1) { echo "checked"; } ?> />
                      <label class="form-check-label" for="exampleCheck1"><?php if($showing==0) { echo "This user is in contact list but not showing. Want to show in contact list ? If yes then checked else unchecked."; } else{
                        echo "This user is in contact list. Want to show in contact list ? If not then unchecked else checked.";
                      }
                        ?></label>
                    </div>
                    </div>
                  <?php } ?>
                    <?php if($number_row==0){ ?>
<div class="form-group">
                      <div class="card-body">
                      <input type="checkbox" name="add_to_contact" class="form-check-input" id="exampleCheck1" value="1" />
                      <label class="form-check-label" for="exampleCheck1">This user is not in contact list. Want to add it in contact list ? If not then unchecked else checked.</label>
                    </div>
                    </div>
                  <?php } ?>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <input type="submit" class="btn btn-primary" value="Add">
                    </div>
                  </form>
              </div>
            </div>
          </div>
        </div>
  </td>
                </tr>
              <?php
              }
            } else { ?>
              <tr>
                <td colspan="6" align="center"><strong>No Record(s) Found!</strong></td>
              </tr>
            <?php } ?>
          </tbody>
        </table>

        <div class="clearfix"></div>

        <div class="row marginTop">
          <div class="col-sm-12 paddingLeft pagerfwt">
            <?php if ($pages->items_total > 0) { ?>
              <?php echo $pages->display_pages(); ?>
              <?php echo $pages->display_items_per_page(); ?>
              <?php echo $pages->display_jump_menu(); ?>
            <?php } ?>
          </div>
          <div class="clearfix"></div>
        </div>

        <div class="clearfix"></div>
      
      </div>
      <!--/.container-->
<?php
}
?>

    </div>

  </div>
 </div>
<script type="text/javascript">

  $(document).ready(function() {
    $('#example-getting-started').multiselect();
  });
</script>
<?php include 'footer.php'; ?>



</body>
</html>
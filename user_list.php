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
  $add_to_contact = isset($_POST['add_to_contact']);
  if ($db_connection) {
    $sql = "insert into users (login_name,first_name,last_name,password,user_type) values ('" . $login_name . "','" . $first_name . "','" . $last_name . "','" . $password . "','" . $user_type . "') RETURNING id";
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
        $sql2 = "insert into kontakte (vorname,nachname,user_id) values ('" . $first_name . "','" . $last_name . "','" . $inserted_id . "')";
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
  //$add_to_contact = isset($_POST['add_to_contact']);
  if ($db_connection) {
    if(empty($password)){
    $sqlu1 = "UPDATE users SET login_name='".$login_name."',first_name='".$first_name."',last_name='".$last_name."',user_type='".$user_type."' where id='".$user_id."'";  
    }
    else{
    $sqlu1 = "UPDATE users SET login_name='".$login_name."',first_name='".$first_name."',last_name='".$last_name."',user_type='".$user_type."',password='".$password."' where id='".$user_id."'";
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
<html>

<head>
  <?php include "head.php" ;?>

  <style type="text/css">
    .multiselect-container {
      position: absolute;
      list-style-type: none;
      margin: 0;
      padding: 0
    }

    .multiselect-container .input-group {
      margin: 5px
    }

    .multiselect-container>li {
      padding: 0
    }

    .multiselect-container>li>a.multiselect-all label {
      font-weight: 700
    }

    .multiselect-container>li.multiselect-group label {
      margin: 0;
      padding: 3px 20px 3px 20px;
      height: 100%;
      font-weight: 700
    }

    .multiselect-container>li.multiselect-group-clickable label {
      cursor: pointer
    }

    .multiselect-container>li>a {
      padding: 0
    }

    .multiselect-container>li>a>label {
      margin: 0;
      height: 100%;
      cursor: pointer;
      font-weight: 400;
      padding: 3px 20px 3px 40px
    }

    .multiselect-container>li>a>label.radio,
    .multiselect-container>li>a>label.checkbox {
      margin: 0
    }

    .multiselect-container>li>a>label>input[type=checkbox] {
      margin-bottom: 5px
    }

    .btn-group>.btn-group:nth-child(2)>.multiselect.btn {
      border-top-left-radius: 4px;
      border-bottom-left-radius: 4px
    }

    .form-inline .multiselect-container label.checkbox,
    .form-inline .multiselect-container label.radio {
      padding: 3px 20px 3px 40px
    }

    .form-inline .multiselect-container li a label.checkbox input[type=checkbox],
    .form-inline .multiselect-container li a label.radio input[type=radio] {
      margin-left: -20px;
      margin-right: 0
    }

    .multiselect-group input {
      display: none;
    }

    li.multiselect-group a {
      padding-left: 20px !important;
    }
  </style>
  <script type="text/javascript">

  </script>
</head>

<body style="position: relative;">
  <?php include "header.php"; ?>


  <div class="container">
    <div class="card-deck mb-3 text-center">
      <div class="card mb-s box-shadow">
        <div class="card-header">
          <!-- Button trigger modal -->
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#userModal">
            Add New User
          </button>

          <!-- Modal -->
          <div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">New User</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form method="POST" action="user_list.php?act=useradd">
                    <div class="form-group">
                      <label for="formGroupExampleInput">First Name</label>
                      <input type="text" name="first_name" class="form-control" id="first_name" placeholder="First Name">
                    </div>
                    <div class="form-group">
                      <label for="formGroupExampleInput2">Last Name</label>
                      <input type="text" name="last_name" class="form-control" id="last_name" placeholder="Last Name">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Login Name</label>
                      <input type="text" name="login_name" class="form-control" id="login_name" aria-describedby="emailHelp" placeholder="Login Name">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                      <label for="user_type">User Type</label>
                      <select class="form-control" id="user_type" name="user_type">
                        <option value="U">User</option>
                        <option value="A">Admin</option>
                      </select>
                    </div>
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

                    <!-- <div class="form-group row">
              <label for="" class="col-sm-2 form-control-label">Group</label>
              <div class="col-sm-10">
                <select class="form-control selectpicker" id="select-country" data-live-search="true" multiple="multiple">
                <option data-tokens="china">China</option>
  <option data-tokens="malayasia">Malayasia</option>
  <option data-tokens="singapore">Singapore</option>
                </select>

              </div>
      </div> -->
                    <div class="form-group">
                      <input type="checkbox" name="add_to_contact" class="form-check-input" id="exampleCheck1" value="1">
                      <label class="form-check-label" for="exampleCheck1">I want to add this user to contact information</label>
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
            <div class="modal fade" id="editUser<?php echo $val['id']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                   <form method="POST" action="user_list.php?act=update_user">
                    <input type="hidden" name="id" value="<?php echo $val['id']; ?>">
                    <div class="form-group">
                      <label for="formGroupExampleInput">First Name</label>
                      <input type="text" name="first_name" class="form-control" id="first_name" placeholder="First Name" value="<?php echo $val['first_name']; ?>">
                    </div>
                    <div class="form-group">
                      <label for="formGroupExampleInput2">Last Name</label>
                      <input type="text" name="last_name" class="form-control" id="last_name" placeholder="Last Name" value="<?php echo $val['last_name']; ?>">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Login Name</label>
                      <input type="text" name="login_name" class="form-control" id="login_name"  value="<?php echo $val['login_name']; ?>" aria-describedby="emailHelp" placeholder="Login Name">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                    </div>
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
                  <!--  <div class="form-group">
                      <input type="checkbox" name="add_to_contact" class="form-check-input" id="exampleCheck1" value="1">
                      <label class="form-check-label" for="exampleCheck1">I want to add this user to contact information</label>
                    </div>
                  -->
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
        <footer style="
   bottom:0;
   width:100%;
   height:40px;
   background:#1D7852;
   color: #F8F8F8">
    <p> @Radeburger Fensterbau GmbH</p>
</footer>
      </div>
      <!--/.container-->


    </div>

  </div>
  <?php include 'footer.php';?>
</body>
<script type="text/javascript">
  $(document).ready(function() {
    $('#example-getting-started').multiselect();
  });
</script>

</html>
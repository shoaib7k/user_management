<?php 
session_start();
include('paginator.class.php'); 
 ?>
<?php
include 'db_connect.php';
$lang_first_name = "First Name";
$lang_last_name = "Last Name";
$lang_login_name = "Login Name";
$lang_password = "Password";
$lang_type = "Type";
$lang_group = "Group";
$lang_group_name = "Group Name";

?>
<?php
// if ($_GET['act'] == 'add_group') {
//   $group_name = $_POST['group_name'];
//   if (!empty($group_name)) {
//     if ($db_connection) {
//       $sql = "insert into groups (group_name) values ('" . $group_name . "')";
//       $db_result = pg_query($db_connection, $sql);
//       if ($db_result) {
//         pg_free_result($db_result);
//         header("location: group_list.php");
//       }
//     }
//   }
// }
// if ($_GET['act'] == 'update_group') {
//   $group_name = $_POST['group_name'];
//   $group_id = $_POST['id'];
//   if (!empty($group_name)) {
//     if ($db_connection) {
//       $sql = "update groups SET group_name='".$group_name."' WHERE id='".$group_id."'";
//       $db_result = pg_query($db_connection, $sql);
//       if ($db_result) {
//         pg_free_result($db_result);
//         header("location: group_list.php");
//       }
//     }
//   }
// }
// if($_GET['act']=='delete'){
//   $id=$_GET['id'];
//   $sql2="DELETE from groups where id=".$id."";
//   $db_result2=pg_query($db_connection,$sql2);
//   if($db_result2){
//     pg_free_result($db_result2);
//     header("location: group_list.php");
//   }
// }
?>

      <?php include 'left_menu.php'; ?>
          <div role="main" class="main-content">

          <div class="page-content container container-plus">
            <!-- page header and toolbox -->
            <div class="page-header pb-2">
            <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="home.php">Home</a></li>
              <li class="breadcrumb-item active">Contact List</li>
            </ol>
          </nav>
            </div>
  
    <h1><a href="">Contact List</a></h1>
      <hr>
    
    <?php
   /* if(isset($_REQUEST['tb1'])) {
      $condition    = "";
      if(isset($_GET['tb1']) and $_GET['tb1']!="")
      {
        $condition    .=  " AND continentName='".$_GET['tb1']."'";
      }
     */ 
      //Main query
      //if(isset($_REQUEST['tb1'])){
      $pages = new Paginator;
      $pages->default_ipp = 15;
      $sql_forms = pg_query("SELECT * FROM kontakte");
      $pages->items_total = pg_num_rows($sql_forms);
      $pages->mid_range = 9;
      $pages->paginate(); 
      //echo "SELECT * FROM groups ORDER BY id ASC '".$pages->limit."'";
      //echo $pages->limit;
      $result = pg_query("SELECT * FROM kontakte where showing=1 ORDER BY id ASC ".$pages->limit."");
   // }
    ?>
    <div class="clearfix"></div>
    
    <div class="row marginTop">
      <div class="col-sm-12 paddingLeft pagerfwt">
        <?php if($pages->items_total > 0) { ?>
          <?php echo $pages->display_pages();?>
          <?php echo $pages->display_items_per_page();?>
          <?php echo $pages->display_jump_menu(); ?>
        <?php }?>
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
          <th> Telephone 1 </th>
          <th> Email 1 </th>
          <th> Telephone 2 </th>
          <th> Email 2 </th>
          <th> Telephone 3 </th>
          <th> Email 3 </th>
          <!-- <th>Action</th> -->

        </tr>
      </thead>
      <tbody>
        <?php 
        if($pages->items_total>0){
          $n  =   1;
          while($val  =   pg_fetch_array($result)){ 
        ?>
        <tr>
          <td><?php echo $n++; ?></td>
          <td><?php echo $val['vorname']; ?></td>
          <td><?php echo $val['nachname']; ?></td>
          <td><?php echo $val['telefon1']; ?></td>
          <td> <?php echo $val['email1']; ?></td>
          <td><?php echo $val['telefon2']; ?></td>
          <td> <?php echo $val['email2']; ?></td>
          <td><?php echo $val['telefon3']; ?></td>
          <td> <?php echo $val['email3']; ?></td>
   <!-- <a onClick="return confirm('Are you sure you want to delete group <?php echo $val['group_name'];?>')" href="group_list.php?act=delete&id=<?php echo $val['id']; ?>" class="btn btn-primary a-btn-slide-text" type="button">
       <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        <span><strong>Delete</strong></span>            
    </a>
    <a href="#editGroup<?php echo $val['id'];?>" class="btn btn-primary a-btn-slide-text" data-id="<?php echo $val['id'];?>" data-toggle="modal">
        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        <span><strong>Edit</strong></span>            
    </a>
            <div class="modal fade" id="editGroup<?php echo $val['id']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Edit Group</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form method="POST" action="group_list.php?act=update_group">
                   <input type="hidden" name="id"  class="form-control" value="<?php echo $val['id']; ?>" >
                    <div class="form-group row">
                      <label for="groupName" class="col-sm-4 col-form-label"><?php echo $lang_group_name; ?></label>
                      <div class="col-sm-8">
                        <input type="text" name="group_name" id="group_name" class="form-control" value="<?php echo $val['group_name']; ?>">
                      </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <input type="submit" class="btn btn-primary" value="Update">
                </div>
                </form>
              </div>
            </div>
          </div> -->
        </div>

  </td>
        </tr>
        <?php 
          }
        }else{?>
        <tr>
          <td colspan="6" align="center"><strong>No Record(s) Found!</strong></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
    
    <div class="clearfix"></div>
    
    <div class="row marginTop">
      <div class="col-sm-12 paddingLeft pagerfwt">
        <?php if($pages->items_total > 0) { ?>
          <?php echo $pages->display_pages();?>
          <?php echo $pages->display_items_per_page();?>
          <?php echo $pages->display_jump_menu(); ?>
        <?php }?>
      </div>
      <div class="clearfix"></div>
    </div>

    <div class="clearfix"></div>
   
     <!--/.container-->
   
  
    </div>

  </div>
 </div>

<?php include 'footer.php'; ?>
</body>

</html>
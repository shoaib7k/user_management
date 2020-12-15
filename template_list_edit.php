<?php
session_start();
include('paginator.class.php');
?>

<?php
include 'db_connect.php';
if ($_GET['act'] == 'edit') {
  if (isset( $_POST['forms_theme_id'] ))  { $forms_theme_id = trim($_POST['forms_theme_id']); } else { $forms_theme_id = ""; }
    if (isset( $_POST['forms_theme_old'] )) { $forms_theme_old = trim($_POST['forms_theme_old']); } else { $forms_theme_old = ""; }
    if (isset( $_POST['forms_theme_new'] )) { $forms_theme_new = trim($_POST['forms_theme_new']); } else { $forms_theme_new = ""; }
if (($forms_theme_old != $forms_theme_new) && ($forms_theme_old != "")) {
        
        $sql = "update forms set theme = '".$forms_theme_new."' where theme = '".$forms_theme_old."'";        
        
    } else {
        
        $sql = "insert into forms (id, theme, timestamp) values ((select max(id) from forms) + 1, '".$forms_theme_new."', localtimestamp)"; 
        
    }
    
    if ($db_connection) {
        
        $db_result = pg_query($db_connection, $sql);
        
        if ($db_result) {
            
            pg_free_result($db_result);
             header("location: template_list.php");
        }      
        
        pg_close($db_connection);
        
    }
}
?>
<?php

global $homebase_path;

$forms_id = "";
$forms_theme = "";
$forms_theme_iconpath = "";
$forms_active_theme_id=$_GET['forms_id'];    
if ($forms_active_theme_id != "") {
    if ($db_connection) {
        
        $db_result = pg_query($db_connection, "select id, theme, name, path, iconpath, timestamp from forms where id = '".$forms_active_theme_id."'");
        
        if ($db_result) {
            
            $db_record_count  = pg_num_rows($db_result);
            
            if ($db_record_count > 0 ) {
                
                $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH );
                
                $forms_id = $db_record["id"];
                $forms_theme = $db_record["theme"];
                $forms_theme_iconpath = $db_record["iconpath"];
                
            } else {
                
                $forms_id = "Error: no records found!";
                
            }
            
            pg_free_result($db_result);
            
        } else {
            
            $forms_id = "Error: SQL-Access went wrong!";
            
        }
        
        pg_close($db_connection);
    
    } else {
        
        $forms_id = "Error: Database-Access went wrong!";
        
    }

    

}


?>


<?php include 'left_menu.php'; ?>

<div role="main" class="main-content">

  <div class="page-content container container-plus">
    <!-- page header and toolbox -->
    <div class="page-header pb-2">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.php">Home</a></li>
          <li class="breadcrumb-item"><a href="settings.php">Admin</a></li>
          <li class="breadcrumb-item active">Training</li>
        </ol>
      </nav>
    </div>
    <?php
    if ($_SESSION['user_type'] == 'U') {
      echo '<div class="alert d-flex bgc-red-l3 brc-success-m4 border-0 p-0" role="alert">
                      <div class="bgc-red px-3 py-1 text-center radius-l-1">
                        <span class="fa-2x text-white">
                ⚠ <!-- &#9888; -->
              </span>
                      </div><span class="ml-3 align-self-center text-dark-tp3 text-110">
              You do not have permission to access this page!
            </span></div>';
    } else {
    ?>

      


     
              <form method="POST" action="template_list_edit.php?act=edit" enctype="multipart/form-data">

                <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="forms_theme_id" class="form-control" value="<?php  echo $forms_active_theme_id; ?>" id="forms_theme_id" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">Current Form Name</label>
                  <input type="text" name="forms_theme_old" class="form-control" value="<?php echo $forms_theme; ?>" id="current_theme" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">New Form Name</label>
                  <input type="text" name="forms_theme_new" class="form-control" id="new_theme">
                </div>


                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <input type="submit" class="btn btn-primary" value="Add">
                </div>
              </form>


          </div>
        </div>
      </div>





      
    <?php
    }
    ?>

  </div>

</div>
</div>


</body>

</html>
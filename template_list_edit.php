<?php
session_start();
include('paginator.class.php');
?>

<?php
include 'db_connect.php';
if ($_GET['act'] == 'edit') {
  if (isset( $_POST['forms_theme_id'] ))  { $forms_theme_id = trim($_POST['forms_theme_id']); } 
    if (isset( $_POST['forms_theme_old'] )) { $forms_theme_old = trim($_POST['forms_theme_old']); } 
    if (isset( $_POST['forms_theme_new'] )) { $forms_theme_new = trim($_POST['forms_theme_new']); } 
    $group_id_array=array();
      foreach ($_POST['group_id'] AS $key => $value) {
        array_push($group_id_array,$value);
      }
   if ($forms_theme_new!="") {
        
        $item_name = $forms_theme_new;
        
    } else {
        
        $item_name = $forms_theme_old;
        
    }
// if (($forms_theme_old != $forms_theme_new) && ($forms_theme_old != "")) {
        
        $sql = "update forms set theme = '".$item_name."',access_group='{".implode(',',$group_id_array)."}' where id = '".$forms_theme_id."'";        
        
    // } else {
        
    //     $sql = "insert into forms (id, theme, timestamp) values ((select max(id) from forms) + 1, '".$forms_theme_new."', localtimestamp)"; 
        
    // }
    
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
        
        $db_result = pg_query($db_connection, "select id, theme, name, path, iconpath, timestamp,access_group from forms where id = '".$forms_active_theme_id."'");
        
        if ($db_result) {
            
            $db_record_count  = pg_num_rows($db_result);
            
            if ($db_record_count > 0 ) {
                
                $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH );
                
                $forms_id = $db_record["id"];
                $forms_theme = $db_record["theme"];
                $forms_theme_iconpath = $db_record["iconpath"];
                $access_group=$db_record["access_group"];
        $access_group_substring=substr($access_group,1,-1);
        $access_group_explode=explode(',',$access_group_substring);
                
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
                <div class="form-group">
                            <label for="group_add">Select Groups</label>   


                              
                      <select id="example-getting-started2" class="form-control selectpicker" name="group_id[]" multiple="multiple" data-show-subtext="true" data-live-search="true">

                        <?php
                        include 'db_connect.php';
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
   
      
    if(in_array($group_id,$access_group_explode,true)){
      echo "selected";
    }
    echo '>' . $group_name . '</option>';
                            }
                          }
                        }
                        ?>

                      </select>

                    </div>
                <div id="loader" class="loader"></div>
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
<?php include 'footer.php'; ?>
<script>
$(document).ready(function() 
{
    $('#loader').hide();

    $('form').submit(function() 
    {
        $('#loader').show();
    }) 
});
$(document).ready(function() {
    $('#example-getting-started').multiselect();
  });

</script>
</body>

</html>
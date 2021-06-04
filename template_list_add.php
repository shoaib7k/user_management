<?php
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);
session_start();
include('paginator.class.php');
?>

<?php
include 'db_connect.php';
$parent_id = $_GET['forms_id'];
$theme_id = $_GET['forms_id'];
$forms_item_id=$_GET['forms_item_id'];  
$redirect_from = $_GET['origin'];

// if ($redirect_from >= $forms_item_id)
//     $redirect_from = 1;
$all_groups=array();
        $sql3=pg_query("select * from groups");
        while($val3=pg_fetch_array($sql3)){
          array_push($all_groups,$val3['id']);
        }
        print_r($all_groups);
if ($db_connection)  {
        
          // prepare title
          $theme_name = "Thema nicht vorhanden.";

          
          
          $sql = "select theme from forms where id = ".$theme_id;
          
          $db_result = pg_query($db_connection, $sql);
          
          if ($db_result) {
              
              $db_recordcount = pg_num_rows($db_result);
              
              if ($db_recordcount > 0) {
                  
                  $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH );
                  
                  $theme_name = $db_record["theme"];
                  
              }
           
              pg_free_result($db_result);
              
          }
          }
if ($_GET['act'] == 'add') {
  if (isset( $_POST['forms_theme_id'] ))  { $forms_theme_id = trim($_POST['forms_theme_id']); } else { $forms_theme_id = ""; }
    if (isset( $_POST['forms_theme_old'] )) { $forms_theme_old = trim($_POST['forms_theme_old']); } else { $forms_theme_old = ""; }
    if (isset( $_POST['forms_theme_new'] )) { $forms_theme_new = trim($_POST['forms_theme_new']); } else { $forms_theme_new = ""; }
if (($forms_theme_old != $forms_theme_new) && ($forms_theme_old != "")) {
        
        $sql = "update forms set theme = '".$forms_theme_new."' where theme = '".$forms_theme_old."'";        
        
    } else {
     
        if($parent_id!==""){
        $sql = "insert into forms (id, theme, timestamp,themeid,access_group,breadpath) values ((select max(id) from forms) + 1, '".$forms_theme_new."', localtimestamp,'".$parent_id."','{".implode(',',$all_groups)."}','".json_encode($_SESSION['bc'],JSON_UNESCAPED_SLASHES)."')"; 
        header("location: forms_item_list.php?forms_id=$parent_id&forms_item_id=$forms_item_id");
        }
        else{
          $sql = "insert into forms (id, theme, timestamp,access_group,breadpath) values ((select max(id) from forms) + 1, '".$forms_theme_new."', localtimestamp,'{".implode(',',$all_groups)."}','".json_encode($_SESSION['bc'],JSON_UNESCAPED_SLASHES)."')"; 
          header("location: template_list.php?app=default&lang=de");
        }
    }
    
    if ($db_connection) {
        
        $db_result = pg_query($db_connection, $sql);
        
        if ($db_result) {
            
            pg_free_result($db_result);
            
        }      
        
        pg_close($db_connection);
        
    }
}


?>

<?php include 'left_menu.php'; ?>

<div role="main" class="main-content">

  <div class="page-content container container-plus">
    <!-- page header and toolbox -->
    <div class="page-header pb-2">
    <nav class="breadcrumb">
                <a style="1px solid #000000; padding: 0 5px" href="home.php?app=default&lang=<?php echo detect_language(); ?> ">Home</a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="template_list.php?app=default&lang=<?php echo detect_language(); ?>"><?php echo $_templates;?></a>
                <?php if(isset($parent_id)){
                    
                    foreach($_SESSION['bc'] as $x=>$x_value)
  {
 // echo "Key=" . $x . ", Value=" . $x_value;
 $querybc=pg_query("select theme from forms where id=".$x."");
 while($parentsbc=pg_fetch_array($querybc)){
     $name_bc=$parentsbc['theme'];
 }
 
 echo " / ";
  echo "<a style='1px solid #000000; padding: 0 5px' href='.$x_value.'>$name_bc </a>";
  
  }
    // print_r($_SESSION['bc']);
    
                }?>
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active"><?php echo $_add;?> </a>
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

      


     
              <form method="POST" action="template_list_add.php?act=add&forms_id=<?php echo $parent_id;?>&forms_item_id=<?php echo $forms_item_id;?>" enctype="multipart/form-data">

                <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="forms_theme_id" class="form-control" value="<?php echo $forms_theme_id; ?>" id="forms_theme_id" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">Current Form Name</label>
                  <input type="text" name="forms_theme_old" class="form-control" value="<?php echo $forms_theme_old; ?>" id="current_theme" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">New Form Name</label>
                  <input type="text" name="forms_theme_new" class="form-control" id="new_theme">
                </div>
                <div id="loader" class="loader"></div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.history.go(-1); return false;"><?php echo $_close;?></button>
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
<?php include 'footer.php';?>
<script>
$(document).ready(function() 
{
    $('#loader').hide();

    $('form').submit(function() 
    {
        $('#loader').show();
    }) 
});
  </script>
</body>

</html>
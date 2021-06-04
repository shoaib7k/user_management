<html lang="en">
  <head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    -
    <script src="./js/plugins/piexif.js" type="text/javascript"></script>
    <script src="./js/plugins/sortable.js" type="text/javascript"></script>
    <script src="./js/fileinput.js" type="text/javascript"></script>
    <script src="./js/locales/fr.js" type="text/javascript"></script>
    <script src="./js/locales/es.js" type="text/javascript"></script>
    <script src="./themes/fas/theme.js" type="text/javascript"></script>
    <script src="./themes/explorer-fas/theme.js" type="text/javascript"></script>

    <link rel="icon" type="image/png" href="./images/rf-title2.jpg" />
<!--<script src="./node_modules/jquery/dist/jquery.js"></script>
-->
    <script src="./node_modules/bootstrap/dist/js/bootstrap.js"></script>

   <script src="./node_modules/bootstrap-select/dist/js/bootstrap-select.js"></script>
    <script src="./node_modules/bootstrap-duallistbox/dist/jquery.bootstrap-duallistbox.js"></script>


    <script src="./node_modules/select2/dist/js/select2.js"></script>
    <script src="./node_modules/chosen-js/chosen.jquery.js"></script>

    <!-- include ace.js -->
    <script src="./dist/js/ace.js"></script>
  </head>
<?php

session_start();
include('paginator.class.php');
?>

<?php
include 'db_connect.php';

$lang="en";

$title = $_POST['information_title'];
$content = $_POST['editordata'];


if(isset($_GET['lang'])){
  if($_GET['lang']=="en"){
      $ck="checked";
  }
  else if($_GET['lang']=="de"){
      $ck2="checked";
      $lang="de";
  }
  else if($_GET['lang']=="pol"){
      $ck3="checked";
      $lang="pol";
  }
  else{
      $ck="checked";
  }
}
else{
  $ck="checked";
}
if ($_GET['act'] == 'add') {
 
  $group_id_array=array();
  foreach ($_POST['group_id'] AS $key => $value) {
    array_push($group_id_array,$value);
  }
         if ($lang=="de"){
          $sql = "insert into information (titel_de, inhalt_de,access_group) values ('".$title."','".$content."','{".implode(',',$group_id_array)."}')";
        }
        else if($lang=="pol"){
          $sql = "insert into information ( titel_pol, inhalt_pol) values ( '".$title."','".$content."','{".implode(',',$group_id_array)."}')";
        }
        else{
          $sql = "insert into information ( titel, inhalt,access_group) values ( '".$title."','".$content."','{".implode(',',$group_id_array)."}')";
        }
         
        header("location: information_list.php");
        
        
          
  
    
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
                <a style="1px solid #000000; padding: 0 5px" href="home.php">Home</a>
                <a>/</a>
               
                <a style="1px solid #000000; padding: 0 5px" class=" active"><?php echo $_information;?></a>
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

      


     
              <form method="POST" action="information_item_add.php?act=add&lang=<?php echo $lang; ?>" enctype="multipart/form-data">

                <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="information_id" class="form-control" value="<?php echo $forms_theme_id; ?>" id="information_id" readonly>
                </div>
                <div class="form-group">
                      <label for="group_add"><?php echo $_select_group_for_access;?></label>
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
                <div class="form-group">
                  <label for="formGroupExampleInput"><?php echo $_title;?></label>
                  <input type="text" name="information_title" class="form-control" id="information_title">
                </div>
                
                <div class="form-group">
                  <label for="formGroupExampleInput"><?php echo $_content;?></label>
                  <textarea id="summernote" name="editordata"></textarea>
                </div>

                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo $_close;?></button>
                  <input type="submit" class="btn btn-primary" value=<?php echo $_add;?>>
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
<script>
      $('#summernote').summernote({
        placeholder: 'Write here.....',
        tabsize: 2,
        height: 400
      });
      $('#summernote').summernote('code');
    </script>
</body>

</html>
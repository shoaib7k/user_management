<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Hi Summernote with Bootstrap 4</title>
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
if ($_GET['act'] == 'edit') {

    $information_id_update = $_POST['information_id_edit'];
    $information_title_update = $_POST['information_title_edit'];
    $information_content_update = $_POST['editordata_edit'];
    $group_id_array=array();
      foreach ($_POST['group_id'] AS $key => $value) {
        array_push($group_id_array,$value);
      }
    $lang_update = $_GET['lang'];
    if ($lang_update == "de") {
        $sql = "update information set titel_de = '" . $information_title_update . "',inhalt_de='" . $information_content_update . "', access_group='{".implode(',',$group_id_array)."}' where id = '" . $information_id_update . "'";
    } else if ($lang_update == "pol") {
        "update information set titel_pol = '" . $information_title_update . "',inhalt_pol='" . $information_content_update . "',access_group='{".implode(',',$group_id_array)."}' where id = '" . $information_id_update . "'";
    } else {
        $sql = "update information set titel = '" . $information_title_update . "',inhalt='" . $information_content_update . "',access_group='{".implode(',',$group_id_array)."}' where id = '" . $information_id_update . "'";
    }

    
    if ($db_connection) {

        $db_result = pg_query($db_connection, $sql);

        if ($db_result) {

            pg_free_result($db_result);
            header("location: information_list.php");
        }

        pg_close($db_connection);
    }
}
?>
<?php

global $homebase_path;

$information_id = "";
$information_title = "";
$information_content = "";
$lang = "en";
$information_active_id = $_GET['information_id'];
echo $information_id;
if ($information_active_id != "") {
    if ($db_connection) {

        $db_result = pg_query($db_connection, "select id, titel, inhalt, titel_de, inhalt_de, titel_pol,inhalt_pol,access_group from information where id = '" . $information_active_id . "'");
        echo $db_result;

        if ($db_result) {

            $db_record_count  = pg_num_rows($db_result);

            if ($db_record_count > 0) {

                $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH);

                $information_id = $db_record["id"];
                $item_titel = $db_record["titel"];
                $item_inhalt = $db_record["inhalt"];
                $item_titel_de = $db_record["titel_de"];
                $item_inhalt_de = $db_record["inhalt_de"];
                $item_titel_pol = $db_record["titel_pol"];
                $item_inhalt_pol = $db_record["inhalt_pol"];
                $access_group=$db_record["access_group"];
        $access_group_substring=substr($access_group,1,-1);
        $access_group_explode=explode(',',$access_group_substring);
                if ($item_titel == "" && $item_title_pol == "") {
                    $information_title = $item_titel_de;
                    $information_content = $item_inhalt_de;
                    $lang = "de";
                } else if ($item_titel_de == "" && $item_titel == "") {
                    $information_title = $item_title_pol;
                    $information_content = $item_inhalt_pol;
                    $lang = "pol";
                } else {
                    $information_title = $item_titel;
                    $information_content = $item_inhalt;
                    $lang = "en";
                }
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
        <nav class="breadcrumb">
                <a style="1px solid #000000; padding: 0 5px" href="home.php">Home</a>
                <a>/</a>
               
                <a style="1px solid #000000; padding: 0 5px" class=" active">Information</a>
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


            <form method="POST" action="information_item_edit.php?act=edit&lang=<?php echo $lang; ?>" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="formGroupExampleInput">ID</label>
                    <input type="text" name="information_id_edit" class="form-control" value="<?php echo $information_id; ?>" id="information_id" readonly>
                </div>

                <div class="form-group">
                    <label for="formGroupExampleInput">Title</label>
                    <input type="text" name="information_title_edit" class="form-control" id="information_title" value="<?php echo $information_title; ?> ">
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
                <div class="form-group">
                    <label for="formGroupExampleInput">Content</label>
                    <textarea id="summernote" name="editordata_edit" ><?php echo $information_content; ?></textarea>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Save">
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
        placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 400,
    
    });
    $(document).ready(function() {
    $('#example-getting-started').multiselect();
  });
</script>

</body>

</html>
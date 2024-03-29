<?php
session_start();
include('paginator.class.php');
?>
<?php
include 'db_connect.php';
?>
<?php

$theme_id = $_GET['theme_id'];
// if ($theme_id != "") {

  if ($db_connection) {

    $db_result = pg_query($db_connection, "select theme, iconpath,access_group from media where id = " . $theme_id);
    if ($db_result) {

      if (pg_num_rows($db_result) > 0) {

        $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH);

        $theme_name = $db_record["theme"];
        $theme_icon = $db_record["iconpath"];
        $access_group=$db_record["access_group"];
        $access_group_substring=substr($access_group,1,-1);
        $access_group_explode=explode(',',$access_group_substring);
      
      }
    }
    pg_free_result($db_result);
  }
//   pg_close($db_connection);
// }
?>
<?php
 if ($_GET['act'] == 'edit') {
  global $homebase_path;

  $training_theme_id = "";
  $training_theme_name_old = "";
  $training_theme_name_new = "";
  $file_unique_name = "";
  $file_name = "";
  $file_iconpath = "";
  $file_iconpath_old = "";
  $group_id_array=array();
      foreach ($_POST['group_id'] AS $key => $value) {
        array_push($group_id_array,$value);
      }
  if (isset($_POST["training_theme_id"])) {
    $training_theme_id = $_POST["training_theme_id"];
  }
  if (isset($_POST["training_theme_name_old"])) {
    $training_theme_name_old = $_POST["training_theme_name_old"];
  }
  if (isset($_POST["training_theme_name_new"])) {
    $training_theme_name_new = $_POST["training_theme_name_new"];
  }

  $image_types = array('image/jpeg', 'image/gif', 'image/png');

  if (isset($_FILES['file_name'])) {

    if (in_array($_FILES['file_name']['type'], $image_types)) {

      $file_tmp_name = $_FILES["file_name"]["tmp_name"];

      if ($_FILES['file_name']['type'] == 'image/jpeg') {
        $image_suffix = '.jpg';
      }
      if ($_FILES['file_name']['type'] == 'image/gif') {
        $image_suffix = '.gif';
      }
      if ($_FILES['file_name']['type'] == 'image/png') {
        $image_suffix = '.png';
      }

      $file_unique_name = md5(uniqid(rand(), TRUE)) . $image_suffix; // create unique file name

      $file_name = $homebase_path . "training/icons/" . $file_unique_name;
      $file_iconpath = "training/icons/" . $file_unique_name;
    } else {

      echo "Dieser Dateityp ist nicht zugelassen";
    }
  }

  //$_db_connection = pg_connect("host=localhost port=5432 dbname=Intranet user=postgres password=postgres");

  if ($db_connection) {

    if ($training_theme_id != "") { // change theme

      $db_result = pg_query($db_connection, "select iconpath from media where id = " . $training_theme_id);

      if ($db_result) {

        $db_record_count = pg_num_rows($db_result);

        if ($db_record_count > 0) {

          $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH);

          $file_iconpath_old = $homebase_path . $db_record["iconpath"];
        }
      }


      if ($training_theme_name_new != "") {

        if ($file_name == "") {

          $sql = "update media set theme = '" . $training_theme_name_new . "', access_group='{".implode(',',$group_id_array)."}' where id = " . $training_theme_id;
          $db_result = pg_query($db_connection, $sql);
        } else {

          $sql = "update media set theme = '" . $training_theme_name_new . "', iconpath = '" . $file_iconpath . "',access_group='{".implode(',',$group_id_array)."}' where id = " . $training_theme_id;
          $db_result = pg_query($db_connection, $sql);

          if ($db_result) {
            unlink($file_iconpath_old);
            move_uploaded_file($file_tmp_name, $file_name);
          }
        }
      } else {

        if ($file_name == "") {

          // do noting
          $sql = "update media set theme = '" . $training_theme_name_old . "', access_group='{".implode(',',$group_id_array)."}' where id = " . $training_theme_id;
          $db_result = pg_query($db_connection, $sql);

        } else {

          $sql = "update media set iconpath = '" . $file_iconpath . "',access_group='{".implode(',',$group_id_array)."}' where id = " . $training_theme_id;
          $db_result = pg_query($db_connection, $sql);

          if ($db_result) {
            unlink($file_iconpath_old);
            move_uploaded_file($file_tmp_name, $file_name);
          }
           header("location: training_list.php?app=default&lang=de)");
        }
      }
      header("location: training_list.php?app=default&lang=de");
    } else { // new theme

      if ($training_theme_name_new != "") {

        if ($file_name == "") {

          $sql = "insert into media (theme, iconpath) values ('" . $training_theme_name_new . "',NULL')";
          $db_result = pg_query($db_connection, $sql);
        } else {

          $sql = "insert into media (theme, iconpath) values ('" . $training_theme_name_new . "', '" . $file_iconpath . "')";
          $db_result = pg_query($db_connection, $sql);
          if ($db_result) {
            move_uploaded_file($file_tmp_name, $file_name);
          }
        }
      } else {

        echo "Ein neues Thema kann nicht ohne Namen angelegt werden.";
      }

      pg_free_result($db_result);
      header("location: training_list.php?app=default&lang=de");
    }

    pg_close($db_connection);
  } else {

    echo "Es konnte keine Verbindung zur Datenbank hergestellt werden.";
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

                <a style="1px solid #000000; padding: 0 5px" href="training_list.php?app=default&lang=<?php echo detect_language(); ?>"><?php echo $_training; ?></a>
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active"><?php echo $_update;?> </a>
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

     
<h1><a href=""></a></h1>
                <hr>

            <form method="POST" action="training_list_edit.php?act=edit" enctype="multipart/form-data">
                            <div class="form-group">
                              <label for="formGroupExampleInput">ID</label>
                              <input type="text" name="training_theme_id" class="form-control" value="<?php echo $theme_id; ?>" id="theme_id" readonly>
                            </div>
                            <div class="form-group">
                              <label for="formGroupExampleInput"><?php echo $_current_theme_name;?></label>
                              <input type="text" name="training_theme_name_old" class="form-control" value="<?php echo $theme_name; ?>" id="current_theme" readonly>
                            </div>
                            <div class="form-group">
                              <label for="formGroupExampleInput"><?php echo $_new_theme_name;?></label>
                              <input type="text" name="training_theme_name_new" class="form-control" id="new_theme">
                            </div>
                         <label for="group_add"><?php echo $_select_group_for_access;?></label>     
                      <select id="example-getting-started2" class="form-control selectpicker" name="group_id[]" multiple="multiple" data-show-subtext="true" data-live-search="true">

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
   
      
    if(in_array($group_id,$access_group_explode,true)){
      echo "selected";
    }
    echo '>' . $group_name . '</option>';
                            }
                          }
                        }
                        ?>

                      </select>
                      
<!--       
                            <label for="formGroupExampleInput">Icon</label>
                            <div class="file-loading">
         <input id="kv-explorer" name="file_name" type="file" multiple>
      </div> -->
                            <!-- <div class="ml-2 col-sm-6">
                              <img src="<?php echo $theme_icon; ?>" id="preview<?php echo $val['id']; ?>" class="img-thumbnail" style="width: 80px;height: 80px;">
                            </div> -->
                        <div id="loader" class="loader"></div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.history.go(-1); return false;"><?php echo $_close;?></button>
                              <input type="submit" class="btn btn-primary" value=<?php echo $_update;?>>
                            </div>
                          </form>
          
    <?php
    }
    ?>

  </div>

</div>
</div>

<?php include 'footer.php'; ?>
<script>
    $('#file-fr').fileinput({
        theme: 'fas',
        language: 'fr',
        uploadUrl: '#',
        allowedFileExtensions: ['jpg', 'png', 'gif']
    });
    $('#file-es').fileinput({
        theme: 'fas',
        language: 'es',
        uploadUrl: '#',
        allowedFileExtensions: ['jpg', 'png', 'gif']
    });
    $("#file-0").fileinput({
        theme: 'fas',
        uploadUrl: '#'
    }).on('filepreupload', function(event, data, previewId, index) {
        alert('The description entered is:\n\n' + ($('#description').val() || ' NULL'));
    });
    $("#file-1").fileinput({
        theme: 'fas',
        uploadUrl: '#', // you must set a valid URL here else you will get an error
        allowedFileExtensions: ['jpg', 'png', 'gif'],
        overwriteInitial: false,
        maxFileSize: 1000,
        maxFilesNum: 10,
        //allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });
    /*
     $(".file").on('fileselect', function(event, n, l) {
     alert('File Selected. Name: ' + l + ', Num: ' + n);
     });
     */
    $("#file-3").fileinput({
        theme: 'fas',
        showUpload: false,
        showCaption: false,
        browseClass: "btn btn-primary btn-lg",
        fileType: "any",
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        overwriteInitial: false,
        initialPreviewAsData: true,
        initialPreview: [
            "http://lorempixel.com/1920/1080/transport/1",
            "http://lorempixel.com/1920/1080/transport/2",
            "http://lorempixel.com/1920/1080/transport/3"
        ],
        initialPreviewConfig: [
            {caption: "transport-1.jpg", size: 329892, width: "120px", url: "{$url}", key: 1},
            {caption: "transport-2.jpg", size: 872378, width: "120px", url: "{$url}", key: 2},
            {caption: "transport-3.jpg", size: 632762, width: "120px", url: "{$url}", key: 3}
        ]
    });
    $("#file-4").fileinput({
        theme: 'fas',
        uploadExtraData: {kvId: '10'}
    });
    $(".btn-warning").on('click', function () {
        var $el = $("#file-4");
        if ($el.attr('disabled')) {
            $el.fileinput('enable');
        } else {
            $el.fileinput('disable');
        }
    });
    $(".btn-info").on('click', function () {
        $("#file-4").fileinput('refresh', {previewClass: 'bg-info'});
    });
    /*
     $('#file-4').on('fileselectnone', function() {
     alert('Huh! You selected no files.');
     });
     $('#file-4').on('filebrowse', function() {
     alert('File browse clicked for #file-4');
     });
     */
    $(document).ready(function () {
        $("#test-upload").fileinput({
            'theme': 'fas',
            'showPreview': false,
            'allowedFileExtensions': ['jpg', 'png', 'gif'],
            'elErrorContainer': '#errorBlock'
        });
        $("#kv-explorer").fileinput({
            'theme': 'explorer-fas',
            //'uploadUrl': '#',
            showUpload: false,
            overwriteInitial: false,
            initialPreviewAsData: true,
        });
        /*
         $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
         alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
         });
         */
    });

    $(document).ready(function() {
    $('#example-getting-started').multiselect();
  });
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
<?php
session_start();
include('paginator.class.php');
?>
<?php
include 'db_connect.php';
?>
<?php

$theme_id = $_GET['theme_id'];
if ($theme_id != "") {

  if ($db_connection) {

    $db_result = pg_query($db_connection, "select theme, iconpath from media where id = " . $_theme_id);
    if ($db_result) {

      if (pg_num_rows($db_result) > 0) {

        $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH);

        $theme_name = $db_record["theme"];
        $theme_icon = $db_record["iconpath"];
      }
    }
    pg_free_result($db_result);
  }
  pg_close($db_connection);
}
?>
<?php
include 'db_connect.php';
if ($_GET['act'] == 'add') {

  global $_homebase_path;
 // $_homebase_path = "/var/www/webtest5/";
   $_homebase_path = "";
  $_training_theme_id = "";
  $_training_theme_name_old = "";
  $_training_theme_name_new = "";
  $_file_unique_name = "";
  $_file_name = "";
  $_file_iconpath = "";
  $_file_iconpath_old = "";
  $group_id_array=array();
      foreach ($_POST['group_id'] AS $key => $value) {
        array_push($group_id_array,$value);
      }

  if (isset($_POST["training_theme_id"])) {
    $_training_theme_id = $_POST["training_theme_id"];
  }
  if (isset($_POST["training_theme_name_old"])) {
    $_training_theme_name_old = $_POST["training_theme_name_old"];
  }
  if (isset($_POST["training_theme_name_new"])) {
    $_training_theme_name_new = $_POST["training_theme_name_new"];
  }

  $_image_types = array('image/jpeg', 'image/gif', 'image/png');

  if (isset($_FILES['file_name'])) {

    if (in_array($_FILES['file_name']['type'], $_image_types)) {

      $_file_tmp_name = $_FILES["file_name"]["tmp_name"];

      if ($_FILES['file_name']['type'] == 'image/jpeg') {
        $_image_suffix = '.jpg';
      }
      if ($_FILES['file_name']['type'] == 'image/gif') {
        $_image_suffix = '.gif';
      }
      if ($_FILES['file_name']['type'] == 'image/png') {
        $_image_suffix = '.png';
      }

      $_file_unique_name = md5(uniqid(rand(), TRUE)) . $_image_suffix; // create unique file name

      $_file_name = $_homebase_path . "training/icons/" . $_file_unique_name;
      $_file_iconpath = "training/icons/" . $_file_unique_name;
    } else {

      echo "Dieser Dateityp ist nicht zugelassen";
    }
  }

  //  $_db_connection = pg_connect("host=localhost port=5432 dbname=Intranet user=postgres password=postgres");

  if ($db_connection) {

    if ($_training_theme_id != "") { // change theme

      $_db_result = pg_query($db_connection, "select iconpath from media where id = " . $_training_theme_id);

      if ($_db_result) {

        $_db_record_count = pg_num_rows($_db_result);

        if ($_db_record_count > 0) {

          $_db_record = pg_fetch_array($_db_result, 0, PGSQL_BOTH);

          $_file_iconpath_old = $_homebase_path . $_db_record["iconpath"];
        }
      }


      if ($_training_theme_name_new != "") {

        if ($_file_name == "") {

          $_sql = "update media set theme = '" . $_training_theme_name_new . "' where id = " . $_training_theme_id;
          $_db_result = pg_query($db_connection, $_sql);
        } else {

          $_sql = "update media set theme = '" . $_training_theme_name_new . "', iconpath = '" . $_file_iconpath . "' where id = " . $_training_theme_id;
          $_db_result = pg_query($db_connection, $_sql);

          if ($_db_result) {
            unlink($_file_iconpath_old);
            move_uploaded_file($_file_tmp_name, $_file_name);
          }
        }
      } else {

        if ($_file_name == "") {

          // do noting

        } else {

          $_sql = "update media set iconpath = '" . $_file_iconpath . "' where id = " . $_training_theme_id;
          $_db_result = pg_query($db_connection, $_sql);

          if ($_db_result) {
            unlink($_file_iconpath_old);
            move_uploaded_file($_file_tmp_name, $_file_name);
          }
        }
      }
    } else { // new theme

      if ($_training_theme_name_new != "") {

        if ($_file_name == "") {

          $_sql = "insert into media (theme, iconpath,access_group) values ('" . $_training_theme_name_new . "',NULL,'{".implode(',',$group_id_array)."}')";
          $_db_result = pg_query($db_connection, $_sql);
        } else {

          $_sql = "insert into media (theme, iconpath,access_group) values ('" . $_training_theme_name_new . "', '" . $_file_iconpath . "','{".implode(',',$group_id_array)."}')";
          $_db_result = pg_query($db_connection, $_sql);
          if ($_db_result) {
            move_uploaded_file($_file_tmp_name, $_file_name);
            /*if(move_uploaded_file($_file_tmp_name, $_file_name))
            {
echo "uplaoded";
                        }
                        else{
echo "failed";
                        }
                        exit();
                        */
                        header("location: training_list.php?app=default&lang=de");
          }
          header("location: training_list.php?app=default&lang=de");
        }
      } else {

        echo "Ein neues Thema kann nicht ohne Namen angelegt werden.";
      }

      pg_free_result($_db_result);
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

      


     
              <form method="POST" action="training_list_add.php?act=add&app=default&lang=<?php echo detect_language(); ?>" enctype="multipart/form-data">

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
                <div class="form-group">
                      <label for="group_add"><?php echo $_select_group_for_access;?></label>
                  <select id="example-getting-started" class="form-control selectpicker" name="group_id[]" multiple="multiple" data-show-subtext="true" data-live-search="true">

                        <?php
                        $db_sql = "select id, group_name from groups";
                        print_r($db_sql);
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
                <!-- <label for="formGroupExampleInput">Icon</label>
                <div class="file-loading">
         <input id="kv-explorer" name="file_name" type="file" multiple>
      </div> -->
      <div id="loader" class="loader"></div>

                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.history.go(-1); return false;"><?php echo $_close;?></button>
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
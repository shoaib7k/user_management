<?php
session_start();
include('paginator.class.php');
?>
<?php
include 'db_connect.php';
?>
<?php

$theme_id = $_GET['theme_id'];
$theme_type = $_GET['type'];
if ($db_connection)  {
        
        // prepare title
        $theme_name = "Thema nicht vorhanden.";
        $type_name = "Typ unbekannt.";
        
        if ($theme_type == "handbook") { $type_name = "Handbücher"; }
        if ($theme_type == "video") { $type_name = "Videos"; }
        
        
        $sql = "select theme from media where id = ".$theme_id;
        
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
        // write title
        
?>
<?php

if ($_GET['act'] == 'add') {

    if (isset($_POST["template_document_theme_id"])) {  $forms_id = $_POST["template_document_theme_id"]; } 
    if (isset($_POST["template_document_item_id"])) {  $item_id = $_POST["template_document_item_id"]; } 
    if (isset($_POST["template_document_item_name_old"])) {  $item_name_old = trim($_POST["template_document_item_name_old"]); }
    if (isset($_POST["template_document_item_name_new"])) {  $item_name_new = trim($_POST["template_document_item_name_new"]); }
   if ($item_name_old != $item_name_new) {
        
        $item_name = $item_name_new;
        
    } else {
        
        $item_name = $item_name_old;
        
    }
    
    if ($db_connection) {

        echo $forms_id;
        
        if ($forms_id === "") {
            
            $sql = "insert into forms (id, name, path, iconpath, timestamp, themeid) values ((select max(id)+1 from forms),  '".$item_name."', '".$dst_path."','".$icn_path."',localtimestamp,".$forms_id.")";
            
        } else {
            
            $sql = "select path,iconpath from forms where id = ".$item_id;
            
            $db_result = pg_query($db_connection, $sql);
            
            if ($db_result) {
                
                $db_record_count = pg_num_rows($db_result);
                
                if ($db_record_count > 0) {
                
                    $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH );
                    
                    $del_path = $db_record["path"];
                    $del_icon = $db_record["iconpath"];
                    
                    unlink($homebase_path.$del_path);
                    unlink($homebase_path.$del_icon);
                    
                }
                
                pg_free_result($db_result);
                
            }
            
            $sql = "update forms set name = '".$item_name."', path = '".$dst_path."', iconpath = '".$icn_path."', timestamp = localtimestamp where id = ".$item_id;
            
        }
        
        $db_result = pg_query($db_connection, $sql);
        
        pg_free_result($db_result);
    
        move_uploaded_file($src_path, $homebase_path.$dst_path);
        
        require 'converter_for_documents.php';
        convert_document($homebase_path.$dst_path);
        
        pg_close($db_connection);
        
    }
 
}
//header("location: handbook_list.php?theme_id=".$theme_id."");
 

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
                <a style=" 1px solid #000000; padding: 0 5px" href="training_list.php">Training</a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="training_list.php">Handbook</a>
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active">Add </a>
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




      <div class="container">
              <form method="POST" action="forms_item_add.php?act=add&forms_id=<?php echo $forms_id; ?>" enctype="multipart/form-data">

<input type="text" name="training_document_theme_id" value="<?php echo $forms_id; ?>" readonly="true" style="display:none">

      <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="template_document_item_id" class="form-control" id="theme_id" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">Current Item Name</label>
                  <input type="text" name="template_document_item_name_old" class="form-control"  id="current_theme" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">New Item Name</label>
         <input type="text" name="template_document_item_name_new" class="form-control" id="new_theme">
                </div>

<label for="formGroupExampleInput"></label>
            <div class="file-loading">
         <input id="kv-explorer" name="file_name" type="file" multiple>
      </div>
                

                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <input type="submit" class="btn btn-primary" value="Add">
                </div>
              </form>
            
          <?php
          }
       ?>
          
      </div>
      <!--/.container-->
    <?php
  //  }
    ?>

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
            overwriteInitial: false,
            initialPreviewAsData: true,
        });
                $("#kv-explorer2").fileinput({
            'theme': 'explorer-fas',
            //'uploadUrl': '#',
            overwriteInitial: false,
            initialPreviewAsData: true,
        });
                        $("#kv-explorer3").fileinput({
            'theme': 'explorer-fas',
            //'uploadUrl': '#',
            overwriteInitial: false,
            initialPreviewAsData: true,
        });
        /*
         $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
         alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
         });
         */
    });
</script>

</body>

</html>
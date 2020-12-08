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
     // $theme_id = "";
    $item_id = "";
    $item_name_old = "";
    $item_name_new = "";   
    
    $file_src_path = "";
    $file_dst_path = "";
    $icon_dst_path = "";
    
    
    if (isset($_POST["training_document_theme_id"])) { echo $theme_id = $_POST["training_document_theme_id"]; } 
    if (isset($_POST["training_document_item_id"])) { echo $item_id = $_POST["training_document_item_id"]; } 
    if (isset($_POST["training_document_item_name_old"])) { echo $item_name_old = trim($_POST["training_document_item_name_old"]); }
    if (isset($_POST["training_document_item_name_new"])) { echo $item_name_new = trim($_POST["training_document_item_name_new"]); }
    
    if (isset($_FILES['file_name'])) {
        
        $file_path = $_FILES["file_name"]["name"];
        $file_ext = pathinfo($file_path, PATHINFO_EXTENSION);   
        
        
        $file_types = array('application/pdf');

        if (in_array($_FILES['file_name']['type'], $file_types)) {

            $file_src_path = $_FILES["file_name"]["tmp_name"];

            $file_dst_path_without_suffix = "training/documents/".md5(uniqid(rand(), TRUE));
            $file_dst_path = $file_dst_path_without_suffix.".".$file_ext; // create unique file name
            $icon_dst_path = $file_dst_path_without_suffix.".jpg";

        }
        
    }
      global $homebase_path;
  //$homebase_path = "/var/www/webtest5/";
      $homebase_path ="";
       //  $homebase_path = "/training/documents/";  
    if ($db_connection) {
 
        if ($item_id != "") { // update item
            
            if ($file_dst_path != "") { // delete stored file
                
                $sql = "select path, iconpath from media where id = ".$item_id;
                
                $db_result = pg_query($db_connection, $sql);
                
                if ($db_result) {
                    
                    $db_recordcount = pg_num_rows($db_result);
                    
                    if ($db_recordcount > 0) {
                        
                        $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH );
                        
                        $old_path = $db_record["path"];
                        $old_iconpath = $db_record["iconpath"];
                        
                        unlink($homebase_path.$old_path);
                        unlink($homebase_path.$old_iconpath);
                        
                    }
                    
                    pg_free_result($db_result);
                    
                }
                
            }
            
            if ($item_name_new != "") {
            
                if ($file_dst_path != "") {
                    
                    $sql = "update media set name = '".$item_name_new."', path = '".$file_dst_path."', iconpath = '".$icon_dst_path."' where id = ".$item_id;
                    $db_result = pg_query($db_connection, $sql);
                    
                    if($db_result) {
                        move_uploaded_file($file_src_path, $homebase_path.$file_dst_path);
                        
                        $source = $homebase_path.$file_dst_path;
                        $target = $homebase_path.$icon_dst_path;

                        $img = new Imagick();               
                        $img->readImage($source."[0]");                
                        $img->setimageformat('jpeg');
                        $img->setImageUnits(imagick:: RESOLUTION_PIXELSPERINCH);                
                        $img->setImageCompression(imagick::COMPRESSION_JPEG); 
                        $img->setImageCompressionQuality(90);                
                        $img->setImageAlphaChannel(Imagick::VIRTUALPIXELMETHOD_WHITE); // for white background in pdf
                        $img->scaleImage(256, 256,true);
                        $img->writeImage($target);
                        $img->clear();
                        $img->destroy();
                        
                        pg_free_result($db_result);
                        
                    }
                    
                } else {
                    
                    $sql = "update media set name = '".$item_name_new."' where id = ".$item_id;
                    $db_result = pg_query($db_connection, $sql);
                    
                    if ($db_result) {
                        
                        pg_free_result($db_result);
                        
                    }
                    
                }
                
            } else {
                
                if ($file_dst_path != "") {
                    
                    $sql = "update media set path = '".$file_dst_path."', iconpath = '".$icon_dst_path."' where id = ".$item_id;
                    $db_result = pg_query($db_connection, $sql);
                    if($db_result) {
                        move_uploaded_file($file_src_path, $homebase_path.$file_dst_path);
                        
                        $source = $homebase_path.$file_dst_path;
                        $target = $homebase_path.$icon_dst_path;

                        $img = new Imagick();               
                        $img->readImage($source."[0]");                
                        $img->setimageformat('jpeg');
                        $img->setImageUnits(imagick:: RESOLUTION_PIXELSPERINCH);                
                        $img->setImageCompression(imagick::COMPRESSION_JPEG); 
                        $img->setImageCompressionQuality(90);                
                        $img->setImageAlphaChannel(Imagick::VIRTUALPIXELMETHOD_WHITE); // for white background in pdf
                        $img->scaleImage(256, 256,true);
                        $img->writeImage($target);
                        $img->clear();
                        $img->destroy();
                        
                        pg_free_result($db_result);
                
                    }
                    
                } else {
                    
                    // do nothing
                    
                }
                
            }
                    
            
            
        } else { // new item
            
             if ($item_name_new != "") { // no record without item name
                
                if ($file_dst_path != "") {
                    
                    $sql = "insert into media (name,type,path,iconpath,themeid) values ('".$item_name_new."','handbook','".$file_dst_path."','".$icon_dst_path."',".$theme_id.")";
                    $db_result = pg_query($db_connection, $sql);
                    
                    if($db_result) {
                        move_uploaded_file($file_src_path, $homebase_path.$file_dst_path);
/*if (move_uploaded_file($file_src_path, $homebase_path.$file_dst_path)){
echo "uplaoded";
                        }
                        else{
echo "failed";
                        }
                        */
                         $source = $homebase_path.$file_dst_path;
                       $target = $homebase_path.$icon_dst_path;

                        $img = new Imagick();               
                        $img->readImage($source."[0]");                
                        $img->setimageformat('jpeg');
                        $img->setImageUnits(imagick:: RESOLUTION_PIXELSPERINCH);                
                        $img->setImageCompression(imagick::COMPRESSION_JPEG); 
                        $img->setImageCompressionQuality(90);                
                        $img->setImageAlphaChannel(Imagick::VIRTUALPIXELMETHOD_WHITE); // for white background in pdf
                        $img->scaleImage(256, 256,true);
                        $img->writeImage($target);
                        $img->clear();
                        $img->destroy();
                        
                        pg_free_result($db_result);
                        
                    }
                    
                } else {
                    
                  $sql = "insert into media (name,themeid) values ('".$item_name_new."',".$theme_id.")";
                    $db_result = pg_query($db_connection, $sql);
                    
                    if ($db_result) {
                       // echo "success";
                        pg_free_result($db_result);
                        
                    }
                    
                }                 
               header("location: handbook_list.php?theme_id=".$theme_id.""); 
                
            } else {
                
                // do nothing
                
            }
    header("location: handbook_list.php?theme_id=".$theme_id."");
            
        }
        
        
        
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




      <div class="container">
              <form method="POST" action="handbook_item_add.php?act=add&theme_id=<?php echo $theme_id; ?>" enctype="multipart/form-data">

<input type="text" name="training_document_theme_id" value="<?php echo $theme_id; ?>" readonly="true" style="display:none">

      <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="training_document_item_id" class="form-control" id="theme_id" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">Current Item Name</label>
                  <input type="text" name="training_document_item_name_old" class="form-control"  id="current_theme" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">New Item Name</label>
         <input type="text" name="training_document_item_name_new" class="form-control" id="new_theme">
                </div>

  
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
            'uploadUrl': '#',
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
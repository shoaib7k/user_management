<?php
session_start();
include('paginator.class.php');
?>
<?php
include 'db_connect.php';
?>
<?php
$_item_name = "";
$item_id = $_GET['item_id'];
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
        // get item
        
        if ($item_id != "") {
            
            $sql = "select name, path, iconpath, path2, iconpath2, path3, iconpath3,access_group from media where id = ".$item_id;
            
            $db_result = pg_query($db_connection, $sql);

            if ($db_result) {

                $db_recordcount = pg_num_rows($db_result);

                if ($db_recordcount > 0) {    
                    
                    $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH );

                    $item_name = $db_record["name"];    
                    $old_path = $db_record["path"];
                    $old_iconpath = $db_record["iconpath"];
                      $old_path2 = $db_record["path2"];
                        $old_iconpath2 = $db_record["iconpath2"];
                        $old_path3 = $db_record["path3"];
                        $old_iconpath3 = $db_record["iconpath3"];
                        $access_group=$db_record["access_group"];
        $access_group_substring=substr($access_group,1,-1);
        $access_group_explode=explode(',',$access_group_substring);
                        
                } 
                
            } else {
                
                echo "Fehler bei der Datenbankabfrage.";
                
            }
            
            
        }
        
        pg_close($db_connection);
        
?>
<?php

if ($_GET['act'] == 'edit') {
     // $theme_id = "";
    $item_id = "";
    $item_name_old = "";
    $item_name_new = "";   
    
    $file_src_path = "";
    $file_dst_path = "";
    $icon_dst_path = "";

    $file_src_path2 = "";
    $file_dst_path2 = "";
    $icon_dst_path2 = "";

    $file_src_path3 = "";
    $file_dst_path3 = "";
    $icon_dst_path3 = "";
    
    $group_id_array=array();
      foreach ($_POST['group_id'] AS $key => $value) {
        array_push($group_id_array,$value);
      }
    if (isset($_POST["training_document_theme_id"])) {  $theme_id = $_POST["training_document_theme_id"]; } 
    if (isset($_POST["training_document_item_id"])) {  $item_id = $_POST["training_document_item_id"]; } 
    if (isset($_POST["training_document_item_name_old"])) {  $item_name_old = trim($_POST["training_document_item_name_old"]); }
    if (isset($_POST["training_document_item_name_new"])) {  $item_name_new = trim($_POST["training_document_item_name_new"]); }
    
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
    if (isset($_FILES['file_name2'])) {
        
        $file_path2 = $_FILES["file_name2"]["name"];
        $file_ext2 = pathinfo($file_path2, PATHINFO_EXTENSION);   
        
        
        $file_types2 = array('application/pdf');

        if (in_array($_FILES['file_name2']['type'], $file_types2)) {

            $file_src_path2 = $_FILES["file_name2"]["tmp_name"];

            $file_dst_path_without_suffix2 = "training/documents/".md5(uniqid(rand(), TRUE));
            $file_dst_path2 = $file_dst_path_without_suffix2.".".$file_ext2; // create unique file name
            $icon_dst_path2 = $file_dst_path_without_suffix2.".jpg";

        }
        
    }
    if (isset($_FILES['file_name3'])) {
        
        $file_path3 = $_FILES["file_name3"]["name"];
        $file_ext3 = pathinfo($file_path3, PATHINFO_EXTENSION);   
        
        
        $file_types3 = array('application/pdf');

        if (in_array($_FILES['file_name3']['type'], $file_types3)) {

            $file_src_path3 = $_FILES["file_name3"]["tmp_name"];

            $file_dst_path_without_suffix3 = "training/documents/".md5(uniqid(rand(), TRUE));
            $file_dst_path3 = $file_dst_path_without_suffix3.".".$file_ext3; // create unique file name
            $icon_dst_path3 = $file_dst_path_without_suffix3.".jpg";

        }
        
    }
      global $homebase_path;
  //$homebase_path = "/var/www/webtest5/";
  //    $homebase_path = "/training/documents/";
      $homebase_path="";
   // if ($db_connection) {
     
            include 'db_connect.php';
     //   if ($item_id != "") { // update item
            
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
            if ($file_dst_path2 != "") { // delete stored file
                
                $sql = "select path2, iconpath2 from media where id = ".$item_id;
                
                $db_result = pg_query($db_connection, $sql);
                
                if ($db_result) {
                    
                    $db_recordcount = pg_num_rows($db_result);
                    
                    if ($db_recordcount > 0) {
                        
                        $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH );
                        
                        $old_path2 = $db_record["path2"];
                        $old_iconpath2 = $db_record["iconpath2"];
                        
                        unlink($homebase_path.$old_path2);
                        unlink($homebase_path.$old_iconpath2);

                        
                    }
                    
                    pg_free_result($db_result);
                    
                }
                
            }
            if ($file_dst_path3 != "") { // delete stored file
                
                $sql = "select path3, iconpath3 from media where id = ".$item_id;
                
                $db_result = pg_query($db_connection, $sql);
                
                if ($db_result) {
                    
                    $db_recordcount = pg_num_rows($db_result);
                    
                    if ($db_recordcount > 0) {
                        
                        $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH );
                        
                        $old_path3 = $db_record["path3"];
                        $old_iconpath3 = $db_record["iconpath3"];
                        
                        unlink($homebase_path.$old_path3);
                        unlink($homebase_path.$old_iconpath3);
                        
                    }
                    
                    pg_free_result($db_result);
                    
                }
                
            }

            
            include 'db_connect.php';
                 if ($file_dst_path != "") {
                    
                    echo $sql = "update media set  path = '".$file_dst_path."', iconpath = '".$icon_dst_path."', access_group='{".implode(',',$group_id_array)."}' where id = ".$item_id;
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
                }
                 if ($file_dst_path2 != "") {
                    
                    $sql = "update media set  path2 = '".$file_dst_path2."', iconpath2 = '".$icon_dst_path2."', access_group='{".implode(',',$group_id_array)."}' where id = ".$item_id;
                    $db_result = pg_query($db_connection, $sql);
                    
                    if($db_result) {
                        move_uploaded_file($file_src_path2, $homebase_path.$file_dst_path2);
                        
                        $source2 = $homebase_path.$file_dst_path2;
                        $target2 = $homebase_path.$icon_dst_path2;

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
                }
                 if ($file_dst_path3 != "") {
                    
                    $sql = "update media set  path3 = '".$file_dst_path3."', iconpath3 = '".$icon_dst_path3."', access_group='{".implode(',',$group_id_array)."}' where id = ".$item_id;
                    $db_result = pg_query($db_connection, $sql);
                    
                    if($db_result) {
                        move_uploaded_file($file_src_path3, $homebase_path.$file_dst_path3);
                        
                        $source3 = $homebase_path.$file_dst_path3;
                        $target3 = $homebase_path.$icon_dst_path3;

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
                } 
                   if ($item_name_new != "") {              
                    $sql = "update media set name = '".$item_name_new."', access_group='{".implode(',',$group_id_array)."}' where id = ".$item_id;
                    $db_result = pg_query($db_connection, $sql);
                    
                    if ($db_result) {
                        
                        pg_free_result($db_result);
                        
                    }
                }
                else {              
                    $sql = "update media set access_group='{".implode(',',$group_id_array)."}' where id = ".$item_id;
                    $db_result = pg_query($db_connection, $sql);
                    
                    if ($db_result) {
                        
                        pg_free_result($db_result);
                        
                    }
                }
                    
       //  exit();
                  header("location: handbook_list.php?theme_id=".$theme_id."&type=".$theme_type."");
            
      //  } 
   // }
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
                <a style=" 1px solid #000000; padding: 0 5px" href="settings.php">Admin</a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="training_list.php">Training</a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="training_list.php">Handbook</a>
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active">Edit </a>
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
           
<h1><a href=""> List <?php foreach ($access_group_explode as $key => $value) {
                                            echo $key;
                                            echo "->";
                                            echo "$value";
                                            echo "\n";
                                        }
                                        // foreach($ss as $_SESSION['user_in_groups'])
                                        // echo $ss; 
                                        ?></a></h1>
                <hr>
              <form method="POST" action="handbook_item_edit.php?act=edit&type=<?php echo $theme_type;?>&theme_id=<?php echo $theme_id; ?>&item_id=<?php echo $item_id;?>" enctype="multipart/form-data">
                     
                            
                            <div class="form-group">
                              <label for="formGroupExampleInput">ID</label>
                              <input type="text" name="training_document_theme_id" class="form-control" value="<?php echo $theme_id; ?>" id="theme_id" readonly>
                            </div>
                            <div class="form-group">
                              <label for="formGroupExampleInput">ID</label>
                              <input type="text" name="training_document_item_id" class="form-control" value="<?php echo $item_id; ?>" id="item_id" readonly>
                            </div>
                            <div class="form-group">
                              <label for="formGroupExampleInput">Current Item Name</label>
                              <input type="text" name="training_document_item_name_old" class="form-control" value="<?php echo $item_name; ?>" id="current_item" readonly>
                            </div>
                            <div class="form-group">
                              <label for="formGroupExampleInput">New Item Name</label>
                              <input type="text" name="training_document_item_name_new" class="form-control" id="new_item">
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
                      
        <!--<embed src="<?php echo $old_path;?>" width="800px" height="2100px" /> -->
        <!--    <div id="example1" style="height: 80vh; width: 80vw;"></div>-->
      <!--  <iframe src="http://docs.google.com/gview?url=http://<?php echo $_SERVER['HTTP_HOST'];?>/user_management/<?php echo $old_path; ?>&embedded=true" style="width:608px; height:700px;" frameborder="0"></iframe>-->
        <!--<iframe src="<?php echo $old_path; ?>" width="100%" height="200px">
    </iframe>
        -->
    <iframe src="<?php echo $old_path; ?>" width="100%" height="200px">
    </iframe>
           <label for="formGroupExampleInput">Select English</label>
            <div class="file-loading">
         <input id="kv-explorer" name="file_name" type="file" multiple>
      </div>
      <iframe src="<?php echo $old_path2; ?>" width="100%" height="200px">
    </iframe>
      <label for="formGroupExampleInput">Select German</label>
            <div class="file-loading">
         <input id="kv-explorer2" name="file_name2" type="file" multiple>
      </div>
      <iframe src="<?php echo $old_path3; ?>" width="100%" height="200px">
    </iframe>
      <label for="formGroupExampleInput">Select Polish</label>
            <div class="file-loading">
         <input id="kv-explorer3" name="file_name3" type="file" multiple>
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
        $(document).ready(function() {
    $('#example-getting-started').multiselect();
  });
        /*
         $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
         alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
         });
         */
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfobject/2.1.1/pdfobject.min.js"></script>
<script>PDFObject.embed("http://<?php echo $_SERVER['HTTP_HOST'];?>/user_management/<?php echo $old_path; ?>", "#example1");</script>
</body>

</html>
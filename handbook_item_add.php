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
    
    
    if (isset($_POST["training_document_theme_id"])) {  $theme_id = $_POST["training_document_theme_id"]; } 
    if (isset($_POST["training_document_item_id"])) {  $item_id = $_POST["training_document_item_id"]; } 
    if (isset($_POST["training_document_item_name_old"])) {  $item_name_old = trim($_POST["training_document_item_name_old"]); }
    if (isset($_POST["training_document_item_name_new"])) {  $item_name_new = trim($_POST["training_document_item_name_new"]); }
    if (isset($_POST["training_document_item_name_new_de"])) {  $item_name_new_de = trim($_POST["training_document_item_name_new_de"]); }
    if (isset($_POST["training_document_item_name_new_pol"])) {  $item_name_new_pol = trim($_POST["training_document_item_name_new_pol"]); }
    
    $group_id_array=array();
      foreach ($_POST['group_id'] AS $key => $value) {
        array_push($group_id_array,$value);
      }
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
                
                if ($file_dst_path != "" || $file_dst_path2 != ""  || $file_dst_path3 != "") {
                    
                    $sql = "insert into media (name,name2,name3,type,path,iconpath,themeid,path2,iconpath2,path3,iconpath3,access_group) values ('".$item_name_new."','".$item_name_new_de."','".$item_name_new_pol."','handbook','".$file_dst_path."','".$icon_dst_path."',".$theme_id.",'".$file_dst_path2."','".$icon_dst_path2."','".$file_dst_path3."','".$icon_dst_path3."','{".implode(',',$group_id_array)."}')";
                    $db_result = pg_query($db_connection, $sql);
                    
                    if($db_result) {
                        if(move_uploaded_file($file_src_path, $homebase_path.$file_dst_path)){
                         $source = $homebase_path.$file_dst_path;
                       $target = $homebase_path.$icon_dst_path;
 
                       // for english pdf thumnail
                     
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
                       }
                        if(move_uploaded_file($file_src_path2, $homebase_path.$file_dst_path2)){
                         $source2 = $homebase_path.$file_dst_path2;
                       $target2 = $homebase_path.$icon_dst_path2;
 
                       // for german pdf thumnail
                       
                        $img = new Imagick();               
                        $img->readImage($source2."[0]");                
                        $img->setimageformat('jpeg');
                        $img->setImageUnits(imagick:: RESOLUTION_PIXELSPERINCH);                
                        $img->setImageCompression(imagick::COMPRESSION_JPEG); 
                        $img->setImageCompressionQuality(90);                
                        $img->setImageAlphaChannel(Imagick::VIRTUALPIXELMETHOD_WHITE); // for white background in pdf
                        $img->scaleImage(256, 256,true);
                        $img->writeImage($target2);
                        $img->clear();
                        $img->destroy();
                        }
                         if(move_uploaded_file($file_src_path3, $homebase_path.$file_dst_path3)){
                         $source3 = $homebase_path.$file_dst_path3;
                       $target3 = $homebase_path.$icon_dst_path3;
 
                       // for polish pdf thumnail
                       
                        $img = new Imagick();               
                        $img->readImage($source3."[0]");                
                        $img->setimageformat('jpeg');
                        $img->setImageUnits(imagick:: RESOLUTION_PIXELSPERINCH);                
                        $img->setImageCompression(imagick::COMPRESSION_JPEG); 
                        $img->setImageCompressionQuality(90);                
                        $img->setImageAlphaChannel(Imagick::VIRTUALPIXELMETHOD_WHITE); // for white background in pdf
                        $img->scaleImage(256, 256,true);
                        $img->writeImage($target3);
                        $img->clear();
                        $img->destroy();
                        }
                        pg_free_result($db_result);
                        
                    }
                    
                } else {
                    
                  $sql = "insert into media (name,themeid) values ('".$item_name_new."',".$theme_id.")";
                    $db_result = pg_query($db_connection, $sql);
                    
                    if ($db_result) {
                       // echo "success";
                        pg_free_result($db_result);
                        
                       // header("location: handbook_list.php");
                    }
                    
                }                 
             //  header("location: handbook_list.php?theme_id=".$theme_id."&type=handbook&lang='".detect_language()."'"); 
                
            } else {
                
                // do nothing
    //header("location: handbook_list.php?theme_id=".$theme_id."&type=handbook&lang='".detect_language()."'");
                
            }
    //header("location: handbook_list.php?theme_id=".$theme_id."&type=handbook&lang='".detect_language()."'");
    header("location: handbook_list.php?theme_id=".$theme_id."&type=handbook");//correct
        }
        
        
        
        pg_close($db_connection);
    //    header("location: handbook_list.php?theme_id=".$theme_id."&type=handbook&lang='".detect_language()."'");
       // header("location: handbook_list.php");
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
                <a style="1px solid #000000; padding: 0 5px" href="home.php?app=default&lang=<?php echo detect_language(); ?> ">Home</a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="training_list.php?app=default&lang=<?php echo detect_language(); ?>"><?php echo $_training;?></a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="handbook_list.php?theme_id=<?php echo $theme_id;?>&type=handbook"><?php echo ' '.$_manual.'- '.$theme_name.'';?></a>
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




      <div class="container">
              <form method="POST" action="handbook_item_add.php?act=add&theme_id=<?php echo $theme_id; ?>&lang=<?php echo detect_language(); ?>" enctype="multipart/form-data">

<input type="text" name="training_document_theme_id" value="<?php echo $theme_id; ?>" readonly="true" style="display:none">

      <!-- <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="training_document_item_id" class="form-control" id="theme_id" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">Current Item Name</label>
                  <input type="text" name="training_document_item_name_old" class="form-control"  id="current_theme" readonly>
                </div> -->
                <div class="form-group">
                  <label for="formGroupExampleInput"><?php echo $_title;?>-En</label>
         <input type="text" name="training_document_item_name_new" class="form-control" id="new_theme">
                </div> 
                <div class="form-group">
                  <label for="formGroupExampleInput"><?php echo $_title;?>-De</label>
         <input type="text" name="training_document_item_name_new_de" class="form-control" id="new_theme_de">
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput"><?php echo $_title;?>-Pl</label>
         <input type="text" name="training_document_item_name_new_pol" class="form-control" id="new_theme_pol">
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
<label for="formGroupExampleInput">Select English</label>
            <div class="file-loading">
         <input id="kv-explorer" name="file_name" type="file" >
      </div>
      <label for="formGroupExampleInput">Select Deutsch</label>
            <div class="file-loading">
         <input id="kv-explorer2" name="file_name2" type="file" >
      </div>
      <label for="formGroupExampleInput">Select Polish</label>
            <!-- <div class="file-loading"> -->
                <div>
         <input id="kv-explorer3" name="file_name3" type="file" >
      </div>

              <div id="loader" style="display: none;" class="loader"></div>  
              <div id="upload-progress"><div class="progress-bar"></div></div> <!-- Progress bar added -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.history.go(-1); return false;"><?php echo $_close;?></button>
                  <input type="submit" class="btn btn-primary" value=<?php echo $_add;?>>
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
            showUpload:false,
        });
                $("#kv-explorer2").fileinput({
            'theme': 'explorer-fas',
            //'uploadUrl': '#',
            overwriteInitial: false,
            initialPreviewAsData: true,
            showUpload:false,
        });
                        $("#kv-explorer3").fileinput({
            'theme': 'explorer-fas',
            //'uploadUrl': '#',
            overwriteInitial: false,
            initialPreviewAsData: true,
            showUpload:false,
        });
        /*
         $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
         alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
         });
         */
    });
//     $(document).ready(function() 
// {
//     $('#loader').hide();

//     $('form').submit(function() 
//     {
//         $('#loader').show();
//     }) 
// });
$("#my_form").submit(function(event){
    event.preventDefault(); //prevent default action .
    $('#loader').show();
    var post_url = $(this).attr("action"); //get form action url
    var request_method = $(this).attr("method"); //get form GET/POST method
    var form_data = new FormData(this); //Encode form elements for submission
    
    $.ajax({
        url : post_url,
        type: request_method,
        data : form_data,
		contentType: false,
		processData:false,
		xhr: function(){
		//upload Progress
		var xhr = $.ajaxSettings.xhr();
		if (xhr.upload) {
			xhr.upload.addEventListener('progress', function(event) {
				var percent = 0;
				var position = event.loaded || event.position;
				var total = event.total;
				if (event.lengthComputable) {
					percent = Math.ceil(position / total * 100);
				}
				//update progressbar
				$("#upload-progress .progress-bar").css("width", + percent +"%");
			}, true);
		}
		return xhr;
	}
    }).done(function(response){ //
        $('#loader').hide();
        $('#upload-progress .progress-bar').hide();
        $("#server-results").html(response);
    });
});     
</script>

</body>

</html>
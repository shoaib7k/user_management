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

if($_GET['act']=='add'){
   
function fn_training_item_video_change_send($_theme_id, $_item_id, $_item_name_old, $_item_name_new, $_src_path, $_dst_path, $_icn_path ) {
    include 'db_connect.php';
   // global $_homebase_path;
//echo "at fucntion";
     $_homebase_path="";
    
    //$db_connection = pg_connect("host=localhost port=5432 dbname=Intranet user=postgres password=postgres");
  
    if ($db_connection) {
     
        if ($_item_id != "") { // update item
            
            if ($_dst_path != "") { // delete stored file
                
                $_sql = "select path, iconpath from media where id = ".$_item_id;
                
                $_db_result = pg_query($db_connection, $_sql);
                
                if ($_db_result) {
                    
                    $_db_recordcount = pg_num_rows($_db_result);
                    
                    if ($_db_recordcount > 0) {
                        
                        $_db_record = pg_fetch_array($_db_result, 0, PGSQL_BOTH );
                        
                        $_old_path = $_db_record["path"];
                        $_old_iconpath = $_db_record["iconpath"];
                        
                        unlink($_homebase_path.$_old_path);
                        unlink($_homebase_path.$_old_iconpath);
                        
                    }
                    
                    pg_free_result($_db_result);
                    
                }
                
            }
            
            if ($_item_name_new != "") {
            
                if ($_dst_path != "") {
                    
                    $_sql = "update media set name = '".$_item_name_new."', path = '".$_dst_path."', iconpath = '".$_icn_path."' where id = ".$_item_id;
                    $_db_result = pg_query($db_connection, $_sql);
                    
                    if($_db_result) {
                        move_uploaded_file($_src_path, $_homebase_path.$_dst_path);
                        
                        $source = $_homebase_path.$_dst_path;
                        $target = $_homebase_path.$_icn_path;

                        $_cmd = 'mediainfo --Inform="General;%Duration%" '.$source;
                        $_video_duration = shell_exec($_cmd);

                        $_video_full_seconds = intdiv($_video_duration,2000);  // always take a pic from the middle of the video
                        $_video_full_minutes = intdiv($_video_full_seconds,60);
                        $_video_seconds = $_video_full_seconds - $_video_full_minutes * 60;
                        $_video_hours = intdiv($_video_full_minutes,60);
                        $_video_minutes = $_video_full_minutes - $_video_hours * 60;

                        if ($_video_seconds < 10) { $_video_seconds_str = "0".$_video_seconds; } else { $_video_seconds_str = $_video_seconds;}
                        if ($_video_minutes < 10) { $_video_minutes_str = "0".$_video_minutes; } else { $_video_minutes_str = $_video_seconds;}
                        if ($_video_hours < 10) { $_video_hours_str = "0".$_video_hours; } else { $_video_hours_str = $_video_seconds;}

                        $_video_time_duration = $_video_hours_str.":".$_video_minutes_str.":".$_video_seconds_str;

                        shell_exec("ffmpeg -ss ".$_video_time_duration." -i ".$source." -vf scale=256:-1 -vframes 1 -q:v 2 ".$target);
                        
                        pg_free_result($_db_result);
                        
                    }
                    
                } else {
                    
                    $_sql = "update media set name = '".$_item_name_new."' where id = ".$_item_id;
                    $_db_result = pg_query($db_connection, $_sql);
                    
                    if ($_db_result) {
                        
                        pg_free_result($_db_result);
                        
                    }
                    
                }
                
            } else {
                
                if ($_dst_path != "") {
                    
                    $_sql = "update media set path = '".$_dst_path."', iconpath = '".$_icn_path."' where id = ".$_item_id;
                    $_db_result = pg_query($db_connection, $_sql);
                    if($_db_result) {
                        move_uploaded_file($_src_path, $_homebase_path.$_dst_path);
                        
                        $source = $_homebase_path.$_dst_path;
                        $target = $_homebase_path.$_icn_path;

                        $_cmd = 'mediainfo --Inform="General;%Duration%" '.$source;
                        $_video_duration = shell_exec($_cmd);

                        $_video_full_seconds = intdiv($_video_duration,2000);  // always take a pic from the middle of the video
                        $_video_full_minutes = intdiv($_video_full_seconds,60);
                        $_video_seconds = $_video_full_seconds - $_video_full_minutes * 60;
                        $_video_hours = intdiv($_video_full_minutes,60);
                        $_video_minutes = $_video_full_minutes - $_video_hours * 60;

                        if ($_video_seconds < 10) { $_video_seconds_str = "0".$_video_seconds; } else { $_video_seconds_str = $_video_seconds;}
                        if ($_video_minutes < 10) { $_video_minutes_str = "0".$_video_minutes; } else { $_video_minutes_str = $_video_seconds;}
                        if ($_video_hours < 10) { $_video_hours_str = "0".$_video_hours; } else { $_video_hours_str = $_video_seconds;}

                        $_video_time_duration = $_video_hours_str.":".$_video_minutes_str.":".$_video_seconds_str;

                        shell_exec("ffmpeg -ss ".$_video_time_duration." -i ".$source." -vf scale=256:-1 -vframes 1 -q:v 2 ".$target);
                        
                        pg_free_result($_db_result);
                
                    }
                    
                } else {
                    
                    // do nothing
                    
                }
                
            }
                    
            
            
        } else { // new item
            
             if ($_item_name_new != "") { // no record without item name
                
                if ($_dst_path != "") {
                    $group_id_array=array();
      foreach ($_POST['group_id'] AS $key => $value) {
        array_push($group_id_array,$value);
      }
                   $_sql = "insert into media (name,type,path,iconpath,themeid,access_group) values ('".$_item_name_new."','video','".$_dst_path."','".$_icn_path."',".$_theme_id.",'{".implode(',',$group_id_array)."}')";
                    $_db_result = pg_query($db_connection, $_sql);
                    
                    if($_db_result) {
                        move_uploaded_file($_src_path, $_homebase_path.$_dst_path);
                        
                        $source = $_homebase_path.$_dst_path;
                        $target = $_homebase_path.$_icn_path;

                        $_cmd = 'mediainfo --Inform="General;%Duration%" '.$source;
                        $_video_duration = shell_exec($_cmd);

                        $_video_full_seconds = intdiv($_video_duration,2000);  // always take a pic from the middle of the video
                        $_video_full_minutes = intdiv($_video_full_seconds,60);
                        $_video_seconds = $_video_full_seconds - $_video_full_minutes * 60;
                        $_video_hours = intdiv($_video_full_minutes,60);
                        $_video_minutes = $_video_full_minutes - $_video_hours * 60;

                        if ($_video_seconds < 10) { $_video_seconds_str = "0".$_video_seconds; } else { $_video_seconds_str = $_video_seconds;}
                        if ($_video_minutes < 10) { $_video_minutes_str = "0".$_video_minutes; } else { $_video_minutes_str = $_video_seconds;}
                        if ($_video_hours < 10) { $_video_hours_str = "0".$_video_hours; } else { $_video_hours_str = $_video_seconds;}

                        $_video_time_duration = $_video_hours_str.":".$_video_minutes_str.":".$_video_seconds_str;

                        shell_exec("ffmpeg -ss ".$_video_time_duration." -i ".$source." -vf scale=256:-1 -vframes 1 -q:v 2 ".$target);
                        
                        pg_free_result($_db_result);
                        
                    }
                    
                } else {
                    
                    $_sql = "insert into media (name,themeid) values ('".$_item_name_new."',".$_theme_id.")";
                    $_db_result = pg_query($db_connection, $_sql);
                    
                    if ($_db_result) {
                        
                        pg_free_result($_db_result);
                        
                    }
                    
                }                 
                
                
            } else {
                
                // do nothing
                
            }
            
            
        }
        
        pg_close($db_connection);
        
    }
    
}
global $_homebase_path;
$_homebase_path="";
   // echo "at act add";
    $_theme_id = "";
    $_item_id = "";
    $_item_name_old = "";
    $_item_name_new = "";   
    
    $_file_src_path = "";
    $_file_dst_path = "";
    $_icon_dst_path = "";
    
   // require "training/training_items_video_change_send.php";
    
    if (isset($_POST["training_video_theme_id"])) { $_theme_id = $_POST["training_video_theme_id"]; } 
    if (isset($_POST["training_video_item_id"])) { $_item_id = $_POST["training_video_item_id"]; } 
    if (isset($_POST["training_video_item_name_old"])) { $_item_name_old = trim($_POST["training_video_item_name_old"]); }
    if (isset($_POST["training_video_item_name_new"])) { $_item_name_new = trim($_POST["training_video_item_name_new"]); }
    
    if (isset($_FILES['file_name'])) {
        
        $_file_path = $_FILES["file_name"]["name"];
        $_file_ext = pathinfo($_file_path, PATHINFO_EXTENSION);   
        
        
        $_file_types = array('video/mp4','video/avi');

        if (in_array($_FILES['file_name']['type'], $_file_types)) {

            $_file_src_path = $_FILES["file_name"]["tmp_name"];

            $_file_dst_path_without_suffix = "training/videos/".md5(uniqid(rand(), TRUE));
            $_file_dst_path = $_file_dst_path_without_suffix.".".$_file_ext; // create unique file name
            $_icon_dst_path = $_file_dst_path_without_suffix.".jpg";

        }
        
    }
    
    fn_training_item_video_change_send($_theme_id, $_item_id, $_item_name_old, $_item_name_new, $_file_src_path, $_file_dst_path, $_icon_dst_path );
}
?>


<?php include 'left_menu.php'; ?>

<div role="main" class="main-content">

  <div class="page-content container container-plus">
    <!-- page header and toolbox -->
    <div class="page-header pb-2">
    <nav class="breadcrumb">
    <a style="1px solid #000000; padding: 0 5px" href="home.php?app=default&lang=<?php echo detect_language(); ?>">Home</a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="training_list.php?app=default&lang=<?php echo detect_language(); ?>"><?php echo $_training;?></a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="video_list.php?theme_id=<?php echo $theme_id;?>&type=handbook"><?php echo $theme_name;?> </a>
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active">Video </a>
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active"><?php echo $_add?> </a>
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
              <form method="POST" id=my_form action="video_item_add.php?act=add&theme_id=<?php echo $theme_id; ?>&type=video" enctype="multipart/form-data">

<input type="text" name="training_video_theme_id" value="<?php echo $theme_id; ?>" readonly="true" style="display:none">

      <!-- <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="training_video_item_id" class="form-control" id="theme_id" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput"><?php echo $_current_item_name;?></label>
                  <input type="text" name="training_video_item_name_old" class="form-control"  id="current_theme" readonly>
                </div> -->
                <div class="form-group">
                  <label for="formGroupExampleInput"><?php echo $_title;?></label>
         <input type="text" name="training_video_item_name_new" class="form-control" id="new_theme">
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
            <div class="file-loading">
         <input id="kv-explorer" name="file_name" type="file" >
      </div>
 
      <div id="loader" style="display: none;" class="loader" ></div>
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
            'uploadUrl': '#',
            overwriteInitial: false,
            initialPreviewAsData: true,
            showUpload: false,
            fileActionSettings : {
// Disable
 showUpload : false,
showRemove:false,
},
 
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
<?php
//session_start();
include('paginator.class.php');
?>
<?php
include 'db_connect.php';
?>
<?php
$parent_id = $_GET['forms_id'];
$theme_id = $_GET['forms_id'];
$forms_item_id = $_GET['forms_item_id'];   
$redirect_from = $_GET['origin'];    
if ($redirect_from >= $forms_item_id)
$redirect_from = 1;
?>
<?php
        $sql = "select name,access_group from forms where id = ".$forms_item_id;
        
        $db_result = pg_query($db_connection, $sql);
        
        if ($db_result) {
            
            $db_row_count = pg_num_rows($db_result);
            
            if ($db_row_count > 0) {
                
                $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH );
                
                $item_name = $db_record["name"];
                $access_group=$db_record["access_group"];
        $access_group_substring=substr($access_group,1,-1);
        $access_group_explode=explode(',',$access_group_substring);
                                
            }            
        }
        ?>
        <?php
if ($_GET['act'] == 'edit') {
    global $homebase_path;
    $homebase_path="";
    if (isset($_POST["template_document_theme_id"])) {  $forms_id = $_POST["template_document_theme_id"]; } 
    if (isset($_POST["template_document_item_id"])) {  $item_id = $_POST["template_document_item_id"]; } 
    if (isset($_POST["template_document_item_name_old"])) {  $item_name_old = trim($_POST["template_document_item_name_old"]); }
    if (isset($_POST["template_document_item_name_new"])) {  $item_name_new = trim($_POST["template_document_item_name_new"]); }
    $group_id_array=array();
      foreach ($_POST['group_id'] AS $key => $value) {
        array_push($group_id_array,$value);
      }
   if ($item_name_new!="") {
        
        $item_name = $item_name_new;
        
    } else {
        
        $item_name = $item_name_old;
        
    }
        if (isset($_FILES['file_name'])) {
                
        $file_path = $_FILES["file_name"]["name"];
        $file_ext = pathinfo($file_path, PATHINFO_EXTENSION);
     
        /*
        echo "<br>";
        echo $_FILES["file_name"]["type"];
        echo "<br>";
         * 
         */
        
       $file_types = array('application/pdf','application/msexcel', 'application/octet-stream','application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/msword');

       if (in_array($_FILES['file_name']['type'], $file_types)) {

            $file_src_path = $_FILES["file_name"]["tmp_name"];

            $file_dst_path_without_suffix = "forms/".md5(uniqid(rand(), TRUE));
            $file_dst_path = $file_dst_path_without_suffix.".".$file_ext; // create unique file name
            $icon_dst_path = $file_dst_path_without_suffix.".jpg";

        } 
        else {

           $file_src_path = "";
           $file_dst_path = "";

        }
      }

    
    
    if ($db_connection) {
  
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
            
            if ($_FILES['file_name']['size'] !== 0){
            $sql = "update forms set name = '".$item_name."', path = '".$file_dst_path."', iconpath = '".$icon_dst_path."', timestamp = localtimestamp, access_group='{".implode(',',$group_id_array)."}' where id = ".$item_id;
            $db_result = pg_query($db_connection, $sql);
        
            pg_free_result($db_result);
                
            move_uploaded_file($file_src_path, $homebase_path.$file_dst_path);
            
            //please unhide below two lines for preview
           require 'converter_for_documents.php';
           convert_document($homebase_path.$file_dst_path);
            
            pg_close($db_connection);
            // header("location: forms_item_list.php?forms_id=".$parent_id."&forms_item_id=1");      
          }else{
            $sql = "update forms set name = '".$item_name."', timestamp = localtimestamp, access_group='{".implode(',',$group_id_array)."}' where id = ".$item_id;
            
  
        
        $db_result = pg_query($db_connection, $sql);
        
        pg_free_result($db_result);
            
      //   move_uploaded_file($file_src_path, $homebase_path.$file_dst_path);
        
      //   //please unhide below two lines for preview
      //  require 'converter_for_documents.php';
      //  convert_document($homebase_path.$file_dst_path);
        
        pg_close($db_connection);
//  header("location: forms_item_list.php?forms_id=".$parent_id."&forms_item_id=1");      
          } 
    }
 
}

//header("location: forms_item_list.php?forms_id=".$parent_id."&forms_item_id=1");
 

?>

<?php include 'left_menu.php'; ?>

<div role="main" class="main-content">

  <div class="page-content container container-plus">
    <!-- page header and toolbox -->
    <div class="page-header pb-2">
    <nav class="breadcrumb">
                <a style="1px solid #000000; padding: 0 5px" href="home.php">Home</a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="template_list.php?app=default&lang=<?php echo detect_language(); ?>"><?php echo $_templates;?></a>
                <?php      
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
      ?>
                
                <?php $query3 = pg_query("Select theme from forms where id=" . $parent_id . "");
                while ($parents = pg_fetch_array($query3)) { ?>

                    <!-- <a style="1px solid #000000; padding: 0 5px" href=<?php echo $_SERVER['HTTP_REFERER']; ?>> <?php echo $parents["theme"];//leaf ?></a>  -->

                <?php
                    // $arr=array();
                    // if(!array_key_exists($forms_item_id, $_SESSION['m'])){
                    // $_SESSION['m'] += [$forms_item_id => $redirect_from];
                    // }
                    // else{
                    //     foreach($subarray as $_SESSION['m'] ){
                    //         if(isset($subarray[$redirect_from])){
                    //             $redirect_from=$subarray[$redirect_from];
                    //         }
                    //     }
                    // }
                  //  print_r($_SESSION['m']);
                  //   array_push($_SESSION['m'], [$forms_item_id=>$redirect_from]);
                  //   print_r($_SESSION['m']);
                  //  echo ".$forms_id.' '.$forms_item_id.' '.$redirect_from. ' '.$_SESSION[m]";
                } ?>
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active"><?php echo $_edit;?> </a>
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
              <form method="POST" id="my_form" action="forms_item_edit.php?act=edit&forms_id=<?php echo $parent_id; ?>&forms_item_id=<?php echo $forms_item_id?>" enctype="multipart/form-data">

<input type="text" name="template_document_theme_id" value="<?php echo $forms_id; ?>" readonly="true" style="display:none">

      <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="template_document_item_id" class="form-control" id="theme_id" value="<?php echo $forms_item_id;?>" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput"><?php echo $_current_item_name;?></label>
                  <input type="text" name="template_document_item_name_old" class="form-control"  id="current_theme" value="<?php echo $item_name; ?>" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput"><?php echo $_new_item_name;?></label>
         <input type="text" name="template_document_item_name_new" class="form-control" id="new_theme">
                </div>
                <div class="form-group">
                            <label for="group_add"><?php echo $_select_group_for_access;?></label>     
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
   <!-- <iframe src="<?php if(strpos($item_path, '.docx') || strpos($item_path, '.doc') !== false) { echo "http://docs.google.com/gview?url=".$_SERVER['HTTP_HOST']."".$item_path."" ; } else {echo $item_path;} ?>" width="100%" height="200px">
    </iframe> -->
<label for="formGroupExampleInput"></label>
            <!-- <div class="file-loading"> -->
              <div>
         <input id="kv-explorer" name="file_name" type="file">
      </div>
                
    <div id="loader" style="display: none;" class="loader"></div>
    <div id="upload-progress"><div class="progress-bar"></div></div> <!-- Progress bar added -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo $_close;?></button>
                  <input type="submit" class="btn btn-primary" value=<?php echo $_update;?>>
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
            showUpload: false,
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
        //window.location.href=form_item_list?forms_id=".$parent_id."&forms_item_id=1;
    });
});     
</script>

</body>

</html>
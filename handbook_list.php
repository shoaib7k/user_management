<?php
session_start();
include('paginator.class.php');
?>
<?php
include 'db_connect.php';
?>
<?php
$lang="en";
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
$theme_id = $_GET['theme_id'];
$item_id = $_GET['item_id'];
$theme_type = $_GET['type'];
if ($_GET['act'] == 'delete') {
    //$id=$_GET['theme_id'];
    $sql2 = "DELETE from media where  id=" . $item_id . "";
    $db_result2 = pg_query($db_connection, $sql2);
    if ($db_result2) {
        pg_free_result($db_result2);
        header("location: handbook_list.php?theme_id=" . $theme_id . "&type=" . $theme_type . "");
    }
}
if ($db_connection) {

    // prepare title
    $theme_name = "Thema nicht vorhanden.";
    $type_name = "Typ unbekannt.";

    if ($theme_type == "handbook") {
        $type_name = "Handbücher";
    }
    if ($theme_type == "video") {
        $type_name = "Videos";
    }


    $sql = "select theme from media where id = " . $theme_id;

    $db_result = pg_query($db_connection, $sql);

    if ($db_result) {

        $db_recordcount = pg_num_rows($db_result);

        if ($db_recordcount > 0) {

            $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH);

            $theme_name = $db_record["theme"];
        }

        pg_free_result($db_result);
    }
}
// write title

?>
<?php

if ($_GET['act'] == 'add') {
    $theme_id = "";
    $item_id = "";
    $item_name_old = "";
    $item_name_new = "";

    $file_src_path = "";
    $file_dst_path = "";
    $icon_dst_path = "";


    if (isset($_POST["training_document_theme_id"])) {
        $theme_id = $_POST["training_document_theme_id"];
    }
    if (isset($_POST["training_document_item_id"])) {
        $item_id = $_POST["training_document_item_id"];
    }
    if (isset($_POST["training_document_item_name_old"])) {
        $item_name_old = trim($_POST["training_document_item_name_old"]);
    }
    if (isset($_POST["training_document_item_name_new"])) {
        $item_name_new = trim($_POST["training_document_item_name_new"]);
    }

    if (isset($_FILES['file_name'])) {

        $file_path = $_FILES["file_name"]["name"];
        $file_ext = pathinfo($file_path, PATHINFO_EXTENSION);


        $file_types = array('application/pdf');

        if (in_array($_FILES['file_name']['type'], $file_types)) {

            $file_src_path = $_FILES["file_name"]["tmp_name"];

            $file_dst_path_without_suffix = "training/documents/" . md5(uniqid(rand(), TRUE));
            $file_dst_path = $file_dst_path_without_suffix . "." . $file_ext; // create unique file name
            $icon_dst_path = $file_dst_path_without_suffix . ".jpg";
        }
    }
    global $homebase_path;
    $homebase_path = "/var/www/webtest5/";

    if ($db_connection) {

        if ($item_id != "") { // update item

            if ($file_dst_path != "") { // delete stored file

                $sql = "select path, iconpath from media where id = " . $item_id;

                $db_result = pg_query($db_connection, $sql);

                if ($db_result) {

                    $db_recordcount = pg_num_rows($db_result);

                    if ($db_recordcount > 0) {

                        $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH);

                        $old_path = $db_record["path"];
                        $old_iconpath = $db_record["iconpath"];

                        unlink($homebase_path . $old_path);
                        unlink($homebase_path . $old_iconpath);
                    }

                    pg_free_result($db_result);
                }
            }

            if ($item_name_new != "") {

                if ($file_dst_path != "") {

                    $sql = "update media set name = '" . $item_name_new . "', path = '" . $file_dst_path . "', iconpath = '" . $icon_dst_path . "' where id = " . $item_id;
                    $db_result = pg_query($db_connection, $sql);

                    if ($db_result) {
                        move_uploaded_file($file_src_path, $homebase_path . $file_dst_path);

                        $source = $homebase_path . $file_dst_path;
                        $target = $homebase_path . $icon_dst_path;

                        $img = new Imagick();
                        $img->readImage($source . "[0]");
                        $img->setimageformat('jpeg');
                        $img->setImageUnits(imagick::RESOLUTION_PIXELSPERINCH);
                        $img->setImageCompression(imagick::COMPRESSION_JPEG);
                        $img->setImageCompressionQuality(90);
                        $img->setImageAlphaChannel(Imagick::VIRTUALPIXELMETHOD_WHITE); // for white background in pdf
                        $img->scaleImage(256, 256, true);
                        $img->writeImage($target);
                        $img->clear();
                        $img->destroy();

                        pg_free_result($db_result);
                    }
                } else {

                    $sql = "update media set name = '" . $item_name_new . "' where id = " . $item_id;
                    $db_result = pg_query($db_connection, $sql);

                    if ($db_result) {

                        pg_free_result($db_result);
                    }
                }
            } else {

                if ($file_dst_path != "") {

                    $sql = "update media set path = '" . $file_dst_path . "', iconpath = '" . $icon_dst_path . "' where id = " . $item_id;
                    $db_result = pg_query($db_connection, $sql);
                    if ($db_result) {
                        move_uploaded_file($file_src_path, $homebase_path . $file_dst_path);

                        $source = $homebase_path . $file_dst_path;
                        $target = $homebase_path . $icon_dst_path;

                        $img = new Imagick();
                        $img->readImage($source . "[0]");
                        $img->setimageformat('jpeg');
                        $img->setImageUnits(imagick::RESOLUTION_PIXELSPERINCH);
                        $img->setImageCompression(imagick::COMPRESSION_JPEG);
                        $img->setImageCompressionQuality(90);
                        $img->setImageAlphaChannel(Imagick::VIRTUALPIXELMETHOD_WHITE); // for white background in pdf
                        $img->scaleImage(256, 256, true);
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

                    $sql = "insert into media (name,type,path,iconpath,themeid) values ('" . $item_name_new . "','handbook','" . $file_dst_path . "','" . $icon_dst_path . "'," . $theme_id . ")";
                    $db_result = pg_query($db_connection, $sql);

                    if ($db_result) {
                        move_uploaded_file($file_src_path, $homebase_path . $file_dst_path);

                        $source = $homebase_path . $file_dst_path;
                        $target = $homebase_path . $icon_dst_path;

                        $img = new Imagick();
                        $img->readImage($source . "[0]");
                        $img->setimageformat('jpeg');
                        $img->setImageUnits(imagick::RESOLUTION_PIXELSPERINCH);
                        $img->setImageCompression(imagick::COMPRESSION_JPEG);
                        $img->setImageCompressionQuality(90);
                        $img->setImageAlphaChannel(Imagick::VIRTUALPIXELMETHOD_WHITE); // for white background in pdf
                        $img->scaleImage(256, 256, true);
                        $img->writeImage($target);
                        $img->clear();
                        $img->destroy();

                        pg_free_result($db_result);
                    }
                } else {

                    $sql = "insert into media (name,themeid) values ('" . $item_name_new . "'," . $theme_id . ")";
                    $db_result = pg_query($db_connection, $sql);

                    if ($db_result) {

                        pg_free_result($db_result);
                    }
                }
            } else {

                // do nothing

            }
        }



        pg_close($db_connection);
    }
}

//}

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
                <a style="1px solid #000000; padding: 0 5px" class=" active">Handbook List</a>
            </nav>
        </div>
        <?php
        // if ($_SESSION['user_type'] == 'U') {
        //     echo '<div class="alert d-flex bgc-red-l3 brc-success-m4 border-0 p-0" role="alert">
        //               <div class="bgc-red px-3 py-1 text-center radius-l-1">
        //                 <span class="fa-2x text-white">
        //         ⚠ <!-- &#9888; -->
        //       </span>
        //               </div><span class="ml-3 align-self-center text-dark-tp3 text-110">
        //       You do not have permission to access this page!
        //     </span></div>';
        // } else {
        ?>
        <!-- <div class="mt-4 btn-group btn-group-toggle d-flex d-sm-inline-flex mx-n2 mx-sm-0 is-scrollable nav-tabs-scroll" data-toggle="buttons">
                        <!--<a href="http://<?php echo $_SERVER['SERVER_ADDR'].$_SERVER['PHP_SELF'].'/theme_id='.$theme_id.'&type=handbook'; ?>">-->
                        <!-- <label class="btn px-4 btn-outline-blue <?php echo $ck; ?> border-2 radius-l-round" onclick="window.location='<?php echo $_SERVER['PHP_SELF'].'?theme_id='.$theme_id.'&type=handbook&lang=en'; ?>';" >
                          <input type="radio"  />
                          English
                        </label>
 <label class="btn px-4 btn-outline-blue <?php echo $ck; ?> border-2 radius-l-round" onclick="window.location='<?php echo $_SERVER['PHP_SELF'].'?theme_id='.$theme_id.'&type=handbook&lang=de'; ?>';" >
                          <input type="radio" onclick="window.location='<?php echo $_SERVER['PHP_SELF'].'?theme_id='.$theme_id.'&type=handbook&lang=de'; ?>';"  />
                          German
                        </label>
<label class="btn px-4 btn-outline-blue <?php echo $ck; ?> border-2 radius-l-round" onclick="window.location='<?php echo $_SERVER['PHP_SELF'].'?theme_id='.$theme_id.'&type=handbook&lang=pol'; ?>';" >
                          <input type="radio" onclick="window.location='<?php echo $_SERVER['PHP_SELF'].'?theme_id='.$theme_id.'&type=handbook&lang=pol'; ?>';" />
                          Polish
                        </label>
        </div> --> 
            <div class="text-center mb-4">
                <a href="handbook_item_add.php?theme_id=<?php echo $theme_id; ?>&type=<?php echo $theme_type; ?>" class="btn btn-blue px-45 py-2 text-105 radius-2">
                    <i class="fa fa-pencil-alt mr-1"></i>
                    Add New Item</a>
            </div>

            <div class="container">
                <h1><a href=""> List</a></h1>
                <hr>
                <?php
                $pages = new Paginator;
                $pages->default_ipp = 15;
                $string=implode(',',$_SESSION['user_in_groups']);
                $sql_forms = pg_query("select id,name, path, iconpath,path2,iconpath2,path3,iconpath3 from media where access_group && ARRAY[".$string."] and themeid = " . $theme_id . " and type = '" . $theme_type . "' order by name");
                $pages->items_total = pg_num_rows($sql_forms);
                $pages->mid_range = 9;
                $pages->paginate();
                //echo "SELECT * FROM groups ORDER BY id ASC '".$pages->limit."'";
                //echo $pages->limit;
                $result = pg_query("select id,name, path, iconpath,path2,iconpath2,path3,iconpath3 from media where access_group && ARRAY[".$string."] and themeid = " . $theme_id . " and type = '" . $theme_type . "' order by name".$pages->limit."");
                ?>
                <div class="clearfix"></div>
                <div class="row marginTop">
                    <div class="col-sm-12 paddingLeft pagerfwt">
                        <?php if ($pages->items_total > 0) { ?>
                            <?php echo $pages->display_pages(); ?>
                            <?php echo $pages->display_items_per_page(); ?>
                            <?php echo $pages->display_jump_menu(); ?>
                        <?php } ?>
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="clearfix"></div>



                <?php
                if ($pages->items_total > 0) {
                    $n  =   1;
                                            echo '<div class="mt-45 card ccard">';
                    while ($val  =   pg_fetch_array($result)) {
                        $item_id = $val["id"];
                        $item_name = $val["name"];
                        $item_path = $val["path"];
                        $item_icon = $val["iconpath"];
                        $item_path2 = $val["path2"];
                        $item_icon2 = $val["iconpath2"];
                        $item_path3 = $val["path3"];
                        $item_icon3 = $val["iconpath3"];
                        if (empty($item_path2)) {
                            $item_path2=$item_path;
                            //$item_path3=$item_path;
                            $item_icon2=$item_icon;
                            //$item_icon3=$item_icon;
                        }
                        if(empty($item_path3)){
                            $item_path3=$item_path;
                            $item_icon3=$item_icon;
                        }
                        

                ?>


                            <div class="card-header">
                                <h4 class="text-120 mb-0">
                                    <center> <a href="<?php if($lang=="de") { echo $item_path2;  } else if($lang=="pol") { echo $item_path3;  } else { echo $item_path;} ?>" target="_blank" class="training_item_link"><?php echo $item_name; ?></a></center>
                                </h4>
                                <div >                                
                                <img src="<?php if($lang=="de") { echo $item_icon2;  } else if($lang=="pol") { echo $item_icon3;  } else { echo $item_icon;} ?>" alt="preview" class="border border-secondary">
        </div>
                                <div >

                                    <a onClick="return confirm('Are you sure you want to delete item <?php echo $item_name; ?>')" href="handbook_list.php?act=delete&theme_id=<?php echo $theme_id; ?>&item_id=<?php echo $item_id; ?>&type=<?php echo $theme_type; ?>" class="btn btn-primary a-btn-slide-text" type="button">
                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        <span><strong>Delete</strong></span>
                                    </a>
                                    <a href="handbook_item_edit.php?theme_id=<?php echo $theme_id; ?>&type=<?php echo $theme_type; ?>&item_id=<?php echo $item_id; ?>" class="btn btn-primary a-btn-slide-text">
                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                        <span><strong>Edit</strong></span>
                                    </a>
                                </div>
                            </div>

                        <?php
                    }
                    echo "</div>";
                } else { ?>
                        <br>
                        <table>
                            <tr>
                                <td colspan="6" align="center"><strong>No Record(s) Found!</strong></td>
                            </tr>
                        <?php } ?>
                        </table>
                        <div class="clearfix"></div>
                        <br>
                        <div class="row marginTop">
                            <div class="col-sm-12 paddingLeft pagerfwt">
                                <?php if ($pages->items_total > 0) { ?>
                                    <?php echo $pages->display_pages(); ?>
                                    <?php echo $pages->display_items_per_page(); ?>
                                    <?php echo $pages->display_jump_menu(); ?>
                                <?php } ?>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <div class="clearfix"></div>

                        </div>
                        <!--/.container-->
                    <?php
                //}
                    ?>

            </div>

    </div>
</div>
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
        slugCallback: function(filename) {
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
        initialPreviewConfig: [{
                caption: "transport-1.jpg",
                size: 329892,
                width: "120px",
                url: "{$url}",
                key: 1
            },
            {
                caption: "transport-2.jpg",
                size: 872378,
                width: "120px",
                url: "{$url}",
                key: 2
            },
            {
                caption: "transport-3.jpg",
                size: 632762,
                width: "120px",
                url: "{$url}",
                key: 3
            }
        ]
    });
    $("#file-4").fileinput({
        theme: 'fas',
        uploadExtraData: {
            kvId: '10'
        }
    });
    $(".btn-warning").on('click', function() {
        var $el = $("#file-4");
        if ($el.attr('disabled')) {
            $el.fileinput('enable');
        } else {
            $el.fileinput('disable');
        }
    });
    $(".btn-info").on('click', function() {
        $("#file-4").fileinput('refresh', {
            previewClass: 'bg-info'
        });
    });
    /*
     $('#file-4').on('fileselectnone', function() {
     alert('Huh! You selected no files.');
     });
     $('#file-4').on('filebrowse', function() {
     alert('File browse clicked for #file-4');
     });
     */
    $(document).ready(function() {
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
<?php
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);
session_start();
include('paginator.class.php');
?>
<?php
include 'db_connect.php';
?>
<?php
$parent_id = $_GET['forms_id'];
$forms_id = $_GET['forms_id'];

$forms_item_id = $_GET['forms_item_id'];



$redirect_from = $_GET['origin'];

if ($redirect_from >= $forms_item_id)
    $redirect_from = 1;
if(array_key_exists($forms_id,$_SESSION['bc'])){
    foreach($_SESSION['bc'] as $key=>$value){
        if($key>$forms_id){
        array_pop($_SESSION['bc']);
        
        }

       // 
       
    }
    }
     //print_r($_SESSION['bc']);
    else{
        //array_pop($_SESSION['bc']);
        
        $_SESSION['bc']+=[$forms_id => $_SERVER['REQUEST_URI']];
        //header("Refresh:0");
    }
      
if (isset($_GET['act']))
    if ($_GET['act'] == 'delete') {
        //$id=$_GET['theme_id'];
        $sql2 = "DELETE from forms where  id=" . $forms_item_id . "";
        $db_result2 = pg_query($db_connection, $sql2);
        if ($db_result2) {
            pg_free_result($db_result2);
            //  header("location: forms_item_list.php?theme_id=" . $theme_id . "&type=" . $theme_type . "");
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
                <!-- <a style=" 1px solid #000000; padding: 0 5px" href="template_list.php?app=default&lang=<?php echo detect_language(); ?>"><?php echo $_templates;?></a>
                <a>/</a> -->
                <?php
                if ($_GET['forms_item_id'] != 1) {
                    $query2 = pg_query("Select theme from forms where id=" . $forms_item_id . "");
                    while ($parents2 = pg_fetch_array($query2)) {
                ?>

                        <!-- <a style="1px solid #000000; padding: 0 5px" href="forms_item_list.php?forms_id=<?php echo $forms_item_id; ?>&forms_item_id=<?php echo $redirect_from; ?>&origin=<?php echo $redirect_from; ?>"> <?php echo $parents2["theme"]; ?></a> -->
                <?php
                        // if (!empty($parents2["theme"])) {
                        //     echo "/";
                        // }
                    }
                } ?>
            <?php $query3 = pg_query("Select theme from forms where id=" . $parent_id . "");
                while ($parents = pg_fetch_array($query3)) { ?>

                    <!-- <a style="1px solid #000000; padding: 0 5px" class=" active"> <?php echo $parents["theme"];//leaf ?></a>  -->

                <?php
                    // $arr=array();

                    // echo "<br>";
                    // echo "<a>/</a>";
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
            //         if(!array_key_exists($forms_item_id,$_SESSION['bc'])){
            //             $_SESSION['bc']+=[$forms_item_id => $_SERVER['REQUEST_URI']];
            //         }
            //        // print_r($_SESSION['bc']);

            //         foreach($_SESSION['bc'] as $key => $value) {
            //             echo '<a style="1px solid #000000; padding: 0 5px href='.$value.'> kkkkk</a>';
            //    echo  "<a>/</a>";
            //           }



                //print_r($_SESSION['m']);
                //     array_push($_SESSION['m'], [$forms_item_id=>$redirect_from]);
                //     print_r($_SESSION['m']);
                //    echo ".$forms_id.' '.$forms_item_id.' '.$redirect_from. ' '.$_SESSION[m]";
                } ?>
                
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

        <div class="text-center mb-4">
            <a href="template_list_add.php?forms_id=<?php echo $parent_id; ?>&forms_item_id=<?php echo $forms_item_id; ?>&origin=<?php echo $redirect_from; ?>" class="btn btn-blue px-45 py-2 text-105 radius-2">
                <i class="fa fa-pencil-alt mr-1"></i>
                <?php echo $_add_new_folder;?></a>
        </div>

        <div class="text-center mb-4">
            <a href="forms_item_add.php?forms_id=<?php echo $forms_id; ?>&forms_item_id=<?php echo $forms_item_id; ?>" class="btn btn-blue px-45 py-2 text-105 radius-2">
                <i class="fa fa-pencil-alt mr-1"></i>
                <?php echo $_add_new_item;?></a>
        </div>

        <div class="container">
            <h1><a href=""> <?php echo $_list;?></a></h1>
            <hr>
            <?php
            $pages = new Paginator;
            $pages->default_ipp = 15;
            $string = implode(',', $_SESSION['user_in_groups']);
            $sql_forms = pg_query("select id,name,path,iconpath,theme from forms where access_group &&  ARRAY[" . $string . "] and themeid = " . $forms_id . " order by name DESC");
            $pages->items_total = pg_num_rows($sql_forms);
            $pages->mid_range = 9;
            $pages->paginate();
            //echo "SELECT * FROM groups ORDER BY id ASC '".$pages->limit."'";
            //echo $pages->limit;
            $result = pg_query("select id,name,path,iconpath,theme from forms where access_group &&  ARRAY[" . $string . "] and themeid = " . $forms_id . " order by name DESC");
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


            <div class="mt-45 card ccard">
                <?php
                if ($pages->items_total > 0) {
                    $n  =   1;
                    while ($val  =   pg_fetch_array($result)) {
                        $item_id = $val["id"];
                        $item_name = $val["name"];
                        $item_path = $val["path"];
                        $item_icon = $val["iconpath"];
                        $item_theme = $val["theme"];


                ?>


                        <div class="card-header">
                            <?php
                            if ($item_theme == "") {
                                echo '<h4 class="text-120 mb-0">' . $item_name . '
                                   <a href="'.$item_path.'" target="_blank"> <img src="' . $item_icon . '" alt="Icon" style="display:block;" class="border border-secondary">
                                       </a>                                 
                                   </h4>
                                <div >
                                <table class="table table-borderless">
  <tr><td>
                                <a href="' . $item_path . '" target="_blank" class="btn btn-primary a-btn-slide-text">
                                                                        <span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                                                                        <span><strong>'.$_file.'</strong></span>
                                                                  </a></td>';
                            } else {
                                echo '<h4 class="text-120 mb-0">
                     <a href="forms_item_list.php?forms_id=' . $item_id . '&forms_item_id=' . $parent_id . '&origin=' . $forms_item_id . '"  class="training_item_link">' . $item_theme . '</a>
                     </h4>
                     <div>                                
                      <table class="table table-borderless">
                     <tr><td>';
                            }
                            ?>
                            <?php if ($_SESSION['user_type'] == 'A' && $item_theme == "") { ?>
                                <td> <a onClick="return confirm('Are you sure you want to delete item <?php echo $item_name; ?>')" href="forms_item_list.php?act=delete&forms_id=<?php echo $forms_id; ?>&forms_item_id=<?php echo $item_id; ?>" class="btn btn-primary a-btn-slide-text" type="button">
                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        <span><strong><?php echo $_delete;?></strong></span>
                                    </a></td>
                                <td> <a href="forms_item_edit.php?forms_id=<?php echo $forms_id; ?>&forms_item_id=<?php echo $item_id; ?>&origin=<?php echo $forms_item_id;?>" class="btn btn-primary a-btn-slide-text">
                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                        <span><strong><?php echo $_edit;?></strong></span>
                                    </a></td>
                            <?php
                            } ?>
                            <?php if ($_SESSION['user_type'] == 'A' && $item_theme) { ?>
                                <td><a onClick="return confirm('Are you sure you want to delete training data <?php echo $item_name; ?>')" href="template_list.php?act=delete&forms_id=<?php echo $val['id']; ?>" class="btn btn-primary a-btn-slide-text">
                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        <span><strong><?php echo $_delete;?></strong></span>
                                    </a></td>
                                <td><a href="template_list_edit.php?forms_id=<?php echo $item_id; ?>" class="btn btn-primary a-btn-slide-text">
                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                        <span><strong><?php echo $_edit;?></strong></span>
                                    </a></td>
                            <?php
                            } ?>
                            </tr>
                            </table>
                        </div>
            </div>

        <?php
                    }
                } else { ?>
        <br>
        <table>
            <tr>
                <td colspan="6" align="center"><strong>No Record(s) Found!</strong></td>
            </tr>
        <?php } ?>
        </table>
        </div>

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
<?php include 'footer.php'; ?>
</div>



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
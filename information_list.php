<?php
session_start();
include('paginator.class.php');
?>
<?php
include 'db_connect.php';
?>
<?php
$lang="en";

$information_id = $_GET['information_id'];


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

if ($_GET['act'] == 'delete') {
    //$id=$_GET['theme_id'];
    $sql2 = "DELETE from information where  id=" . $information_id . "";
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
               
                <a style="1px solid #000000; padding: 0 5px" class=" active">Information</a>
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
      
            <div class="text-center mb-4">
                <a href="information_item_add.php?app=default&lang=<?php echo $lang ; ?>" class="btn btn-blue px-45 py-2 text-105 radius-2">
                    <i class="fa fa-pencil-alt mr-1"></i>
                    Add New Item</a>
            </div>

            <div class="container">
                <h1><a href=""> List <?php foreach($_SESSION['user_in_groups'] AS $key => $value ) {
  echo "$value"; echo "\n";
}
                // foreach($ss as $_SESSION['user_in_groups'])
                // echo $ss; 
                ?></a></h1>
                <hr>
                <?php
                $pages = new Paginator;
                $pages->default_ipp = 15;
                $string=implode(',',$_SESSION['user_in_groups']);
                $sql_forms = pg_query("select id,titel,inhalt,titel_de,inhalt_de,titel_pol,inhalt_pol from information where access_group && ARRAY[".$string."]");
                $pages->items_total = pg_num_rows($sql_forms);
                $pages->mid_range = 9;
                $pages->paginate();
                //echo "SELECT * FROM groups ORDER BY id ASC '".$pages->limit."'";
                //echo $pages->limit;
                $result = pg_query("select id,titel,inhalt,titel_de,inhalt_de,titel_pol,inhalt_pol from information where access_group && ARRAY[".$string."]".$pages->limit."");
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
                        // $item_name = $val["name"];
                        // $item_path = $val["path"];
                        // $item_icon = $val["iconpath"];
                        // $item_theme= $val["theme"];
                        $item_titel=$val["titel"];
                        $item_inhalt=$val["inhalt"];
                        $item_titel_de=$val["titel_de"];
                        $item_inhalt_de=$val["inhalt_de"];
                        $item_title_pol=$val["titel_pol"];
                        $item_inhalt_pol=$val["inhalt_pol"];
                       

                ?>
              

                            <div class="card-header">
                            <h4 class="text-120 mb-0">
                                    <center><a><?php if($item_titel=="" && $item_title_pol=="") { echo $item_titel_de;  } else if($item_titel_de=="" && $item_titel=="" ) { echo $item_title_pol;  } else { echo $item_titel;} ?></a></center>
                                </h4>
                                <h4 class="text-120 mb-0">
                                    <center><a><?php if($item_titel=="" && $item_title_pol=="") { echo $item_inhalt_de;  } else if($item_titel_de=="" && $item_titel=="" ) { echo $item_inhalt_pol;  } else { echo $item_inhalt_titel;} ?></a></center>
                                </h4>
                  <div>
                               
                                    <a onClick="return confirm('Are you sure you want to delete item?')" href="information_list.php?act=delete&information_id=<?php echo $item_id; ?>" class="btn btn-primary a-btn-slide-text" type="button">
                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        <span><strong>Delete</strong></span>
                                    </a>
                                    <a href="information_item_edit.php?information_id=<?php echo $item_id; ?>" class="btn btn-primary a-btn-slide-text">
                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                        <span><strong>Edit</strong></span>
                                    </a>
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
                }
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
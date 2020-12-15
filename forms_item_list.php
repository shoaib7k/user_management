<?php
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
if ($_GET['act'] == 'delete') {
    //$id=$_GET['theme_id'];
    $sql2 = "DELETE from forms where  id=" . $item_id . "";
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
                <a style=" 1px solid #000000; padding: 0 5px" href="settings.php">Admin</a>
                <a>/</a>
                <a style=" 1px solid #000000; padding: 0 5px" href="training_list.php">Training</a>
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active">Handbook List</a>
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
                <a href="forms_item_add.php?forms_id=<?php echo $forms_id; ?>&forms_item_id=<?php echo $forms_item_id; ?>" class="btn btn-blue px-45 py-2 text-105 radius-2">
                    <i class="fa fa-pencil-alt mr-1"></i>
                    Add New Item</a>
            </div>

            <div class="container">
                <h1><a href=""> List</a></h1>
                <hr>
                <?php
                $pages = new Paginator;
                $pages->default_ipp = 15;
                $sql_forms = pg_query("select id,name,path,iconpath from forms where themeid = ".$forms_id." order by name");
                $pages->items_total = pg_num_rows($sql_forms);
                $pages->mid_range = 9;
                $pages->paginate();
                //echo "SELECT * FROM groups ORDER BY id ASC '".$pages->limit."'";
                //echo $pages->limit;
                $result = pg_query("select id,name,path,iconpath from forms where themeid = ".$forms_id." order by name");
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
                    while ($val  =   pg_fetch_array($result)) {
                        $item_id = $val["id"];
                        $item_name = $val["name"];
                        $item_path = $val["path"];
                        $item_icon = $val["iconpath"];
                       

                ?>
                        <div class="mt-45 card ccard">

                            <div class="card-header">
                                <h4 class="text-120 mb-0">
                                    <center> <a href="<?php echo $item_path; ?>" target="_blank" class="training_item_link"><?php echo $item_name; ?></a></center>
                                </h4>
                                <div >

                                    <a onClick="return confirm('Are you sure you want to delete item <?php echo $item_name; ?>')" href="forms_item_list.php?act=delete&forms_id=<?php echo $forms_id; ?>&forms_item_id=<?php echo $item_id; ?>" class="btn btn-primary a-btn-slide-text" type="button">
                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        <span><strong>Delete</strong></span>
                                    </a>
                                    <a href="forms_item_edit.php?forms_id=<?php echo $forms_id; ?>&forms_item_id=<?php echo $item_id; ?>" class="btn btn-primary a-btn-slide-text">
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
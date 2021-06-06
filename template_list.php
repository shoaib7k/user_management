<?php
session_start();
$_SESSION['menu']='template';
$_SESSION['bc']=[];
include('paginator.class.php');
?>
<?php
include 'db_connect.php';
?>
<?php
$parent_id=NULL;
$lang = "en";


if (isset($_GET['lang'])) {
    if ($_GET['lang'] == "en") {
        $ck = "checked";
    } else if ($_GET['lang'] == "de") {
        $ck2 = "checked";
        $lang = "de";
    } else if ($_GET['lang'] == "pol") {
        $ck3 = "checked";
        $lang = "pol";
    } else {
        $ck = "checked";
    }
} else {
    $ck = "checked";
}
if($_GET['act']=='delete'){
  $id=$_GET['forms_id'];
  $sql2="DELETE from forms where id=".$id." ";
  $db_result2=pg_query($db_connection,$sql2);
  $sql22="DELETE from forms where themeid=".$id." ";
  $db_result22=pg_query($db_connection,$sql22);
  if($db_result2){
    pg_free_result($db_result2);
    header("location: template_list.php");
  }
}

?>


<?php include 'left_menu.php'; ?>

<div role="main" class="main-content">

  <div class="page-content container container-plus">
    <!-- page header and toolbox -->
    <div class="page-header pb-2">
    <nav class="breadcrumb">
                <a style="1px solid #000000; padding: 0 5px" href="home.php?app=default&lang=<?php echo detect_language(); ?> ">Home</a> 
                <a>/</a>
                <a style="1px solid #000000; padding: 0 5px" class=" active"><?php echo $_templates;?></a>
            </nav>
    </div>
    <?php
    // if ($_SESSION['user_type'] == 'U') {
    //   echo '<div class="alert d-flex bgc-red-l3 brc-success-m4 border-0 p-0" role="alert">
    //                   <div class="bgc-red px-3 py-1 text-center radius-l-1">
    //                     <span class="fa-2x text-white">
    //             ⚠ <!-- &#9888; -->
    //           </span>
    //                   </div><span class="ml-3 align-self-center text-dark-tp3 text-110">
    //           You do not have permission to access this page!
    //         </span></div>';
    // } else {
    ?>

      <div class="text-center mb-4">
        <a href="template_list_add.php" class="btn btn-blue px-45 py-2 text-105 radius-2">
          <i class="fa fa-pencil-alt mr-1"></i>
          <?php echo $_add_new_folder;?></a>
      </div>


     




      <div class="container">
      <form action="template_search_list.php?lang=<?php echo $lang; ?>" method="POST">

                    <input type="text" name="query" class="form-control" value="<?php echo $_POST['query']?>" />
                    <input type="submit" value=<?php echo $_search;?> class="form-control" />

                </form>
        <h1><a href=""><?php echo $_list;?></a></h1>
        <hr>
        <?php
        if ($_GET['act'] == 'search') {
          $pages = new Paginator;
          $pages->default_ipp = 15;
          $string = implode(',', $_SESSION['user_in_groups']);
          $query = $_POST['query'];
         // echo $query;

          $query = htmlspecialchars($query);
          $query = pg_escape_string($query);
          // echo $query;
          // $sql_formsx = pg_query("select * from information where inhalt_de LIKE '%" . $query . "%'");
          // print_r($sql_formsx);
          // $n = 0;
          // while ($t = pg_fetch_array($sql_formsx)) {
          //     echo "<p>" . ++$n . "" . $t['inhalt'] . "</p>";
         // }

          $sql_forms = pg_query("select id, theme, name, path, iconpath, timestamp from forms where themeid is null  AND (theme LIKE '%" . $query . "%' ) order by theme");
          $pages->items_total = pg_num_rows($sql_forms);
          $pages->mid_range = 9;
          $pages->paginate();
          //echo "SELECT * FROM groups ORDER BY id ASC '".$pages->limit."'";
          //echo $pages->limit;
          $result = pg_query("select id, theme, name, path, iconpath, timestamp from forms where themeid is null  AND (theme LIKE '%" . $query . "%' ) order by theme " . $pages->limit . "");
      }
      else{
        $pages = new Paginator;
        $pages->default_ipp = 15;
        $sql_forms = pg_query( "select id, theme, name, path, iconpath, timestamp from forms where themeid is null order by theme");
        $pages->items_total = pg_num_rows($sql_forms);
        $pages->mid_range = 9;
        $pages->paginate();
        //echo "SELECT * FROM groups ORDER BY id ASC '".$pages->limit."'";
        //echo $pages->limit;
        $result = pg_query("select id, theme, name, path, iconpath, timestamp from forms where themeid is null order by theme " . $pages->limit . "");
      }
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
            $forms_id = $val["id"];
            $forms_theme = $val["theme"];
            $forms_name = $val["name"];
            $forms_path = $val["path"];
            $forms_iconpath = $val["iconpath"];
            $forms_timestamp = $val["timestamp"];

        ?>
            <div class="mt-45 card ccard">

              <div class="card-header">
                 <center>
                <h4 class="text-120 mb-0">
                 
 <a href="forms_item_list.php?forms_id=<?php echo $forms_id; ?>&forms_item_id=1" class="forms_themes_box_cell_1 forms_themes_link">
        
            <!-- theme - title -->
            <?php echo $forms_theme; ?>
        
        </a>
                </h4>
                        </center>
                        <?php if ($_SESSION['user_type'] == 'A')
                {?>
                <div >
                <table class="table table-borderless">
  <tr>
      
      <td><a onClick="return confirm('Are you sure you want to delete training data <?php echo $theme_name; ?>')" href="template_list.php?act=delete&forms_id=<?php echo $val['id']; ?>" class="btn btn-primary a-btn-slide-text">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    <span><strong><?php echo $_delete;?></strong></span>
                  </a></td>
      <td><a href="template_list_edit.php?forms_id=<?php echo $forms_id; ?>&app=default&lang=<?php echo detect_language(); ?>" class="btn btn-primary a-btn-slide-text">
                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                    <span><strong><?php echo $_edit;?></strong></span>
                  </a></td>
    </tr>
  </table>

                  <!-- <a onClick="return confirm('Are you sure you want to delete training data <?php echo $theme_name; ?>')" href="template_list.php?act=delete&forms_id=<?php echo $val['id']; ?>" class="btn btn-primary a-btn-slide-text">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    <span><strong>Delete</strong></span>
                  </a>
                  <a href="template_list_edit.php?forms_id=<?php echo $forms_id; ?>" class="btn btn-primary a-btn-slide-text">
                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                    <span><strong>Edit</strong></span>
                  </a> -->

                  
                </div>
                <?php }?>
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
   // }
    ?>

  </div>

</div>
</div>

<?php include 'footer.php'; ?>
<script type="text/javascript">
  /*$('.file2').click(function(){
    //alert(this.id);
    var id=this.id;
});
  var nn="file_name2"+id;
  */
  var test="file_name2";
  var i;
  $(document).on("click", ".browse2", function() {
    var file2 = $(this).parents().find(".file2");
   // alert(this.id);
    file2.trigger("click");
  });
  $('input[class="file2"]').change(function(e) {
    var id=this.id;
    var fileName2 = e.target.files[0].name;
    $("#file2").val(fileName2);
    var reader2 = new FileReader();
    //alert("preview"+id);
    reader2.onload = function(e) {
      // get loaded data and render thumbnail.
      //alert("preview"+id);
      document.getElementById("preview"+id).src = e.target.result;
    };
    // read the image file as a data URL.
    reader2.readAsDataURL(this.files[0]);
  });
</script>
<script type="text/javascript">
  $(document).on("click", ".browse", function() {
    var file = $(this).parents().find(".file");
    file.trigger("click");
  });
  $('input[name="file_name"]').change(function(e) {
    var fileName = e.target.files[0].name;
    alert(""+fileName);
    $("#file").val(fileName);
    var reader = new FileReader();
    reader.onload = function(e) {
      // get loaded data and render thumbnail.
      document.getElementById("preview").src = e.target.result;
    };
    // read the image file as a data URL.
    reader.readAsDataURL(this.files[0]);
  });
</script>

<script type="text/javascript">
  /* $(document).on("click", ".browse2", function() {
    var file = $(this).parents().find(".file2");
    file.trigger("click");
  });
  var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
      URL.revokeObjectURL(output.src) // free memory
    }
  };
  */
</script>

</body>

</html>
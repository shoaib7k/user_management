<?php
session_start();
include('paginator.class.php');
?>
<?php
include 'db_connect.php';
?>
<?php

$theme_id = $_GET['theme_id'];
if ($theme_id != "") {

  if ($db_connection) {

    $db_result = pg_query($db_connection, "select theme, iconpath from media where id = " . $_theme_id);
    if ($db_result) {

      if (pg_num_rows($db_result) > 0) {

        $db_record = pg_fetch_array($db_result, 0, PGSQL_BOTH);

        $theme_name = $db_record["theme"];
        $theme_icon = $db_record["iconpath"];
      }
    }
    pg_free_result($db_result);
  }
  pg_close($db_connection);
}
?>
<?php

if ($_GET['act'] == 'add') {

  global $_homebase_path;
  $_homebase_path = "/var/www/webtest5/";
  $_training_theme_id = "";
  $_training_theme_name_old = "";
  $_training_theme_name_new = "";
  $_file_unique_name = "";
  $_file_name = "";
  $_file_iconpath = "";
  $_file_iconpath_old = "";

  if (isset($_POST["training_theme_id"])) {
    $_training_theme_id = $_POST["training_theme_id"];
  }
  if (isset($_POST["training_theme_name_old"])) {
    $_training_theme_name_old = $_POST["training_theme_name_old"];
  }
  if (isset($_POST["training_theme_name_new"])) {
    $_training_theme_name_new = $_POST["training_theme_name_new"];
  }

  $_image_types = array('image/jpeg', 'image/gif', 'image/png');

  if (isset($_FILES['file_name'])) {

    if (in_array($_FILES['file_name']['type'], $_image_types)) {

      $_file_tmp_name = $_FILES["file_name"]["tmp_name"];

      if ($_FILES['file_name']['type'] == 'image/jpeg') {
        $_image_suffix = '.jpg';
      }
      if ($_FILES['file_name']['type'] == 'image/gif') {
        $_image_suffix = '.gif';
      }
      if ($_FILES['file_name']['type'] == 'image/png') {
        $_image_suffix = '.png';
      }

      $_file_unique_name = md5(uniqid(rand(), TRUE)) . $_image_suffix; // create unique file name

      $_file_name = $_homebase_path . "training/icons/" . $_file_unique_name;
      $_file_iconpath = "training/icons/" . $_file_unique_name;
    } else {

      echo "Dieser Dateityp ist nicht zugelassen";
    }
  }

  //  $_db_connection = pg_connect("host=localhost port=5432 dbname=Intranet user=postgres password=postgres");

  if ($db_connection) {

    if ($_training_theme_id != "") { // change theme

      $_db_result = pg_query($db_connection, "select iconpath from media where id = " . $_training_theme_id);

      if ($_db_result) {

        $_db_record_count = pg_num_rows($_db_result);

        if ($_db_record_count > 0) {

          $_db_record = pg_fetch_array($_db_result, 0, PGSQL_BOTH);

          $_file_iconpath_old = $_homebase_path . $_db_record["iconpath"];
        }
      }


      if ($_training_theme_name_new != "") {

        if ($_file_name == "") {

          $_sql = "update media set theme = '" . $_training_theme_name_new . "' where id = " . $_training_theme_id;
          $_db_result = pg_query($db_connection, $_sql);
        } else {

          $_sql = "update media set theme = '" . $_training_theme_name_new . "', iconpath = '" . $_file_iconpath . "' where id = " . $_training_theme_id;
          $_db_result = pg_query($db_connection, $_sql);

          if ($_db_result) {
            unlink($_file_iconpath_old);
            move_uploaded_file($_file_tmp_name, $_file_name);
          }
        }
      } else {

        if ($_file_name == "") {

          // do noting

        } else {

          $_sql = "update media set iconpath = '" . $_file_iconpath . "' where id = " . $_training_theme_id;
          $_db_result = pg_query($db_connection, $_sql);

          if ($_db_result) {
            unlink($_file_iconpath_old);
            move_uploaded_file($_file_tmp_name, $_file_name);
          }
        }
      }
    } else { // new theme

      if ($_training_theme_name_new != "") {

        if ($_file_name == "") {

          $_sql = "insert into media (theme, iconpath) values ('" . $_training_theme_name_new . "',NULL)";
          $_db_result = pg_query($db_connection, $_sql);
        } else {

          $_sql = "insert into media (theme, iconpath) values ('" . $_training_theme_name_new . "', '" . $_file_iconpath . "')";
          $_db_result = pg_query($db_connection, $_sql);
          if ($_db_result) {
            move_uploaded_file($_file_tmp_name, $_file_name);
          }
        }
      } else {

        echo "Ein neues Thema kann nicht ohne Namen angelegt werden.";
      }

      pg_free_result($_db_result);
    }

    pg_close($db_connection);
  } else {

    echo "Es konnte keine Verbindung zur Datenbank hergestellt werden.";
  }
} else if ($_GET['act'] == 'edit') {
  global $_homebase_path;

  $_training_theme_id = "";
  $_training_theme_name_old = "";
  $_training_theme_name_new = "";
  $_file_unique_name = "";
  $_file_name = "";
  $_file_iconpath = "";
  $_file_iconpath_old = "";

  if (isset($_POST["training_theme_id"])) {
    $_training_theme_id = $_POST["training_theme_id"];
  }
  if (isset($_POST["training_theme_name_old"])) {
    $_training_theme_name_old = $_POST["training_theme_name_old"];
  }
  if (isset($_POST["training_theme_name_new"])) {
    $_training_theme_name_new = $_POST["training_theme_name_new"];
  }

  $_image_types = array('image/jpeg', 'image/gif', 'image/png');

  if (isset($_FILES['file_name'])) {

    if (in_array($_FILES['file_name']['type'], $_image_types)) {

      $_file_tmp_name = $_FILES["file_name"]["tmp_name"];

      if ($_FILES['file_name']['type'] == 'image/jpeg') {
        $_image_suffix = '.jpg';
      }
      if ($_FILES['file_name']['type'] == 'image/gif') {
        $_image_suffix = '.gif';
      }
      if ($_FILES['file_name']['type'] == 'image/png') {
        $_image_suffix = '.png';
      }

      $_file_unique_name = md5(uniqid(rand(), TRUE)) . $_image_suffix; // create unique file name

      $_file_name = $_homebase_path . "training/icons/" . $_file_unique_name;
      $_file_iconpath = "training/icons/" . $_file_unique_name;
    } else {

      echo "Dieser Dateityp ist nicht zugelassen";
    }
  }

  $_db_connection = pg_connect("host=localhost port=5432 dbname=Intranet user=postgres password=postgres");

  if ($_db_connection) {

    if ($_training_theme_id != "") { // change theme

      $_db_result = pg_query($_db_connection, "select iconpath from media where id = " . $_training_theme_id);

      if ($_db_result) {

        $_db_record_count = pg_num_rows($_db_result);

        if ($_db_record_count > 0) {

          $_db_record = pg_fetch_array($_db_result, 0, PGSQL_BOTH);

          $_file_iconpath_old = $_homebase_path . $_db_record["iconpath"];
        }
      }


      if ($_training_theme_name_new != "") {

        if ($_file_name == "") {

          $_sql = "update media set theme = '" . $_training_theme_name_new . "' where id = " . $_training_theme_id;
          $_db_result = pg_query($_db_connection, $_sql);
        } else {

          $_sql = "update media set theme = '" . $_training_theme_name_new . "', iconpath = '" . $_file_iconpath . "' where id = " . $_training_theme_id;
          $_db_result = pg_query($_db_connection, $_sql);

          if ($_db_result) {
            unlink($_file_iconpath_old);
            move_uploaded_file($_file_tmp_name, $_file_name);
          }
        }
      } else {

        if ($_file_name == "") {

          // do noting

        } else {

          $_sql = "update media set iconpath = '" . $_file_iconpath . "' where id = " . $_training_theme_id;
          $_db_result = pg_query($_db_connection, $_sql);

          if ($_db_result) {
            unlink($_file_iconpath_old);
            move_uploaded_file($_file_tmp_name, $_file_name);
          }
        }
      }
    } else { // new theme

      if ($_training_theme_name_new != "") {

        if ($_file_name == "") {

          $_sql = "insert into media (theme, iconpath) values ('" . $_training_theme_name_new . "',NULL')";
          $_db_result = pg_query($_db_connection, $_sql);
        } else {

          $_sql = "insert into media (theme, iconpath) values ('" . $_training_theme_name_new . "', '" . $_file_iconpath . "')";
          $_db_result = pg_query($_db_connection, $_sql);
          if ($_db_result) {
            move_uploaded_file($_file_tmp_name, $_file_name);
          }
        }
      } else {

        echo "Ein neues Thema kann nicht ohne Namen angelegt werden.";
      }

      pg_free_result($_db_result);
    }

    pg_close($_db_connection);
  } else {

    echo "Es konnte keine Verbindung zur Datenbank hergestellt werden.";
  }
}


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

      <div class="text-center mb-4">
        <a href="#aside-compose" data-toggle="modal" data-target="#userModal" class="btn btn-blue px-45 py-2 text-105 radius-2">
          <i class="fa fa-pencil-alt mr-1"></i>
          Add New Training Data</a>
      </div>


      <div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Create Topic</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form method="POST" action="training_list.php?act=add">

                <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="training_theme_id" class="form-control" value="<?php echo $theme_id; ?>" id="theme_id" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">Current Theme Name</label>
                  <input type="text" name="training_theme_name_old" class="form-control" value="<?php echo $theme_name; ?>" id="current_theme" readonly>
                </div>
                <div class="form-group">
                  <label for="formGroupExampleInput">New Theme Name</label>
                  <input type="text" name="training_theme_name_new" class="form-control" id="new_theme">
                </div>

                <label for="formGroupExampleInput">Icon</label>
                <div id="msg"></div>
                <input type="file" name="file_name" class="file" accept="image/*">
                <div class="input-group my-3">
                  <input type="text" class="form-control" disabled placeholder="Upload File" id="file">
                  <div class="input-group-append">
                    <button type="button" class="browse btn btn-primary">Browse...</button>
                  </div>
                </div>
                <div class="ml-2 col-sm-6">
                  <img src="https://placehold.it/80x80" id="preview" class="img-thumbnail">
                </div>


                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <input type="submit" class="btn btn-primary" value="Add">
                </div>
              </form>
            </div>

          </div>
        </div>
      </div>





      <div class="container">
        <h1><a href=""> List</a></h1>
        <hr>
        <?php
        $pages = new Paginator;
        $pages->default_ipp = 15;
        $sql_forms = pg_query("select id, theme, iconpath, timestamp from media where themeid is NULL order by theme");
        $pages->items_total = pg_num_rows($sql_forms);
        $pages->mid_range = 9;
        $pages->paginate();
        //echo "SELECT * FROM groups ORDER BY id ASC '".$pages->limit."'";
        //echo $pages->limit;
        $result = pg_query("select id, theme, iconpath, timestamp from media where themeid is NULL order by theme " . $pages->limit . "");
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
            $theme_id = $val['id'];
            $theme_name = $val['theme'];
            $theme_icon = $val['iconpath'];

        ?>
            <div class="mt-45 card ccard">

              <div class="card-header">
                <h4 class="text-120 mb-0">
                  <?php echo $theme_name; ?>
                </h4>
                <div class="card-toolbar no-border">

                  <a onClick="return confirm('Are you sure you want to delete user <?php echo $val['login_name']; ?>')" href="#?act=delete&id=<?php echo $val['id']; ?>" class="card-toolbar-btn btn btn-sm radius-1 btn-outline-success btn-h-outline-success px-15 mx-0 btn-tp" type="button">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    <span><strong>Delete</strong></span>
                  </a>
                  <a href="#editUser<?php echo $val['id']; ?>" class="card-toolbar-btn btn btn-sm radius-1 btn-outline-success btn-h-outline-success px-15 mx-0 btn-tp" data-id="<?php echo $val['id']; ?>" data-toggle="modal">
                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                    <span><strong>Edit</strong></span>
                  </a>

                  <div class="modal fade" id="editUser<?php echo $val['id']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <form method="POST" action="training_list.php?act=edit">

                            <div class="form-group">
                              <label for="formGroupExampleInput">ID</label>
                              <input type="text" name="training_theme_id" class="form-control" value="<?php echo $theme_id; ?>" id="theme_id" readonly>
                            </div>
                            <div class="form-group">
                              <label for="formGroupExampleInput">Current Theme Name</label>
                              <input type="text" name="training_theme_name_old" class="form-control" value="<?php echo $theme_name; ?>" id="current_theme" readonly>
                            </div>
                            <div class="form-group">
                              <label for="formGroupExampleInput">New Theme Name</label>
                              <input type="text" name="training_theme_name_new" class="form-control" id="new_theme">
                            </div>

                            <label for="formGroupExampleInput">Icon</label>
                            <div id="msg"></div>
                            <input type="file" name="file_name" class="file2" accept="image/*">
                            <div class="input-group my-3">
                              <input type="text" class="form-control" disabled placeholder="Upload File" id="file2">
                              <div class="input-group-append">
                                <button type="button" class="browse2 btn btn-primary">Browse...</button>
                              </div>
                            </div>
                            <div class="ml-2 col-sm-6">
                              <img src="<?php echo $theme_icon; ?>" id="preview1" class="img-thumbnail">
                            </div>

                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                              <input type="submit" class="btn btn-primary" value="Add">
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card-header">
                <img src="<?php echo $theme_icon; ?>" alt="" class="training_theme_icon">
                <div class="card-toolbar no-border">
                  <a href="#training&theme&<?php echo $theme_id; ?>&handbook" class="training_theme_link"><span><strong>Manuals </strong></span> </a>
                  <br> <br>
                  <a href="#training&theme&<?php echo $theme_id; ?>&video" class="training_theme_link"><span><strong>Videos </strong></span> </a>
                </div>
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

<?php include 'footer.php'; ?>
<script type="text/javascript">
  $(document).on("click", ".browse", function() {
    var file = $(this).parents().find(".file");
    file.trigger("click");
  });
  $('input[type="file"]').change(function(e) {
    var fileName = e.target.files[0].name;
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
  $(document).on("click", ".browse2", function() {
    var file2 = $(this).parents().find(".file2");
    file2.trigger("click");
  });
  $('input[type="file"]').change(function(e) {
    var fileName2 = e.target.files[0].name;
    $("#file2").val(fileName2);
    var reader2 = new FileReader();
    reader.onload = function(e) {
      // get loaded data and render thumbnail.
      document.getElementById("preview1").src = e.target.result;
    };
    // read the image file as a data URL.
    reader.readAsDataURL(this.files[0]);


  });
</script>

</body>

</html>
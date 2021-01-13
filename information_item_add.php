<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  <head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<?php

session_start();
include('paginator.class.php');
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

      


     
              <form method="POST" action="information_item_add.php?act=add" enctype="multipart/form-data">

                <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="forms_theme_id" class="form-control" value="<?php echo $forms_theme_id; ?>" id="forms_theme_id" readonly>
                </div>
                
                <div class="form-group">
                  <label for="formGroupExampleInput">Title</label>
                  <input type="text" name="name_title" class="form-control" id="id_title">
                </div>
                
                <div class="form-group">
                  <label for="formGroupExampleInput">Content</label>
                  <textarea id="summernote" name="editordata"></textarea>
                </div>

                

                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <input type="submit" class="btn btn-primary" value="Add">
                </div>
   
              </form>
             


          </div>
        </div>
      </div>





      
    <?php
    }
    ?>

  </div>

</div>
</div>
<script>
    $(document).ready(function() {
        $('#summernote').summernote();
    });
  </script>

</body>

</html>
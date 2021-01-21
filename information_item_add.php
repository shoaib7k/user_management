<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Hi Summernote with Bootstrap 4</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
  </head>
<?php

session_start();
include('paginator.class.php');
?>

<?php
include 'db_connect.php';

$lang="en";

$title = $_POST['information_title'];
$content = $_POST['editordata'];

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
if ($_GET['act'] == 'add') {
 

         if ($lang=="de"){
          $sql = "insert into information (titel_de, inhalt_de) values ('".$title."','".$content."')";
        }
        else if($lang=="pol"){
          $sql = "insert into information ( titel_pol, inhalt_pol) values ( '".$title."','".$content."')";
        }
        else{
          $sql = "insert into information ( titel, inhalt) values ( '".$title."','".$content."')";
        }
         
        header("location: information_list.php");
        
        
          
  
    
    if ($db_connection) {
        
        $db_result = pg_query($db_connection, $sql);
        
        if ($db_result) {
            
            pg_free_result($db_result);
            
        }      
        
        pg_close($db_connection);
        
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

      


     
              <form method="POST" action="information_item_add.php?act=add&lang=<?php echo $lang; ?>" enctype="multipart/form-data">

                <div class="form-group">
                  <label for="formGroupExampleInput">ID</label>
                  <input type="text" name="information_id" class="form-control" value="<?php echo $forms_theme_id; ?>" id="information_id" readonly>
                </div>
                
                <div class="form-group">
                  <label for="formGroupExampleInput">Title</label>
                  <input type="text" name="information_title" class="form-control" id="information_title">
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
      $('#summernote').summernote({
        placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 100
      });
    </script>
</body>

</html>
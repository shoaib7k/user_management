<?php
session_start();
if($_SESSION['logged_in']!=1){
  header('location: index.php');
}
?>
<div>
  <nav class="navbar navbar-default" >
    <a class="navbar-brand" href="index.php"><img src="./images/rf-logo-intranet.svg" alt="Dispute Bills">
        </a>
      <div id="navbar5" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
          <!--<li class="active"><a href="#">Calender</a></li>
          <li><a href="#">Information</a></li>
          <li><a href="contact_list.php">Contact</a></li>
          <li><a href="#">Training</a></li>
          <li><a href="#">Templates<a></li>
   -->
      <img src='images/button-login.svg' name='button-login' onmouseover="this.src='images/button-login-red.svg'" onmouseout="this.src='images/button-login.svg'" onclick='' class="img_button_40" data-toggle="modal" data-target="#exampleModal"/>

      <a href="settings.php" class="btn btn-outline-primary"><img src="images/button-gear.svg" alt="button config" onmouseover="javascript:this.src='images/button-gear-red.svg'" onmouseout="javascript:this.src='images/button-gear.svg'" class="svg_image_button_2"></a>

      <select class="selectpicker" data-width="fit">
        <option data-content='<span class="flag-icon flag-icon-us"></span> English'>English</option>
        <!-- <option data-content='<span class="flag-icon flag-icon-mx"></span> Deutsch'>Deutsch</option> -->
      </select>
        </ul>
      </div>

    </div>
  </nav>
</div>
<div class="sidebar">
  <a class="active" href="home.php">Home</a>
  <a  href="#home">Calendar</a>
  <a href="#news">Information</a>
  <a href="contact_list.php">Contact</a>
  <a href="#about">Training</a>
  <a href="#about">Templates</a>
  <a href="settings.php">Users</a>
  <a href="logout.php">Logout</a>
</div>


          <!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>

                <div class="modal-body">
                  <?php if($_SESSION['logged_in']!=1) { ?>
                  <form method="POST" action="login.php">
                    <div class="form-group row">
                      <label for="loginName" class="col-sm-4 col-form-label">Login Name</label>
                      <div class="col-sm-8">
                        <input type="text" name="login_name" id="login_name" class="form-control">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="password" class="col-sm-4 col-form-label">password</label>
                      <div class="col-sm-8">
                        <input type="password" name="password" id="password" class="form-control">
                      </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <input type="submit" class="btn btn-primary" value="Login">
                </div>
              <?php } else {
                echo "Logged in as ".$_SESSION['login_name']."";
                echo '<div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <a href="logout.php">
                  <input type="submit" class="btn btn-danger" value="Log Out">
                  </a>
                </div>';
              }
                ?>
                </form>
              </div>
            </div>
          </div>
        </div>
      -->

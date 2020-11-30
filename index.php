<!doctype html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">

    <title>Login - Intranet</title>

    <!-- include common vendor stylesheets & fontawesome -->
    <link rel="stylesheet" type="text/css" href="./node_modules/bootstrap/dist/css/bootstrap.css">

    <link rel="stylesheet" type="text/css" href="./node_modules/@fortawesome/fontawesome-free/css/fontawesome.css">
    <link rel="stylesheet" type="text/css" href="./node_modules/@fortawesome/fontawesome-free/css/regular.css">
    <link rel="stylesheet" type="text/css" href="./node_modules/@fortawesome/fontawesome-free/css/brands.css">
    <link rel="stylesheet" type="text/css" href="./node_modules/@fortawesome/fontawesome-free/css/solid.css">



    <!-- include vendor stylesheets used in "Login" page. see "/views//pages/partials/page-login/@vendor-stylesheets.hbs" -->


    <!-- include fonts -->
    <link rel="stylesheet" type="text/css" href="./dist/css/ace-font.css">



    <!-- ace.css -->
    <link rel="stylesheet" type="text/css" href="./dist/css/ace.css">


    <!-- favicon -->
    <link rel="icon" type="image/png" href="./assets/favicon.png" />
  </head>

  <body>
    <div class="body-container">

      <div class="main-container container bgc-transparent">

        <div class="main-content minh-100 justify-content-center">
         
               
                    <!-- you can also use these tab links -->
                    <ul class="d-none mt-n4 mb-4 nav nav-tabs nav-tabs-simple justify-content-end bgc-black-tp11" role="tablist">
                      <li class="nav-item mx-2">
                        <a class="nav-link active px-2" data-toggle="tab" href="#id-tab-login" role="tab" aria-controls="id-tab-login" aria-selected="true">
                          Login
                        </a>
                      </li>
                      <li class="nav-item mx-2">
                        <a class="nav-link px-2" data-toggle="tab" href="#id-tab-signup" role="tab" aria-controls="id-tab-signup" aria-selected="false">
                          Signup
                        </a>
                      </li>
                    </ul>


                    <div class="tab-content tab-sliding border-0 p-0" data-swipe="right">

                      <div class="tab-pane active show mh-100 px-3 px-lg-0 pb-3" id="id-tab-login">
                        <!-- show this in desktop -->
                        <div class="d-none d-lg-block col-md-6 offset-md-3 mt-lg-4 px-0">
                          <h4 class="text-dark-tp4 border-b-1 brc-secondary-l2 pb-1 text-130">
                            <i class="fa fa-coffee text-orange-m1 mr-1"></i>
                            Welcome Back
                          </h4>
                        </div>

                        <!-- show this in mobile device -->
                        <div class="d-lg-none text-secondary-m1 my-4 text-center">
                          <a href="html/dashboard.html">
                            <i class="fa fa-leaf text-success-m2 text-200 mb-4"></i>
                          </a>
                          <h1 class="text-170">
                            <span class="text-blue-d1">
                                Intranet <span class="text-80 text-dark-tp3">Application</span>
                            </span>
                          </h1>

                          Welcome back
                          <?php 
if(isset($_GET['msg']))
{
?>
        <div class="alert alert-danger">
  <strong>Oops!</strong> Incorrect login ID or Password.
</div>       
<?php }?>
                        </div>


                        <form autocomplete="off" method="post" action="login.php" class="form-row mt-4">
                          <div class="form-group col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-6 offset-lg-3">
                            <div class="d-flex align-items-center input-floating-label text-blue brc-blue-m2">
                              <input type="text" name="login_name" class="form-control form-control-lg pr-4 shadow-none" id="id-login-username" />
                              <i class="fa fa-user text-grey-m2 ml-n4"></i>
                              <label class="floating-label text-grey-l1 ml-n3" for="id-login-username">
                                Username
                              </label>
                            </div>
                          </div>


                          <div class="form-group col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-6 offset-lg-3 mt-2 mt-md-1">
                            <div class="d-flex align-items-center input-floating-label text-blue brc-blue-m2">
                              <input type="password" name="password" class="form-control form-control-lg pr-4 shadow-none" id="id-login-password" />
                              <i class="fa fa-key text-grey-m2 ml-n4"></i>
                              <label class="floating-label text-grey-l1 ml-n3" for="id-login-password">
                                Password
                              </label>
                            </div>
                          </div>

                          <div class="form-group col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-6 offset-lg-3">
                            <label class="d-inline-block mt-3 mb-0 text-dark-l1">
                              <input type="checkbox" class="mr-1" id="id-remember-me" />
                              Remember me
                            </label>

                            <button type="submit" class="btn btn-primary btn-block px-4 btn-bold mt-2 mb-4">
                              Sign In
                            </button>
                          </div>
                        </form>


                   
                      </div>


                 
                   

                    </div><!-- .tab-content -->
                  
               
            

            <div class="d-lg-none my-3 text-white-tp1 text-center">
              <i class="fa fa-leaf text-success-l3 mr-1 text-110"></i> Ace Company &copy; 2020
            </div>
          
        </div>

      </div>

    </div>

    <!-- include common vendor scripts used in demo pages -->
    <script src="./node_modules/jquery/dist/jquery.js"></script>
    <script src="./node_modules/popper.js/dist/umd/popper.js"></script>
    <script src="./node_modules/bootstrap/dist/js/bootstrap.js"></script>



    <!-- include vendor scripts used in "Login" page. see "/views//pages/partials/page-login/@vendor-scripts.hbs" -->



    <!-- include ace.js -->
    <script src="./dist/js/ace.js"></script>



    <!-- demo.js is only for Ace's demo and you shouldn't use it -->
    <script src="./app/browser/demo.js"></script>



    <!-- "Login" page script to enable its demo functionality -->
    <script src="./views/pages/page-login/@page-script.js"></script>
  </body>

</html>
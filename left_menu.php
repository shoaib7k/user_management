 <?php include 'head.php'; ?>
   <?php
session_start();
if($_SESSION['logged_in']!=1){
  header('location: index.php');
}
define('SUPPORTED_LANGUAGES', ['en', 'de','pol']);

function detect_language() {
    foreach (preg_split('/[;,]/', $_SERVER['HTTP_ACCEPT_LANGUAGE']) as $sub) {
        if (substr($sub, 0, 2) == 'q=') continue;
        if (strpos($sub, '-') !== false) $sub = explode('-', $sub)[0];
        if (in_array(strtolower($sub), SUPPORTED_LANGUAGES)) return $sub;
    }
    return 'en';
}
// Set Language Variable
$_SESSION['lang'] = 'en';
if (isset($_GET['lang']) && !empty($_GET['lang'])) {
  $_SESSION['lang'] = $_GET['lang'];

  if (isset($_SESSION['lang']) && $_SESSION['lang'] != $_GET['lang']) {
    echo "<script type='text/javascript'> location.reload(); </script>";
  }
}

//include language file
if (isset($_SESSION['lang'])) {
  include "language/lang_" . $_SESSION['lang'] . ".php";
}
?>
<body>
    <div class="body-container">
   <nav class="navbar navbar-expand-lg navbar-fixed navbar" style="background-color: #f1f3f6">
        <div class="navbar-inner">

          <div class="navbar-intro justify-content-xl-between" >

            <button type="button" class="btn btn-burger burger-arrowed static collapsed ml-2 d-flex d-xl-none" data-toggle-mobile="sidebar" data-target="#sidebar" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle sidebar">
              <span class="bars"></span>
            </button><!-- mobile sidebar toggler button -->

           <!-- <a class="navbar-brand text-white" href="#">
              <i class="fa fa-leaf"></i>
              <span>Ace</span>
              <span>App</span>
            </a>--><!-- /.navbar-brand -->
<a class="navbar-brand text-white" href="#" >
             <img src="./images/rf-logo-intranet.svg" alt="Dispute Bills">
            </a>
            <button type="button" class="btn btn-burger mr-2 d-none d-xl-flex" data-toggle="sidebar" data-target="#sidebar" aria-controls="sidebar" aria-expanded="true" aria-label="Toggle sidebar">
              <span class="bars"></span>
            </button><!-- sidebar toggler button -->

          </div>
           <button type="button" class="btn btn-burger burger-arrowed static collapsed ml-2 d-flex d-xl-none" data-toggle-mobile="sidebar" data-target="#sidebar" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle sidebar">
              <span class="bars" style="background-color: blue;"></span>
            </button>
          <button class="navbar-toggler ml-1 mr-2 px-1" type="button" data-toggle="collapse" data-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navbar menu">
            <span class="pos-rel">
                  <!-- <img class="border-2 brc-white-tp1 radius-round" width="36" src="assets/image/avatar/avatar6.jpg" alt="Jason's Photo"> -->
                  <span class="bgc-warning radius-round border-2 brc-white p-1 position-tr mr-n1px mt-n1px"></span>
            </span>
          </button>


          <div class="navbar-menu collapse navbar-collapse navbar-backdrop" id="navbarMenu">

            <div class="navbar-nav">
            <table>
            <tr></tr>
            
              <ul class="nav">
              <tr>
                 <li class="nav-item dropdown">
                  <?php
                  $_SERVER['PHP_SELF'];
                    $url_request=$_SERVER['REQUEST_URI'];
                  //$variable = substr($variable, 0, strpos($variable, "By"));
                //echo $url_request=substr($url_request, 0,strpos($url_request, "lang="));
                if(strpos($url_request, '?lang') !== false){
                 $url_request=substr($url_request, 0, strpos( $url_request, "?lang"));
               }
                   if(strpos($url_request, '&lang') !== false){
                 $url_request=substr($url_request, 0, strpos( $url_request, "&lang"));
               }
               $url="https://".$_SERVER['HTTP_HOST'].$url_request;
                /*if(!empty($url_request) && strpos($url, '?') !== true){
               $url="http://".$_SERVER['HTTP_HOST'].$url_request;
               $sign="?"; 
             }
             else{
                             $url="http://".$_SERVER['HTTP_HOST'].$url_request;
                             $sign="&"; 
             }
             */
             ?>

<select class="form-control" id="form-field-select-1" onchange="window.location.href=this.value;">
  <option value="<?php echo $url; ?>&lang=en" <?php if($_GET['lang']=='en') echo "selected"; ?>>English</option>
  <option value="<?php echo $url; ?>&lang=de" <?php if($_GET['lang']=='de') echo "selected"; ?>>Deutsch</option>
  <option value="<?php echo $url; ?>&lang=pol" <?php if($_GET['lang']=='pol') echo "selected"; ?>>Polish</option>
</select>
                 </li>
                 </tr>
                 <tr>
                <li class="nav-item dropdown order-first order-lg-last">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                   
                    <span class="d-inline-block d-lg-none d-xl-inline-block">
                              <span class="text-90" id="id-user-welcome"><?php echo $_welcome;?>,</span>
                    <span class="nav-user-name" style="max-width:400px;"><?php echo $_SESSION['full_name'];?></span>
                    </span>

                    <!-- <i class="caret fa fa-angle-down d-none d-xl-block"></i> -->
                    <i class="caret fa fa-angle-left d-block d-lg-none"></i>
                  </a>

                  <div class="dropdown-menu dropdown-caret dropdown-menu-right dropdown-animated brc-primary-m3 py-1">
                    <div class="d-none d-lg-block d-xl-none">
                      <div class="dropdown-header">
                        <?php echo $_welcome;?>, <?php echo $_SESSION['full_name'];?>
                      </div>
                      <div class="dropdown-divider"></div>
                    </div>

                    

                    <!-- <a class="mt-1 dropdown-item btn btn-outline-grey bgc-h-primary-l3 btn-h-light-primary btn-a-light-primary" href="html/page-profile.html">
                      <i class="fa fa-user text-primary-m1 text-105 mr-1"></i>
                      Profile
                    </a>

                    <a class="dropdown-item btn btn-outline-grey bgc-h-success-l3 btn-h-light-success btn-a-light-success" href="#" data-toggle="modal" data-target="#id-ace-settings-modal">
                      <i class="fa fa-cog text-success-m1 text-105 mr-1"></i>
                      Settings
                    </a> -->

                    <div class="dropdown-divider brc-primary-l2"></div>

                    <a class="dropdown-item btn btn-outline-grey bgc-h-secondary-l3 btn-h-light-secondary btn-a-light-secondary" href="logout.php">
                      <i class="fa fa-power-off text-warning-d1 text-105 mr-1"></i>
                      Logout
                    </a>
                  </div>
                </li><!-- /.nav-item:last -->
                </tr>

              </ul><!-- /.navbar-nav menu -->
              </table>
            </div><!-- /.navbar-nav -->

          </div><!-- /#navbarMenu -->


        </div><!-- /.navbar-inner -->
      </nav>
      <div class="main-container bgc-white">

        <div id="sidebar" class="sidebar sidebar-fixed expandable sidebar-light">
          <div class="sidebar-inner">

            <div class="ace-scroll flex-grow-1" data-ace-scroll="{}">

              <ul class="nav has-active-border active-on-right">


              


                <li class="nav-item <?php if($_SESSION['menu']=='home') echo 'active';?>">

                  <a href="home.php?app=default&lang=<?php echo detect_language(); ?>" class="nav-link">
                    <i class="nav-icon fa fa-home"></i>
                    <span class="nav-text fadeable">
                  <span>Home</span>
                    </span>


                  </a>

                  <b class="sub-arrow"></b>

                </li>
                <!-- <li class="nav-item">
                  <a href="calendar.php?app=default&lang=<?php echo detect_language(); ?>" class="nav-link">
                    <i class="nav-icon fa fa-calendar"></i>
                    <span class="nav-text fadeable">
                  <span><?php echo $_calender;?></span>
                    </span>
                  </a>
                  <b class="sub-arrow"></b>
                </li> -->
                <li class="nav-item <?php if($_SESSION['menu']=='information') echo 'active'; ?>">
                  <a href="information_list.php?app=default&lang=<?php echo detect_language(); ?>" class="nav-link">
                    <i class="nav-icon fa fa-info-circle"></i>
                    <span class="nav-text fadeable">
                  <span><?php echo $_information;?></span>
                    </span>
                  </a>
                  <b class="sub-arrow"></b>
                </li>
                <li class="nav-item <?php if($_SESSION['menu']=='contacts') echo 'active'; ?>">
                  <a href="contact_list.php?app=default&lang=<?php echo detect_language(); ?>" class="nav-link">
                    <i class="nav-icon fa fa-address-card"></i>
                    <span class="nav-text fadeable">
                  <span><?php echo $_contacts; ?></span>
                    </span>
                  </a>
                  <b class="sub-arrow"></b>
                </li>
                 <li class="nav-item <?php if($_SESSION['menu']=='users') echo 'active';?>">
                  <a href="user_list.php?app=default&lang=<?php echo detect_language(); ?>" class="nav-link">
                    <i class="nav-icon fa fa-users"></i>
                    <span class="nav-text fadeable">
                  <span><?php echo $_users;?></span>
                    </span>
                  </a>
                  <b class="sub-arrow"></b>
                </li>
              <!--  <li class="nav-item">
                  <a href="#" class="nav-link dropdown-toggle collapsed">
                    <i class="nav-icon fa fa-users"></i>
                    <span class="nav-text fadeable">
                  <span>Users</span>
                    </span>
                  <b class="caret fa fa-angle-left rt-n90"></b>
                </a>
                   <div class="hideable submenu collapse">
                    <ul class="submenu-inner">

                      <li class="nav-item">

                        <a href="user_list.php" class="nav-link">

                          <span class="nav-text">
                        <span>User List</span>
                          </span>
                        </a>
                      </li>
                      <li class="nav-item">

                        <a href="user_add.php" class="nav-link">

                          <span class="nav-text">
                        <span>Add User</span>
                          </span>
                        </a>
                      </li>
                    </ul>
                  </div>

                  <b class="sub-arrow"></b>

                </li>
              -->
                <!--<li class="nav-item">
                  <a href="#" class="nav-link dropdown-toggle collapsed">
                    <i class="nav-icon fa fa-object-group"></i>
                    <span class="nav-text fadeable">
                  <span>Groups</span>
                    </span>
                  <b class="caret fa fa-angle-left rt-n90"></b>
                </a>
                   <div class="hideable submenu collapse">
                    <ul class="submenu-inner">

                      <li class="nav-item">

                        <a href="group_list.php" class="nav-link">

                          <span class="nav-text">
                        <span>Group List</span>
                          </span>
                        </a>
                      </li>
                      <li class="nav-item">

                        <a href="group_add.php" class="nav-link">

                          <span class="nav-text">
                        <span>Add Group</span>
                          </span>
                        </a>
                      </li>
                    </ul>
                  </div>

                  <b class="sub-arrow"></b>

                </li>
              -->
               <li class="nav-item <?php if($_SESSION['menu']=='groups') echo 'active'; ?>">
                  <a href="group_list.php?app=default&lang=<?php echo detect_language(); ?>" class="nav-link">
                    <i class="nav-icon fa fa-object-group"></i>
                    <span class="nav-text fadeable">
                  <span><?php echo $_groups; ?></span>
                    </span>
                  </a>
                  <b class="sub-arrow"></b>
                </li>
                <li class="nav-item <?php if($_SESSION['menu']=='training') echo 'active';?>">
                  <a href="training_list.php?app=default&app=default&lang=<?php echo detect_language(); ?>" class="nav-link">
                    <i class="nav-icon fa fa-list"></i>
                    <span class="nav-text fadeable">
                  <span><?php echo $_training;?></span>
                    </span>
                  </a>
                  <b class="sub-arrow"></b>
                </li>
                <li class="nav-item <?php if($_SESSION['menu']=='template') echo 'active';?>">
                  <a href="template_list.php?app=default&lang=<?php echo detect_language(); ?>" class="nav-link">
                    <i class="nav-icon fa fa-list"></i>
                    <span class="nav-text fadeable">
                  <span><?php echo $_templates;?></span>
                    </span>
                  </a>
                  <b class="sub-arrow"></b>
                </li>
                <!-- <li class="nav-item">
                  <a href="settings.php?app=default&lang=<?php echo detect_language(); ?>" class="nav-link">
                    <i class="nav-icon fa fa-cog"></i>
                    <span class="nav-text fadeable">
                  <span><?php echo $_admin;?></span>
                    </span>
                  </a>
                  <b class="sub-arrow"></b>
                </li> -->
                <li class="nav-item">
                  <a href="logout.php" class="nav-link">
                   <i class="nav-icon fa fa-power-off"></i>
                    <span class="nav-text fadeable">
                  <span><?php echo $_logOut;?></span>
                    </span>
                  </a>
                  <b class="sub-arrow"></b>
                </li>
              </ul>

            </div><!-- /.sidebar scroll -->


            <div class="sidebar-section">
              <div class="sidebar-section-item fadeable-bottom">
                <div class="fadeinable">
                  <!-- shows this when collapsed -->
                  <div class="pos-rel">
                    <!-- <img alt="" src="assets/image/avatar/avatar3.jpg" width="42" class="px-1px radius-round mx-2 border-2 brc-default-m2" /> -->
                    <span class="bgc-success radius-round border-2 brc-white p-1 position-tr mr-1 mt-2px"></span>
                  </div>
                </div>

              
              </div>
            </div>

          </div>
        </div>
<script type="text/javascript">
  $(function(){
    $('.selectpicker').selectpicker();
});
</script>
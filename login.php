<?php
include 'db_connect.php';
session_start();
$login_name=$_POST['login_name'];
$password=$_POST['password'];
$login_query="select * from users where login_name='".$login_name."' and password='".$password."'";
$login_result=pg_query($db_connection,$login_query);
if ($login_result && pg_num_rows($login_result) == 1) {
	while($val  =   pg_fetch_array($login_result)){ 
		$_SESSION['logged_in']=1;
		$_SESSION['login_name']=$val['login_name'];
		$_SESSION['user_type']=$val['user_type'];
		header('location: index.php');
	}
}
else{
	header('location: index.php');
}
?>
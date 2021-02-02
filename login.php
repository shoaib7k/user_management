<?php
include 'db_connect.php';
session_start();
$_SESSION['user_in_groups']=array();
$login_name=$_POST['login_name'];
$password=$_POST['password'];
$login_query="select * from users where login_name='".$login_name."' and password='".$password."'";
$login_result=pg_query($db_connection,$login_query);
if ($login_result && pg_num_rows($login_result) == 1) {
	while($val  =   pg_fetch_array($login_result)){ 
		$_SESSION['logged_in']=1;
		$_SESSION['login_name']=$val['login_name'];
		$_SESSION['user_type']=$val['user_type'];
		$_SESSION['userid']=$val['id'];
		$user_id=$val['id'];
		
		$sql_forms2=pg_query("SELECT * FROM user_groups WHERE user_id='".$user_id."'"); //test for finding group
			$gN=0;
			
           while($val2=pg_fetch_array($sql_forms2)){
			 $gN=$gN+1;
			 $_SESSION['total_groups']=$gN; //finding total group
			 array_push($_SESSION['user_in_groups'],$val2['group_id']);
			 echo $gn;
           }
		header('location: home.php');
	}
}
else{
	header('location: index.php?msg');
}
?>
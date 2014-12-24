<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Register</title>
</head>
<body>
<form action="registrasimember.html">
</form>



<?php

include("koneksi.php");
error_reporting(0);
if (isset ($_POST['submit'])){
	$isinama = $_POST ['isinama'];
	$isiusername = $_POST ['isiusername'];
	$isipassword = $_POST ['isipassword'];
	$isiemail = $_POST ['isiemail'];
	$isikelamin = $_POST ['isikelamin'];
	$isittl = $_POST ['isittl'];
	$isialamat = $_POST ['isialamat'];
	$isikodepos = $_POST ['isikodepos'];
	$isisosialmedia = $_POST ['isisosialmedia'];
	
	if(!empty($isinama) && !empty($isiusername) && !empty($isipassword) && !empty($isiemail) && !empty($isikelamin) && !empty($isittl) && !empty($isialamat) && !empty($isikodepos) && !empty($isisosialmedia)){
	
	
	$query = ("INSERT INTO customer( NAMA_CUSTOMER, USERNAME_CUSTOMER, PASSWORD, EMAIL, JENIS_KELAMIN, TTL_CUSTOMER, ALAMAT, KODE_POS, SOSIAL_MEDIA) VALUE ('$isinama','$isiusername', '$isipassword' , '$isiemail' , '$isikelamin', 'isittl', '$isialamat' ,'$isikodepos', '$isisosialmedia')");

if (mysql_query($query, $link)===TRUE){
				echo "Database berhasil";
		}
		else{
				echo "GAGAL ".mysql_errno($link)." ".mysql_error($link);
		}
		
	}
	else {
		echo "Data tdk invalid";
	}

}

?>
</html>
</body>
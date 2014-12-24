<?php
$host_name = "localhost";
$customer_db = "root";
$password_db = "";
$nama_db = "database_sip";


$link = mysql_connect($host_name, $customer_db, $password_db);
$database = mysql_select_db($nama_db);

?>
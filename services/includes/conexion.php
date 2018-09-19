<?php
	try {
	    
		include('config.php');
		$conexion=new PDO('mysql:host='.$dbRoot.';'.'dbname='.$dbName,$dbUser,$dbPass);
		$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$conexion->exec("SET CHARACTER SET utf8");
		$conexion->query("SET GLOBAL lc_time_names = 'es_ES'");
			
	} catch(Exception $ex) {
			
		die("Error". $e->GetMessage());
			
	}
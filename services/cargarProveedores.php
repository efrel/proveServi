<?php
include('includes/funciones.php');

$sql = "SELECT * FROM proveedor";
$json = selectAll($sql,array());
$sqlImpre = "SELECT * FROM impresoras";
$jsonImpre = selectAll($sqlImpre,array());
echo json_encode(array('prov'=>$json,'impre'=>$jsonImpre));
<?php
    include('includes/funciones.php');

    $sql = "SELECT * FROM proveedor";
    $json = selectAll($sql,array());
    echo json_encode($json);
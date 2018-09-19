<?php
    include('includes/funciones.php');

    $sql = "SELECT * FROM proveedor WHERE fk_tp = 1";
    $json = selectAll($sql,array());
    echo json_encode($json);
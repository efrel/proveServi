<?php
    include('includes/funciones.php');

    $sql = "SELECT * FROM tipo_provee";
    $json = selectAll($sql,array());
    echo json_encode($json);
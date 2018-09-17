<?php
    include('includes/funciones.php');

    $sql = "SELECT * FROM impresoras JOIN detaimpre ON id_printf = fk_printf";
    $detaImpre = selectAll($sql,array());

    echo json_encode(array($detaImpre));

<?php
    include('includes/funciones.php');

    $sql = "SELECT fk_tp FROM proveedor WHERE id_pro = ?";
    $json = select($sql,array($_POST['id']));
    echo json_encode($json);
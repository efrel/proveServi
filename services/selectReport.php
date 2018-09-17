<?php
    include('includes/funciones.php');

    $periodo = explode('-', $_POST['mes']);

    $sql = "SELECT ubicacion, modelo, serie, fecha, bn_inicio, bn_final, cl_inicio, cl_final FROM impresoras JOIN detaimpre ON id_printf = fk_printf WHERE YEAR(fecha) = ? AND MONTH(fecha) = ?";
    $detaImpre = selectAll($sql,array($periodo[0], $periodo[1]));

    echo json_encode($detaImpre); 
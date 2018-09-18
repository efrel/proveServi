<?php
    include('includes/funciones.php');

    $sql="INSERT INTO detaimpre(fecha, bn_inicio, bn_final, cl_inicio, cl_final, fk_printf) VALUES(?,?,?,?,?,?)";
    insert($sql,array($_POST['fecha'],$_POST['bnInicio'],$_POST['bnFinal'],$_POST['clInicio'],$_POST['clFinal'],$_POST['impre']));
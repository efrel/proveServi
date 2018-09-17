<?php
    include('includes/funciones.php');

    $sql="SELECT * FROM impresoras";
    $impre=selectAll($sql,array());
    echo json_encode($impre);

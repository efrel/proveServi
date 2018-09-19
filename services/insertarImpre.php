<?php
    include('includes/funciones.php');

    $sql2 = "INSERT INTO impresoras(ubicacion, modelo, serie, fk_pro) VALUES(?,?,?,?)";
    insert($sql2, array($_POST['nombreImpr'],$_POST['modelo'], $_POST['serie'], $_POST['proImpresoras']));

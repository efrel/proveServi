<?php
    include('includes/funciones.php');

    $sql2 = "INSERT INTO proveedor(nombre, ubicacion, contacto, telefono, correo, fk_tp) VALUES (?,?,?,?,?,?)";
    insert($sql2, array($_POST['proveedor'], $_POST['ubicacion'], $_POST['contacto'], $_POST['numTel'], $_POST['correo'], $_POST['tipServi2']));


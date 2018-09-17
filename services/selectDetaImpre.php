<?php
    include('includes/funciones.php');

    $var = "nada";
    if (!empty($_POST["id"])) { 
      $var = $_POST['id'];
    }else{
      $sql2 = "SELECT fk_printf FROM detaimpre ORDER BY id_detaImpre desc limit 1";
      $idDeta = select($sql2, array());
      $var = $idDeta['fk_printf'];
    }

    $sql = "SELECT * FROM impresoras WHERE id_printf = ?";
    $detaImpre = select($sql,array($var));

    $sql1= "SELECT * FROM detaimpre WHERE fk_printf = ?";
    $detaImpre2 = selectAll($sql1,array($var));
    echo json_encode(array("impre"=>$detaImpre, "detaImpre"=>$detaImpre2, "var"=>$var));

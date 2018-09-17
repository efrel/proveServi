<?php
  header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
  header("Cache-Control: post-check=0, pre-check=0", false);
  header("Pragma: no-cache");

  include('includes/funciones.php');

  $file = $_FILES["file"]["name"];
  $tipo = $_FILES["file"]["type"];
  $tmp_name = $_FILES["file"]["tmp_name"];

  $char = '0123456789';
  $charLength = strlen($char);
  $ranSng = '';
  for ($i = 0; $i < 3; $i++) {
      $ranSng .= $char[rand(0,  $charLength - 1)];
  }

  $dir_subida = "./files/";
  $fichero_subido = $dir_subida.basename($ranSng.$file);

  if(!is_dir($dir_subida ))
	    mkdir($dir_subida , 0777);

  if($file && move_uploaded_file($tmp_name, $fichero_subido)){

      echo json_encode(array("ms"=>"Error al subir archivo.","archivo"=>$file));

      $sql="INSERT INTO detaimpre(fecha, bn_inicio, bn_final, cl_inicio, cl_final, name_file, fk_printf) VALUES(?,?,?,?,?,?,?)";
      insert($sql,array($_POST['fecha'],$_POST['bnInicio'],$_POST['bnFinal'],$_POST['clInicio'],$_POST['clFinal'],$ranSng.$file,$_POST['id']));
  }
  else {
      echo json_encode(array("Error al subir archivo."));
  }

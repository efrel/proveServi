<?php
	session_start();
    if(isset($_SESSION['acceso']) && $_SESSION['acceso'] == 1){
        require('index/user.tpl');
    }else{
        session_destroy();

        $user = isset($_POST["usuario"])? $_POST["usuario"] : '';
        $pass = isset($_POST["clave"])? $_POST["clave"]: '';

        validar($user, $pass);

    }

function validar($user, $pass){
    if(!empty($user) && !empty($pass)){
        $data=array();
        if($user=='ffgt' && $pass=='1234') {
            session_start();
            $_SESSION["usuario"] = $user;
            $_SESSION['acceso']=1;
            $data['department']='ict';
            $_SESSION["data"]=$data;
            header("Location: index.php");
        }else{
            header("Location: login.php");
        }
    }else{
        header("Location: login.php");
    }
    //
}
    


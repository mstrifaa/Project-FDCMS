<?php

$error='';
if(isset($_POST['submit'])){
    if(empty($_POST['id']) || empty($_POST['password'])){
        $error="ID or Password is invalid";
    }
    else{
        $id=$_POST['id'];
        $password=$_POST['password'];
        $conn = new mysqli('localhost','root','','cms');
        $query=mysqli_query($conn,"SELECT * FROM englogin WHERE id='$id' AND password='$password'");
        $rows=mysqli_num_rows($query);
        if($rows==1){
            $_SESSION['id']=$id;
            header("Location:engineer.php");
        }
        else{
            $error="ID or Password is invalid";
        }
        mysqli_close($conn);
    }
}

?>
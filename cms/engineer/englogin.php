<?php
include("engserv.php");
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Engineer Log in</title>
<?php include("loginstyle.php"); ?>
<link href="https://fonts.googleapis.com/css?family=Play" rel="stylesheet">
</head>
<body>
    <div class="popup">
        <form class="form" method="POST"> <!--changes-->
            <h1>IUT female dormitory complaint management system</h1>
            <h2 style="color: orange;">Engineer Log in</h2>
            <div class="box">
            ID
            <input type = "text" class="space" name = "id" id = "id" required = "required"><br><br>
            Password<br>
            <input type = "password" class="space" name = "password" id = "password" required = "required"><br><br>
            </div>
            <button type="submit" name = "submit" class="button" id = "submit" value = "Log in">Log in</button><br>
        </form> 
    </div>
</body>
</html>
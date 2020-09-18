<!DOCTYPE html>
<html lang="en">
<head>
  <title>Engineer| Complaint Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/half-slider.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="style.css">

  <style>

    @keyframes textanimation {
    0% {
        letter-spacing: 20px;
    }
    100% {
        letter-spacing: 1px;
    }
}

        </style>
    </head>

    <body>

        <div style="background-color: #337ab7; padding:15px">
            <p style="text-align: center; font-size: 20px; color: white; width: max-content; margin: auto; animation: textanimation 1s ease-in-out;">Female Dormitory Complaint
                Management System</p>
        </div>

        <div class="container">
            <h2>Complaint Details</h2>
            <a href="http://localhost:8080/cms/" style="float: right; color: white; background: orange; border: none;border-radius: 2px; padding: 6px 8px;">Logout</a>
            <ul class="nav nav-pills">
                
                <!--<li class="active"><a data-toggle="pill" href="#menu1">Dashboard</a></li>-->
                <li><a data-toggle="pill" href="#menu2">Complaint List</a></li>
            </ul>
            <br><br><br>


            <div class="tab-content">

                <div id="menu2" class="tab-pane fade in active">
                    <!-- database connection-->
                   <?php

                    $conn = new mysqli('localhost','root','','cms');
                    if($conn->connect_error){
                        die('Connection Failed : '.$conn->connect_error);
                    }
                    else{
                        $query = "select * from tblcomplaints";
                        $result = $conn->query($query);
                    }


                   ?>
                    <div class="container">
                        
                        <table class="table table-striped">
                             <thead>
                                <tr>
                                    <th>Complaint Number</th>
                                    <th>User ID</th>
                                    <th>Category</th>
                                    <th>Sub-category</th>
                                    <th>Complaint type</th>
                                    <th>Hall</th>
                                    <th>Room</th>
                                    <th>Complaint Details</th>
                                    <th>Preferable Time</th>
                                    <th>Reg date</th>
                                    <th>Status</th>
                                    <th>Last Update</th>

                                </tr>
                            </thead>

                            <?php
                                while ($rows=mysqli_fetch_assoc($result)) {
 
                            ?>
                            <tr>
            <td><?php echo $rows['complaintNumber'];?></td>
             <td><?php echo $rows['userId'];?></td>
             <td><?php echo $rows['category'];?></td>
             <td><?php echo $rows['subcategory'];?></td>
             <td><?php echo $rows['complaintType'];?></td>
             <td><?php echo $rows['hall'];?></td>
              <td><?php echo $rows['room'];?></td>
            <td><?php echo $rows['complaintDetails'];?></td>
            <td><?php echo $rows['pdt'];?></td>
            <td><?php echo $rows['regDate'];?></td>
            <td><?php echo $rows['status'];?></td>
            <td><?php echo $rows['lastUpdationDate'];?></td>
            <td class="text-right" >
            
        </td>
        </tr>

                        <!-- code to save the status
                                 using ajax can be helpful -->
                         


                        
                        <?php
                            }
                        ?>
</table>
                    </div>
                </div>


                
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>




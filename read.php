<?php 

include "2.php";



$sql = "SELECT sid,fname,mname,lname,dob,religion,classno,sec FROM  student order by classno,sec";

$result = $conn->query($sql);

?>

<!DOCTYPE html>

<html>

<head>

    <title>View student</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

</head>

<body>

    <div class="container">
       <button class='C'><a class="A" href="create.php">HOME</a></button>
        <button class='C'><a class="A" href="dup.php">QUERY INTERFACE SELECT</a></button>
        <button class='C'><a class="A" href="queries.php">QUERY INTERFACE DELETE INSERT</a></button>
        <hr style="background-color: red;height: 2px;border: none;margin:0">
        <h2>STUDENT DETAILS</h2>
        
        


<table class="table">

    <thead>

        <tr>

        <th>SID</th>

        <th>First Name</th>
        <th>Middle name</th>

        <th>Last Name</th>
        <th>Religion</th>

        <th>DOB</th>
        
        

        <th>class</th>

        <th>sec</th>

    </tr>

    </thead>

    <tbody> 

        <?php

            if (mysqli_num_rows($result)) {

                while ($row = mysqli_fetch_assoc($result)) {

        ?>

                    <tr>

                    <td><?php echo $row["sid"]; ?></td>

                    <td><?php echo $row["fname"]; ?></td>
                    <td><?php echo $row["mname"]; ?></td>


                    <td><?php echo $row["lname"]; ?></td>

                    <td><?php echo $row["religion"]; ?></td>

                    <td><?php echo $row["dob"]; ?></td>
                    <td><?php echo $row["classno"]; ?></td>
                    <td><?php echo $row["sec"]; ?></td>


                    <td><a class="btn btn-info" href="update.php?id=<?php echo $row['sid']; ?>">Edit</a>&nbsp;<a class="btn btn-danger" href="delete.php?id=<?php echo $row['sid']; ?>">Delete</a></td>

                    </tr>                       

        <?php       }

            }

        ?>                

    </tbody>

</table>

    </div> 
   

</body>

</html>
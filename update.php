<?php 

include "2.php";





    $sid1 =$_GET["id"] ; 

    $sql = "SELECT * FROM student WHERE sid= '$sid1' ";

    $result = $conn->query($sql); 
    if($result)
    { 
        if ($result->num_rows> 0)
         {
            
            while ($row = $result->fetch_assoc()) {
                
                $first_name = $row['fname'];

                $middle_name = $row['mname'];
    
                $lastname = $row['lname'];
    
                $religion = $row['religion'];
    
                $date = $row['dob'];
    
                $classno = $row['classno'];

                $sec = $row['sec'];
    
                $id = $row['sid'];
    
            } 






        }      
        else
        { 
            echo "No record found";
        } 
    }   
    
    else
    { 
        echo "Error in ".$query." ".$conn->error; 
    }
?>
<html>
    <title> UPDATE</title>
    <head>
        <style>
            .header{
  width: 100%;
  background-color: darkred;
  font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
  text-align: center;
}
.example {background-color: #de5d83 ; }
            </style>

</head>

<body>
    <div class='header'>
<marquee behavior="scroll"  scrollmount="400">
<h2  style="color:white">UPDATING VALUES </h2>
</marquee>
</div>
<div class="example">
<form action="" method="post">
<fieldset>
<legend>Update Student  information:</legend>
<label style='color:white'>FIRST NAME</label><br>

<input type="text" name="firstname" value="<?php echo $first_name; ?>">
<input type="hidden" name="user_id" value="<?php echo $id; ?>">

<br>

<label style='color:white'>MIDDLE NAME</label><br>
<input type="text" name="middlename" value="<?php echo $middle_name; ?>">
<br>


<label style='color:white'>LAST NAME</label><br>
<input type="text" name="lastname" value="<?php echo $lastname; ?>">
<br>

<label style='color:white'>RELIGION</label><br>
<input type="text" name="religion" value="<?php echo $religion; ?>">
<br>

<label style='color:white'>date of birth</label><br>
    <input type="date" name='date' value="<?php echo $date; ?>"  >

    <br>

    <label style='color:white'>CLASS</label><br>

    <input type="number" id="quantity" name="classno" min="5" max="10" value="<?php echo $value="<?php echo $classno; ?>"; ?>">


    <br>

    <label style='color:white'>SECTION</label><br>

    <input type="radio" name="sec" value="A" <?php if($sec == 'A'){ echo "checked";} ?>>A

    <input type="radio" name="sec" value="B" <?php if($sec == 'B'){ echo "checked";} ?>>B

    <input type="radio" name="sec" value="C" <?php if($sec == 'C'){ echo "checked";} ?>>C
    <br>

    <br>

            <input type="submit" value="Update" name="update">
</div>
</body>

            </html>

        <?php
         if (isset($_POST['update'])) {

            $firstname = $_POST['firstname'];
    
            $user_id = $_POST['user_id'];

            $middlename = $_POST['middlename'];
    
            $lastname = $_POST['lastname'];
    
            $religion1 = $_POST['religion'];

            $date = $_POST['date'];

            $classnumber = $_POST['classno'];
            $sec1= $_POST['sec'];

    
            $sql = "UPDATE student SET fname='$firstname',mname='$middlename',lname='$lastname',religion='$religion1',dob='$date',classno='$classnumber',sec='$sec1' WHERE sid='$user_id'"; 
    
            $result = $conn->query($sql); 
    
            if ($result == TRUE) {
    
                echo "Record updated successfully.";
    
            }else{
    
                echo "Error:" . $sql . "<br>" . $conn->error;
    
            }
    
        } 










?>
        

          </fieldset>

        </form> 
        <button><a class="B" href="read.php">DETAILS ABOUT STUDENT</a></button>
        </body>

        </html> 








     
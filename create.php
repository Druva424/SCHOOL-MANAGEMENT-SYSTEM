

<!DOCTYPE html>

<html>
  <title> SCHOOL MANAGEMENT SYSTEM </title>
  <style>


.example {background-color: #de5d83 ; }

.header{
  width: 964;
  background-color: darkred;
  font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
  text-align: center;
}

.tailer
{
  background: url('"https://th.bing.com/th/id/OIP.S2JVTaZnsoSyJ6GBtklZAwHaEM?w=285&h=180&c=7&r=0&o=5&dpr=1.9&pid=1.7"') no-repeat;
  background-size: 100%;

}
.B
{
  margin: 0;
  display:inline;
  background-color: maroon;
  color:white;
  padding-left: 50;
  margin:0px 500px 0px 0px;


}

.C
{
  margin: 0;
  display:inline;
  background-color:maroon;
  color:white;
  padding: 50;
 

}
.A{

  color: white;
  text-decoration:none;
}
.title{
  display:inline;
  margin:0px 665px 0px 0px;


}



  </style>

<body>
<div class='header'>
<marquee  scrollmount="20">
<h2 style="color:white" >ADMISSION OPEN </h2>
</marquee>
</div>
<div class="example">
<form action="" method="POST" >

  <fieldset>

    <legend>Student information</legend>

    <label style="color:white">STUDENT ADMISSION ID:</label><br>

    <input type="text" name="sid">

    <br>


    <label style="color:white">FIRST NAME</label><br>

    <input type="text" name="firstname">

    <br>

    <label style="color:white"> MIDDLE NAME</label><br>

    <input type="text" name="middlename">

    <br>

    <label style="color:white">LAST NAME</label><br>

    <input type="text" name="lastname">

    <br>

    <label style="color:white">RELIGION</label><br>

    <input type="text" name="religion">

    <br>

<label style="color:white">date of birth</label><br>
    <input type="date" name='date' >

    <br>

    <label style="color:white">CLASS</label><br>

    <input type="number" id="quantity" name="classno" min="8" max="10">


    <br>

    <label style="color:white">SECTION</label><br>

    <input type="radio" name="sec" value="A"> <label style="color:white"> A</label>

    <input type="radio" name="sec" value="B"> <label style="color:white">B</label>

    <input type="radio" name="sec" value="C"> <label style="color:white">C</label>

    
    
    <br>

    <input type="submit" name="submit" value="submit">

  </fieldset>

</form>
</div>
<div class='tailer'>

<?php 

include "2.php";


  if (isset($_POST['submit'])) {

    $sid1 = $_POST['sid'];
    $first_name = $_POST['firstname'];
    $mname_name = $_POST['middlename'];

    $last_name = $_POST['lastname'];

    $religion1 = $_POST['religion'];

    $date = $_POST['date'];

    $classnumber = $_POST['classno'];
    $sec1= $_POST['sec'];

    $sql = "INSERT INTO student (sid,fname,mname,lname,religion,dob,classno,sec) VALUES ('$sid1','$first_name', '$mname_name','$last_name','$religion1','$date','$classnumber','$sec1')";

    $result = $conn->query($sql);

    if ($result == TRUE) {

      echo "New record created successfully.";

    }else{

      echo "Error:". $sql . "<br>". $conn->error;

    } 

    $conn->close(); 

  }

?>
<div class='trav'>
<button class='B'><a class="A" href="read.php">DETAILS ABOUT STUDENT</a></button>
<h3 class='title' style="color:red"> SCHOOL MANAGEMENT SYSTEM</h3>
<button class='C'><a class="A" href="dup.php">QUERY INTERFACE</a></button>
</div>




<img src='https://th.bing.com/th/id/OIP.y5yXqbpuOt7g21iYih0oWwHaEQ?w=326&h=187&c=7&r=0&o=5&dpr=1.9&pid=1.7' width=100% height=426>


</div>

</body>

</html>
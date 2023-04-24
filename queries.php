<html>
  <head>
  <style>


.header{
  width: 100%;
  background-color: darkred;
  font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
  text-align: center;
}
</style>
</head>
<body>
<title> QUERY INTERFACE DELETE AND INSERT</title>
<div class='header'>
<marquee  scrollmount="20">
<h2 style="color:white" >WELCOME ADMIN </h2>

</marquee>

</div>
<button class='C'><a class="A" href="create.php">HOME</a></button>
<button class='C'><a class="A" href="read.php">READ</a></button>
<button class='C'><a class="A" href="dup.php">QUERY INTERFACE SELECT</a></button>

<hr>



<form action="" method="post" >
<!-- <input id="sql" name="sql" rows="4" cols="50"></textarea> -->
<input name="value" style="height:20px; width:1700px;">
<!-- <input type="submit" value="submit"> -->
<button type="submit" name="value2">Take value</button>
</form>

<?php
include "2.php";

if (isset($_POST['value2'])) {
    echo "I am here" ;
    $sql = $_POST['value'];


    $result = $conn->query($sql);

    if ($result)  {
       

        
      
        echo "Query operation successfully.";

        }
    else
    {

      echo "Error:". $sql . "<br>". $conn->error;

    } 

    $conn->close(); 

  }


?>

</body>


</html>

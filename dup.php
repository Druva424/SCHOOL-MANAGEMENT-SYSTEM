<html>
  <head>
  <link rel="stylesheet" href="https://unpkg.com/purecss@2.0.6/build/pure-min.css"integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5"crossorigin="anonymous">
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
  <title> QUERY INTERFACE ONLY FOR SEARCH OPERATION </title>
 
<div class='header'>
<marquee  scrollmount="20">
<h2 style="color:white" >WELCOME ADMIN </h2>

</marquee>

</div>
<button class='C'><a class="A" href="create.php">HOME</a></button>
<button class='C'><a class="A" href="read.php">READ</a></button>
<button class='C'><a class="A" href="queries.php">QUERY INTERFACE DELETE INSERT</a></button>
<hr>


<form action="" method="post" >
<!-- <input id="sql" name="sql" rows="4" cols="50"></textarea> -->
TYPE YOUR QUERIES HERE:<input name="value" style="height:20px; width:1700px;">
<!-- <input type="submit" value="submit"> -->
<button type="submit" name="value2">Take value</button>
</form>

<?php
include "connection.php";

if (isset($_POST['value2'])) {
   
    $sql = $_POST['value'];


    $result = $conn->query($sql);

    if ($result)  {

        echo"<table class='pure-table pure-table-horizontal'> <thead> <tr>";
        while(($field = mysqli_fetch_field($result)))
{       
         echo"<th>$field->name</th>";
        
}

     echo"</tr></thead>";
     echo"<tbody>";
        if (mysqli_num_rows($result)) 
        {

        while ($row = mysqli_fetch_assoc($result))
           { echo"<tr>";
            foreach ($row as $r) {
                echo"<td>$r</td> ";
            }
            echo"</tr>";
            
           


            }
        echo"</tbody></table>";
        echo "Query operation successfully.";

        }
    else
    {

      echo "Error:". $sql . "<br>". $conn->error;

    } 

    $conn->close(); 

  }
}

?>

</body>


</html>



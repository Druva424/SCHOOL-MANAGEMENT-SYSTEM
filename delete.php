<?php 

include "2.php"; 

if (isset($_GET['id'])) {

    $user_id = $_GET['id'];

    $sql = "DELETE FROM student  WHERE sid='$user_id'";

     $result = $conn->query($sql);

     if ($result == TRUE) {

        echo "Record deleted successfully.";

    }else{

        echo "Error:" . $sql . "<br>" . $conn->error;

    }

} 

?>
<html>
<body>
<a class="B" href="read.php">DETAILS ABOUT STUDENT</a>
<a class="C" href="create.php">ADMIT NEW STUDENTS</a>
</body>
</html>



     
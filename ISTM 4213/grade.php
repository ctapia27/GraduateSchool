<!DOCTYPE html>
<html>
<?php
$selected_student = $_POST['student'];
echo "Student Name: $selected_student";

$stu_grades= array(
    array('George', 'A'),
    array('James', 'B'),
    array('Ruth', 'A'),
    array('John', 'C')
);
echo "<br>";
foreach($stu_grades as $grade){
    $i = 0;
    if($grade[$i] == $selected_student){
        echo "Grade: $grade[1]";
        $i = $i+1; 
    };
};
?>
</html>
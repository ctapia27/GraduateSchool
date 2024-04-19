<?php
/*
Filename:assignment_6.php
Name: Carla Tapia
*/
/*creating the array */
$istm = array(6201, 6202, 6204, 6205, 6206, 6209, 6210);
/*calling the 4th course in the array (4-1 = 3)*/
echo $istm[3]
?>

<?php
$courses = array(
    /*making the array*/
    array("CourseNo", "Title", "Instructor"),
    array(6201, "Info Sys Development", "Dasgupta"),
    array(6202, "Database Management", "Park"),
    array(6204, "Project Management", "Carayannis"),
    array(6205, "Web App Development", "Chen"),
    array(6206, "Security", "White"),
    array(6209, "Web and Social", "Duan")
);
/*3rd course = project management, which is in the 3rd row (don't include title since it is not a course name)*/
/*title of the course is in column 1 (2-1 =0)*/
echo $courses[3][1]
?>
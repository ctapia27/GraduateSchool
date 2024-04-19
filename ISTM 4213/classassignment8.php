<!DOCTYPE html>
<html>
<form action="grade.php" method="POST">
    <fieldset>
        <legend>Student Grades</legend>
        <p>
            <label>Student</label>
            <select name='student'>
                <?php
                $student = array('George', 'James', 'Ruth', 'John');
                foreach($student as $value){
                    echo "<option value= '$value'>$value</option>";
                }
                ?>
            </select>
            </label>
            </p>
<input type='submit'>
</fieldset>
</form>
</html>
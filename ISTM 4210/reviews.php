<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <ul>
            <li><a class="active" href="./index.html">RateMyDorm</a></li>
            <li><a href="./index.html">Home</a></li>
            <li><a href="./reviews.php">Reviews</a></li>
            <li><a href="./signUp.html">Sign Up</a></li>
        </ul>

        <div class="homeBody">
            <h1>Reviews</h1>
            <h3>George Washington University</h3>
            <h3>Check out reviews for the following dorm buildings:</h3>
            
                <div class='collapsibleContainer'>
                <button type="button" class="collapsible">South Hall</button>
                <div class="content">
                    <p> About:<br> 9 Residential Floors. <br>
                        4-Person 4-bedroom (74%)
                        5-Person 5-bedroom (17%)
                        4-Person 3-bedroom (8%)<br>

                        Apartment style rooms with kitchen facilites, washer and dryer, and one or two private bathrooms in each unit.
                        Community room and study room located on the first floor.
                        Two levels of parking located below the building.
                        All rooms come furnished with a Twin XL bed/bed frame, desk/desk chair, and two dressers for each resident.
                        </p>
                    <img src="./images/south.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";                    
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'South Hall'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    }
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">District House</button>
                <div class="content">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <img src="images/DistrictHouse.jpeg" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'District House'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    }
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">Shenkman Hall</button>
                <div class="content">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <img src="images/shenkman.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'Shenkman Hall'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    }
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">1959 E St.</button>
                <div class="content">
                    <p>About: <br><br></p>
                <img src="images/1959est.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == '1959 E St.'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    } 
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">2109 F St.</button>
                <div class="content">
                    <p>About: <br><br></p>
                <img src="images/2109fst.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == '2109 F St.'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    } 
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">The Dakota</button>
                <div class="content">
                    <p>About: <br><br></p>
                <img src="images/dakota.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'The Dakota'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    } 
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">FSK Hall</button>
                <div class="content">
                    <p>About: <br><br></p>
                <img src="images/fsk.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'FSK Hall'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    } 
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">Fulbright Hall</button>
                <div class="content">
                    <p>About: <br><br></p>
                <img src="images/fulbright.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'Fulbright Hall'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    } 
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">International House</button>
                <div class="content">
                    <p>About: <br><br></p>
                <img src="images/ihouse.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'International House'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    } 
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">JBKO Hall</button>
                <div class="content">
                    <p>About: <br><br></p>
                <img src="images/jbko.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'JBKO Hall'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    } 
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">Mitchell Hall</button>
                <div class="content">
                    <p>About: <br><br></p>
                <img src="images/mitchell.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'Mitchell Hall'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    } 
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">Munson Hall</button>
                <div class="content">
                    <p>About: <br><br></p>
                <img src="images/munson.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'Munson Hall'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    } 
                    $conn->close();
                    ?>
                </div>
                <button type="button" class="collapsible">Philip Amsterdam Hall</button>
                <div class="content">
                    <p>About: <br><br></p>
                <img src="images/amdam.png" width="30%" style="padding-top: 10px;"><br>
                    <?php
                    $servername = "carlaistm.shop";
                    $username = "Carla";
                    $password = "&5hBg6d^~{A{";
                    $dbname = "dorm_reviews";
                    
                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                      die("Connection failed: " . $conn->connect_error);
                    }
                    
                    $sql = "SELECT FIRST_NAME, LAST_NAME,EMAIL,DORM,REVIEW FROM student_review";
                    $result = $conn->query($sql);
                    
                    if ($result->num_rows > 0) {
                      // output data of each row
                      while($row = $result->fetch_assoc()) {
                        if($row['DORM'] == 'Philip Amsterdam Hall'){
                            echo "Name: " . $row["FIRST_NAME"]. " " . $row["LAST_NAME"].  "
                            <br>Review: " . $row["REVIEW"]. "<br><br>";
                        }
                      }
                    } 
                    $conn->close();
                    ?>
                </div>
            </div>
        </div>

        <script>
            var coll = document.getElementsByClassName("collapsible");
            var i;
            
            for (i = 0; i < coll.length; i++) {
              coll[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var content = this.nextElementSibling;
                if (content.style.display === "block") {
                  content.style.display = "none";
                } else {
                  content.style.display = "block";
                }
              });
            }
            </script>

    </body>
</html>
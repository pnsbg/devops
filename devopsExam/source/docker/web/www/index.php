<?php
$username = 'vagrant';
$password = 'vagrant';

//connect to DB 
$dbConn = mysql_connect('10.10.10.14', $username, $password, true) or die('Connection: ' . mysql_error());
mysql_select_db('devops', $dbConn) or die(mysql_error());
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <title>Login</title>
    </head>
    <body>
        <form name="input" action="" method="post">
            Username:<input type="text" value="" name="username" /><br>
            Password:<input type="password" value=""name="password" /><br>
            <input type="submit" value="submit" name="submit" />
        </form>

        <?php
        if (isset($_POST['submit'])) {
            $getUser = "SELECT * FROM users WHERE username = '" . $_POST['username'] . "' AND password = '" . $_POST['password'] . "'";
            $getUserQuery = mysql_query($getUser) or die('$getUser: ' . mysql_error());

            if (mysql_num_rows($getUserQuery) != '0') {
                $getUserResult = mysql_fetch_assoc($getUserQuery);
                $username = $getUserResult['fullname'];

                $getContent = "SELECT * FROM content";
                $getContentQuery = mysql_query($getContent) or die('$getContent: ' . mysql_error());
                ?>
                <h1>Hello <?php echo $username; ?></h1>
                <br>
                <br>
                Your site content:
                <?php
                while ($getContentResult = mysql_fetch_assoc($getContentQuery)) {
                    ?>
                    <h2><?php echo $getContentResult['title']; ?></h2><br>
                    <h2><?php echo $getContentResult['content']; ?></h2><br>
                    <hr>
                    <?php
                }
            }
        }
        ?>
    </body>
</html>
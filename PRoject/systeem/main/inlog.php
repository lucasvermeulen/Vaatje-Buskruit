<?php
//dit is het inlog scherm
include('../html/header.php')

?>
<div id=inlog_container>
    <div id='inlog_function' class="inlog"'>
    <form action="./inloggen.php" method="POST">
        inlognaam:<br><input id='login_input' type="text" name="inloggen" size="25"><br>
        wachtwoord:<br><input id='login_input'type="password" name="password" size="25"><br>
        <input id='login_submit' type="submit" name="submit" value="Log In">

    </form>
</div>
</div>
<?php
    include('../html/footer.php');

?>

<?php

session_start();
session_unset($_SESSION['nombres']);
session_destroy();

header('Location: ../PROYECTO-WEB-MARNET-GRUPAL/Index.html');

?>
<?php

$con = mysqli_connect("localhost", "root", "", "pimsdb");

if (mysqli_connect_error()) {
    echo 'Error db connection' . mysqli_connect_error();
}

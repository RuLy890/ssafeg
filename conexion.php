<?php 
$servername = "localhost";
$username = "u557447082_9x8vh";
$password ="~s0yVXwZZ";

/*
$dbname = "u557447082_safegardedb";
$conexion = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}


USAR ESTE SOLO PARA PRUEBAS LOCALES 
*/

$servername = "localhost";
$username = "root";
$password = "RuLy8902621";
$dbname = "safegar";
$conexion = new mysqli($servername, $username, $password, $dbname);
if ($conexion->connect_error) {
    die("Conexion fallida" . $conexion->connect_error);
}

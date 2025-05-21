<?php
session_start();
include 'conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $correo = trim($_POST['correo']);
    $clave = $_POST['clave'];

    // Buscar si el usuario existe
    $query = "SELECT * FROM usuarios WHERE correo_electronico = ?";
    $stmt = mysqli_prepare($conexion, $query);
    mysqli_stmt_bind_param($stmt, "s", $correo);
    mysqli_stmt_execute($stmt);
    $resultado = mysqli_stmt_get_result($stmt);

    if ($usuario = mysqli_fetch_assoc($resultado)) {
        // Verificar si la contraseña es correcta
        if (password_verify($clave, $usuario['contrasena'])) {
            $_SESSION['usuario'] = $usuario['nombre_completo'];

            echo '<script>
                alert("Inicio de sesión exitoso. Bienvenido, ' . $usuario['nombre_completo'] . '");
                window.location = "dashboard.php"; 
            </script>';
        } else {
            echo '<script>
                alert("Contraseña incorrecta.");
                window.location = "login.html";
            </script>';
        }
    } else {
        echo '<script>
            alert("El correo no está registrado. Por favor, crea una cuenta.");
            window.location = "login2.html";
        </script>';
    }

    mysqli_stmt_close($stmt);
    mysqli_close($conexion);
} else {
    echo '<script>
        alert("Acceso no permitido.");
        window.location = "login.html";
    </script>';
}
?>

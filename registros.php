<?php
include 'conexion.php'; // Importa la conexión como $conexion

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = trim($_POST['nombre_completo']);
    $correo = trim($_POST['correo_electronico']);
    $contrasena = $_POST['contrasena'];
    $acepta = isset($_POST['acepta_politica']) ? 1 : 0;

    // Validación de correo
    if (!filter_var($correo, FILTER_VALIDATE_EMAIL)) {
        echo '<script>alert("Correo inválido."); history.back();</script>';
        exit;
    }

    // Validación de contraseña
    if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/', $contrasena)) {
        echo '<script>alert("La contraseña debe tener al menos 8 caracteres, una mayúscula, una minúscula y un número."); history.back();</script>';
        exit;
    }

    // Encriptar la contraseña
    $contrasena_hashed = password_hash($contrasena, PASSWORD_DEFAULT);

    // Consulta preparada
    $query = "INSERT INTO usuarios (nombre_completo, correo_electronico, contrasena, acepta_politica) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conexion, $query); // Usar $conexion aquí

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "sssi", $nombre, $correo, $contrasena_hashed, $acepta);
        $ejecutar = mysqli_stmt_execute($stmt);

        if ($ejecutar) {
            echo '<script>
                alert("Registro exitoso.");
                window.location = "login.html";
            </script>';
        } else {
            echo '<script>
                alert("Error al registrar. Intenta de nuevo.");
                history.back();
            </script>';
        }

        mysqli_stmt_close($stmt);
    } else {
        echo '<script>alert("Error al preparar la consulta."); history.back();</script>';
    }

    mysqli_close($conexion);
} else {
    echo '<script>alert("Acceso no permitido."); window.location = "login2.html";</script>';
}
?>

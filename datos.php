<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset=UTF-8>
    <title>Envío datos</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <div class="content">
        <header class="header__logo-and-navbar">
            <div id="div__bisontes-logo">
                <img src="imagenes/logo2.png" alt="Bisontes Industrial Park Logo" id="bisontes-logo">
            </div>
            <nav class="nav-bar">
                <ul>
                    <li><a href="index.html">Inicio</a></li>
                    <li><a href="contacto.html">Contacto</a></li>
                    <li><a href="historia.html">Historia</a></li>
                    <li><a href="informacion.html">Información</a></li>
                    <li><a href="registrate.html">Regístrate</a></li>
                </ul>
            </nav>
        </header>

        <main class="main">
            <div class="contacto-information-container">
                <div class="contacto-container">
                    <?php

                    include('php/consultaBD.php');

                    $consulta = "SELECT * from cliente";
                    consultaBD($consulta);
                    $encontrado = 0;
                    while ($mostrar = mysqli_fetch_array($resultado)) {

                        if ($mostrar['telefono'] == $_POST['telefono']) {

                            $encontrado = 1;
                        }
                    }

                    if ($encontrado == 0) {

                        $nombreEmp = $_POST['nombreEmp'];
                        $telefono = $_POST['telefono'];
                        $correo = $_POST['correo'];
                        $industria = $_POST['industria'];



                        $consulta = "INSERT INTO cliente (empresaNom, telefono, correo, industria) VALUES ('$nombreEmp','$telefono','$correo','$industria')";

                        if (ConsultaBD($consulta)) {
                            echo "Los siguientes datos han sido guardados:<br>";
                            echo "Nombre Empresa: " . $nombreEmp . "<br>";
                            echo "Teléfono: " . $telefono . "<br>";
                            echo "Correo: " . $email . "<br>";
                            echo "Industria: " . $mensaje . "<br>";
                        } else
                            echo "Error al guardar los datos";
                    } else {
                        echo "Error, ya hay un contacto registrado con tus datos";
                    }

                    ?>
                </div>
            </div>
        </main>

    </div>
</body>

</html>
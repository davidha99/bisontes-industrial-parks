<?php



define("cServidor","localhost");
define("cUsuario","bisontes");
define("cClave","bisontes");
define("cBd","bisontes");

function consultaBD($consulta){
$conexion = mysqli_connect(cServidor,cUsuario,cClave,cBd);
global $resultado;
$resultado = mysqli_query($conexion,$consulta);

if($resultado){
mysqli_close($conexion);
return $resultado;
}
else{
mysqli_close($conexion);
return FALSE;
}

}

?>
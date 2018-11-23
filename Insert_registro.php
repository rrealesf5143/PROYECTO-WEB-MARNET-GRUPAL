<?php
//include("Conexion.php");
	
    $usuario = "root";
	$password = "servidor";
	$servidor = "localhost";
	$basededatos = "MARNET";
	
	$conexion = mysqli_connect( $servidor, $usuario, $password ) or die ("No se ha podido conectar al servidor de Base de datos");
	// Selección del a base de datos a utilizar
	$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues va a ser que no se ha podido conectar a la base de datos" );

	//@mysqlI_query("SET NAMES 'utf8'");
	
$nombres  = $_POST["nombres"];
$primape  = $_POST["primapellido"];
$secape   = $_POST["secapellido"];
$tipodoc  = $_POST["tipdoc"];
$identif  = $_POST["identificacion"];
$fechanac = $_POST["fechanacimiento"];
$email    = $_POST["correoelectr"];
$celular  = $_POST["celular"];
$pass     = $_POST["Pass"];
$genero   = $_POST["genero"];
	


echo ' <p>'.$nombres.' '.$primape.' '.$secape.' '.$tipodoc.' '.$identif.' '.$fechanac.' '.$email.' '.$celular.' '.$pass.'</p>' ;


//Preparamos la orden SQL
$consulta = "INSERT INTO clientes
(
tipo_identificacion
,identificacion
,nombres
,Primer_Apellido
,Segundo_Apellido
,fecha_nacimiento
,genero
,numero_celular
,Email
,password
) VALUES (
'$tipodoc','$identif','$nombres','$primape','$secape','$fechanac','$genero','$celular','$email','$pass'
)";

//Aqui ejecutaremos esa orden

$resultado = mysqli_query( $conexion, $consulta );



if(!$resultado){
echo'<h1>Hubo un error   '.$consulta.'</h1>';
}else {
			echo'<h1>Datos Guardados con exito</h1><p>'.$nombres.' '.$primape.' '.$secape.' '.$tipodoc.' '.$identif.' '.$fechanac.' '.$email.' '.$celular.' '.$pass.'</p>';
			}
	



mysqli_close( $conexion );

?>
function valida_formulario()
{

	campo_nombres=document.getElementById("nombres").value;
	campo_apellido1=document.getElementById("primapellido").value;
	campo_apellido2=document.getElementById("secapellido").value;
	campo_identif=document.getElementById("identificacion").value;
	campo_fecnac=document.getElementById("fechanacimiento").value;
	campo_mail=document.getElementById("correoelectr").value;
	campo_celular=document.getElementById("celular").value;
    campo_fecnaci=document.getElementById("fechanacimiento").value;
 	var fecha = new Date();
	var a = 0;

	if(campo_nombres==null || campo_nombres.length == 0 || /^\s+$/.test(campo_nombres))
	{
		alert("Por Favor diligencie sus Nombres.");
		return false;
	
	}
	else if (campo_apellido1==null || campo_apellido1.length == 0 || /^\s+$/.test(campo_apellido1))
	{
	alert("Por Favor diligencie su Primer Apellido.");
	return false;	
	}
	else if (campo_apellido2==null || campo_apellido2.length == 0 || /^\s+$/.test(campo_apellido2))
	{
	alert("Por Favor diligencie su Segundo Apellido.");
	return false;	
	}
	else if (isNaN(campo_identif) || campo_identif==null || campo_identif.length == 0 || /^\s+$/.test(campo_identif) )
	{
	alert("Por Favor diligencie un numero valido, sin puntos, comas, letras o caracteres especiales..");
	return false;	
	}
	
	else if (campo_fecnac=null || campo_fecnac.length == 0)
	{
			alert("Por Favor diligencie una fecha de nacimiento del calendario");
			return false;	
				//alert("La fecha de nacimiento es: " + campo_fecnac + " Y el dìa de hoy es: " + fecha.getFullYear() + "-" + (fecha.getMonth() +1) + "-" + fecha.getDate());
	}

	
	else if( !(/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)/.test(campo_mail)) ) {
  		alert("Por favor diligencie una cuenta de correo valida");	
  		return false;
		}
	else if (isNaN(campo_celular) || campo_celular==null || campo_celular.length == 0 ||  !(/^\d{10}$/.test(campo_celular)))
	{
	alert("Por Favor diligencie un numero valido, sin puntos, comas, letras, números repetidos consecutivos  o caracteres especiales.");
	return false;	
	}
		else if (campo_fecnaci!=null)
		{
			
					var fechaactual = new Date();
					var datenac = new Date(campo_fecnaci).getTime();
					var dateactual = new Date(fecha.getFullYear() + "-" + (fecha.getMonth() +1) + "-" + fecha.getDate()).getTime();
				    
					var diff =  dateactual-datenac;
				 	while(parseInt((diff/(1000*60*60*24))/365)<18)
				 	{
				 	    alert("No tienes la edad suficiente para registrarte, tu edad es: " + parseInt((diff/(1000*60*60*24))/365) + " La edad minima para registrar es 18.");
				 	    a+=1;
				 	    return false;	
				 	}
	    }

else
	 return true;


}
function alerta()
    {
    var mensaje;
    var opcion = confirm("Clicka en Aceptar o Cancelar");
    if (opcion == true) {
        mensaje = "Has clickado OK";
		} else {
		    mensaje = "Has clickado Cancelar";
		}
		document.getElementById("ejemplo").innerHTML = mensaje;
}

function valida_edad()
{
 campo_fecnac=document.getElementById("fechanacimiento").value;
 	var fecha = new Date();
	var a = 0;
 if (campo_fecnac!=null)
		{
			
					var fechaactual = new Date();
					var datenac = new Date(campo_fecnac).getTime();
					var dateactual = new Date(fecha.getFullYear() + "-" + (fecha.getMonth() +1) + "-" + fecha.getDate()).getTime();
				    
					var diff =  dateactual-datenac;
				 	while(parseInt((diff/(1000*60*60*24))/365)<18)
				 	{
				 	    alert("No tienes la edad suficiente para registrarte, tu edad es: " + parseInt((diff/(1000*60*60*24))/365));
				 	    a+=1;
				 	    return false;	
				 	}
	    }
	else return true;	
 

}


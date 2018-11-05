function ActualizarHora(){
    var fecha = new Date();
    var segundos = fecha.getSeconds();
    var minutos = fecha.getMinutes();
    var horas = fecha.getHours();
 
    var elementoHoras = document.getElementById("pHoras");
    var elementoMinutos = document.getElementById("pMinutos");
    var elementoSegundos = document.getElementById("pSegundos");
    var pSaludo = document.getElementById("pSaludo");
 
    elementoHoras.textContent = horas;
    elementoMinutos.textContent = minutos;
    elementoSegundos.textContent = segundos;
    
 
    if (horas >= 8 && minutos >= 1 && horas < 12) {
        pSaludo.textContent = "Buenos días";
    }
    if (horas >= 12 && minutos >= 1 && horas < 19) {
        pSaludo.textContent = "Buenas tardes";
    }
    if (horas >= 19 && minutos >= 1) {
        pSaludo.textContent = "Buenas noches";
    }
}
 
setInterval(ActualizarHora,1000);
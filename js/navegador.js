function navegador(){
      var agente = window.navigator.userAgent;
      var navegadores = ["Chrome", "Firefox", "Safari", "Opera", "Trident", "MSIE", "Edge"];
      for(var i in navegadores){
          if(agente.indexOf( navegadores[i]) != -1 ){
              return navegadores[i];
          }
      }
  }
  var browser = document.getElementById("navegador");
  window.onload = function(){
  browser.textContent = "El navegador es: "+ navegador();
  }
<!doctype html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Marnet</title>
      <meta name="description" content="Blog para Moteros">
      <meta name="keywords" content="html,css,xml,javascript,Motos,y mas motos">
      <meta name="author" content="Carlos Granados">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="shortcut icon" href="imagenes/MarnetLogo.png" />
    <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">-->
      <style>
          .slider{
              background: url("imagenes/escritorio4.jpg");
              background-size: cover;
              background-position: center;
              height: 400px;
          }
      </style>
      <script >
        function valida_formulario()
                      {
                        campo_nombres=document.getElementByid('nombres').value;

                        alert(campo_nombres);

                        if(campo_nombres==null || valor.length == 0 || /^\s+$/.test(valor))
                              {
                                alert('Por Favor diligencie sus Nombres.');
                                return false;
                              }
                              return true;


                      }
      </script>
  </head>
  <body>
    <!-- menu -->
      <div class="container-fluid bg-dark fixed-top text-center">
          <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-dark bg-dark">
              <a class="navbar-brand" href="#">
                <img src="imagenes/favicon_marnet.png" width="35" height="35" class="d-inline-block align-top" alt="">
                Somos Marnet
              </a>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse" id="  ">
                <div class="navbar-nav ml-auto">
                  <a class="nav-item nav-link active" href="Index.html">Home <span class="sr-only">(current)</span></a>
                  <a class="nav-item nav-link" href="Quienes_somos.html">¿Quíenes Somos?</a>
                  <a class="nav-item nav-link" href="Lo_q_hacemos.html">Lo que hacemos</a>
                  <a class="nav-item nav-link mr-md-4" href="Lo_q_sonamos.html">Lo que soñamos</a>
                  <div><a href="Login.html" class="btn btn-alert">Login</a></div>
                </div>    
              </div>
            </nav>
          </div>
      <!-- END menu -->
      <!-- Start Visual imagen destacada -->

      <div class="container-fluid slider d-flex flex-column justify-content-center align-items-center">
        <div class="text-center text-white">
          <h3 class="lead hidden-xs-down">Lo que tu empresa necesita</h3>
          <h1 class="display">Marnet Services & Solutions SAS</h1>
          <p class="lead hidden-xs-down">Servicios y Soluciones Empresariales</p>
        </div>
        <form  class="form-inline text-center d-flex flex-column flex-sm-row">
          <div class="form-group mr-4">
            <input type="text" placeholder="Buscar" class="form-control">
          </div>

          <div class="form-group">
            <input type="submit"  class="btn btn-warning" value="Buscar">
          </div>
        </form>

      </div>
      <!-- END Visual imagen destacada -->
      <!-- Start main -->
      <div class="container mb-5">
        <h3>Registro</h3>
        <p class="lead">Registrate para que se te puedan enviar noticias de los nuevos lanzamientos</p>
        <hr>
        <div class="row">
           <!-- Articulos-->
          <div class="col-12 col-md-9">
           <!-- <embed src="Audio/preciosoamor.mp3"width="300px "height="25px" console="true "autostart="true "autoplay="true"> -->
            <form onsubmit="return valida_formulario()">
              
              <div class="form-group">
                <label for="nombres">Nombres:</label>
                <input type="text" name="nombres" placeholder="Nombres" id="nombres" class="form-control">
              </div>

              <div class="form-group">
                <label for="primapellido">Primer Apellido</label>
                <input type="text" name="primapellido" id="primapellido" class="form-control" placeholder="Primer Apellido">
              </div>
              
              <div class="form-group">
                <label for="secapellido">Segundo Apellido</label>
                <input type="text" name="secapellido" id="secapellido" class="form-control" placeholder="Segundo Apellido">
              </div>

              <div class="form-group">
                <label>Identificación: </label>
                <input type="text" name="identificacion" id="identificacion" class="form-control" placeholder="Identificación" >
              </div>
              
              <div class="form-group">
                <label>Fecha Nacimiento: </label>
                <input type="date" id="fechanacimiento" class="form-control" placeholder="dd/mm/aaaa">
              </div>

              <div class="form-group">
              <label>Genero</label>
                <select  name="genero" id="gener" class="form-control">
                  <option value="F">Femenino</option>
                  <option value="M">Masculino</option>
                </select>
              </div>
              
              <div class="form-group">
                  <label>Correo Electronico: </label>  
                  <input type="email" name="correoelectr" id="correoelectr" class="form-control" placeholder="Correo Electronico">
              </div>
              
              <div class="form-group">
                <label>Celular</label>
                <input type="number" name="celular" id="celular" placeholder="Celular" class="form-control">
              </div>  
                
                <div class="form-group">
                  <input type="submit"  class="btn btn-warning" value="Envíar">
                </div>
            
            </form>
          </div>
           <!-- END Articulos -->
           <!-- Aside-->
            <div class="col-12 col-md-3">
              <!-- Cards-->

              <div class="card border-primary mb-3" style="max-width: 18rem;">
                  <div class="card-header">Header</div>
                  <div class="card-body text-primary">
                    <h5 class="card-title">Primary card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>
                <div class="card border-secondary mb-3" style="max-width: 18rem;">
                  <div class="card-header">Header</div>
                  <div class="card-body text-secondary">
                    <h5 class="card-title">Secondary card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>
                <div class="card border-success mb-3" style="max-width: 18rem;">
                  <div class="card-header">Header</div>
                  <div class="card-body text-success">
                    <h5 class="card-title">Success card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>
                <div class="card border-danger mb-3" style="max-width: 18rem;">
                  <div class="card-header">Header</div>
                  <div class="card-body text-danger">
                    <h5 class="card-title">Danger card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>
                <div class="card border-warning mb-3" style="max-width: 18rem;">
                  <div class="card-header">Header</div>
                  <div class="card-body text-warning">
                    <h5 class="card-title">Warning card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>
                <div class="card border-info mb-3" style="max-width: 18rem;">
                  <div class="card-header">Header</div>
                  <div class="card-body text-info">
                    <h5 class="card-title">Info card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  </div>
                </div>

              <!-- End Cards-->


            </div>
           <!-- END Aside -->          
        </div>
      </div>

      <!-- END Main -->


      <!-- Start Footer-->
      <footer class="container-fluid bg-dark text-white py-3 text-center">
          <div id="ElemReloj" class="text-center" >
          <p id="pSaludo"></p>
          <table align="center">
          <tr><td id="pHoras"></td><td>:</td><td id="pMinutos"></td><td>:</td><td id="pSegundos"></td></tr>
          </table>
        </div><br>
        <p>Solo te mostramos lo que en realidad quieres tener....</p>
        <p id="navegador"></p>
      </footer>
      <!-- END Footer-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="js/bootstrap.bundle.min.js" ></script>
    <!--<script src="js/bootstrap-datetimepicker.min.js"></script>--> 
    <script src="js/funcionesJS.js"></script>
    <script src="http://momentjs.com/downloads/moment.min.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
    <script src="js/bootstrap.bundle.min.js" ></script>
    <script src="js/navegador.js"></script>
    <script src="js/ActualizarHora.js"></script>
    </body>
</html>
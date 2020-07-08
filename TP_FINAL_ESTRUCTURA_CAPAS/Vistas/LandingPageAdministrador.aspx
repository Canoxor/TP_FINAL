<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPageAdministrador.aspx.cs" Inherits="Vistas.LandingPageAdministrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <script src="https://kit.fontawesome.com/ccd9a07f5e.js" crossorigin="anonymous"></script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous" />

    <!-- App CSS -->
    <link rel="stylesheet" href="app.css" />
    <link rel="shortcut icon" href="imgs/LogoPagina.png" />
    <title>True Games Administrador</title>
    <style type="text/css">
        .fondoPrimarioCard {
            background-color: #C9C7D0;
            width: 70%;
        }

        .fondoSecundarioCard {
            background-color: #AEACB3;
        }
    </style>
</head>
<body>
    <form id="formLandingPageAdministrador" runat="server">
        <!-- Navbar -->

        <nav id="mainNavbar" class="navbar navbar-dark navbar-expand-md py-0" style="background: rgb(42, 40, 48)">
            <a href="LandingPageAdministrador.aspx" class="navbar-brand">
                <img src="imgs/LogoPagina.png" />
                True Games Administrador</a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between blurb" id="navLinks">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="JuegosAdministrador.aspx" class="nav-link">Juegos</a>
                    </li>
                    <li class="nav-item">
                        <a href="NoticiasAdministrador.aspx" class="nav-link">Noticias</a>
                    </li>
                    <li class="nav-item">
                        <a href="PerifericosAdministrador.aspx" class="nav-link">Perifericos</a>
                    </li>
                    <li class="nav-item">
                        <a href="UsuariosAdministrador.aspx" class="nav-link">Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a href="FacturasAdministrador.aspx" class="nav-link">Facturas</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="margin-right: 30px">
                    <li class="nav-item align-content-lg-end">
                        <asp:Label ID="lblUsuario" runat="server" Style="color: white;margin-right:20px"></asp:Label>
                    </li>
                    <li class="nav-item align-content-lg-end">
                        <asp:Button class="btn btn-secondary" ID="btnCerrarSesion" runat="server" style="position: center;text-align: center; width:100%" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />
                    </li>
                </ul>
            </div>
        </nav>

        &nbsp

        <div style="text-align: center; margin-left: 23%">

            <div class="card text-center fondoPrimarioCard">
                <div class="card-header fondoSecundarioCard">
                    Juegos
                </div>
                <div class="card-body">
                    <h5 class="card-title">Administrar Panel Juegos</h5>
                    <p class="card-text">Al oprimir el boton que se encuentra debajo, usted sera redirigido al panel de juegos, donde podra modificar, agregar y eliminar los juegos disponibles para los usuarios</p>
                    <a href="JuegosAdministrador.aspx" class="btn btn-primary">Ir a Juegos</a>
                </div>
            </div>

            &nbsp

            <div class="card text-center fondoPrimarioCard">
                <div class="card-header fondoSecundarioCard">
                    Perifericos
                </div>
                <div class="card-body">
                    <h5 class="card-title">Administrar Panel Perifericos</h5>
                    <p class="card-text">Al oprimir el boton que se encuentra debajo, usted sera redirigido al panel de perifericos, donde podra modificar, agregar y eliminar los perifericos disponibles para los usuarios</p>
                    <a href="PerifericosAdministrador.aspx" class="btn btn-primary">Ir a Perifericos</a>
                </div>
            </div>

            &nbsp

            <div class="card text-center fondoPrimarioCard">
                <div class="card-header fondoSecundarioCard">
                    Noticias
                </div>
                <div class="card-body">
                    <h5 class="card-title">Administrar Panel Noticias</h5>
                    <p class="card-text">Al oprimir el boton que se encuentra debajo, usted sera redirigido al panel de Noticias, donde podra modificar, agregar y eliminar las Noticias que los usuarios van a ver</p>
                    <a href="NoticiasAdministrador.aspx" class="btn btn-primary">Ir a Noticias</a>
                </div>
            </div>

            &nbsp

            <div class="card text-center fondoPrimarioCard">
                <div class="card-header fondoSecundarioCard">
                    Usuarios
                </div>
                <div class="card-body">
                    <h5 class="card-title">Administrar Panel Usuarios</h5>
                    <p class="card-text">Al oprimir el boton que se encuentra debajo, usted sera redirigido al panel de Usuarios, donde podra modificar y eliminar a los usuarios registrados en la plataforma</p>
                    <a href="UsuariosAdministrador.aspx" class="btn btn-primary">Ir a Usuarios</a>
                </div>
            </div>
            &nbsp

            <div class="card text-center fondoPrimarioCard">
                <div class="card-header fondoSecundarioCard">
                    Facturas
                </div>
                <div class="card-body">
                    <h5 class="card-title">Administrar Panel Facturas</h5>
                    <p class="card-text">Al oprimir el boton que se encuentra debajo, usted sera redirigido al panel de Facturas, donde podra visualisar y filtrar todas las facturas con sus respectivos detalles de facturas</p>
                    <a href="FacturasAdministrador.aspx" class="btn btn-primary">Ir a Facturas</a>
                </div>
            </div>
            &nbsp
        </div>



    </form>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>
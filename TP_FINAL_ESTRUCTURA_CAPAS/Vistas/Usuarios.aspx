﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Vistas.Usuarios" %>

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
    <title>True Games</title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->

        <nav id="mainNavbar" class="navbar navbar-dark navbar-expand-md py-0 sticky-top" style="background: rgb(42, 40, 48)">
            <a href="LandingPage.aspx" class="navbar-brand">
                <img src="imgs/LogoPagina.png" />
                True Games</a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between blurb" id="navLinks">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="Juegos.aspx" class="nav-link">Juegos</a>
                    </li>
                    <li class="nav-item">
                        <a href="Noticias.aspx" class="nav-link">Noticias</a>
                    </li>
                    <li class="nav-item">
                        <a href="Perifericos.aspx" class="nav-link">Perifericos</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="margin-right: 30px">
                    <li class="nav-item dropdown align-content-lg-end">
                        <asp:Label ID="lblNavbarUsuario" runat="server" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" Text="Usuario"></asp:Label>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item nav-link btn btn-secondary btn-l active" style="text-align: center" role="button" href="Usuarios.aspx">Mi Cuenta</a>
                            <div class="dropdown-divider"></div>
                            <asp:Button class="btn btn-secondary" ID="btnCerrarSesion" runat="server" Style="position: center; text-align: center; width: 100%" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <div style="width:100%; margin-top:3%">
            <asp:Label ID="lblBienvenida" runat="server" Text="" Style="font-size: 1.2em; color: yellow; margin-left: 12%"></asp:Label>
        </div>
        <div style="width: 100%; align-items: center; margin-top: 5%">
            <div class="card text-center" style="width: 70%; position: center; margin-left: 15%">
                <div class="card-header">
                    <ul class="nav nav-pills card-header-pills">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Informacion Personal</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Carrito.aspx">Mi carrito</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="HistorialFacturas.aspx">Historial de Facturas</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="card-body" style="background-color: lightgrey; width: 70%; align-items: center; text-align: center; position: center; margin-left: 15%; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px">
                <h5 class="card-title">Informacion Personal</h5>
                <br />
                <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
                <br />
                <asp:Label ID="lblApellido" runat="server" Text=""></asp:Label>
                <br />
                <asp:Label ID="lblDni" runat="server" Text=""></asp:Label>
                <br />
                <asp:Label ID="lblDireccion" runat="server" Text=""></asp:Label>
                <br />
                <asp:Label ID="lblTelefono" runat="server" Text=""></asp:Label>
                <br />
                <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                <br />
                <a href="UsuariosModificar.aspx" class="btn btn-primary" style="margin-top:20px">Editar informacion Personal</a>
            </div>
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


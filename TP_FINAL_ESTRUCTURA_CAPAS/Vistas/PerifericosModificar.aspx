<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerifericosModificar.aspx.cs" Inherits="Vistas.PerifericosModificar" %>

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
        .texto {
            width: 100%;
            text-align: center;
            height: 30px;
            margin-top: 15px;
        }

        .textBoxEstilo {
            border-radius: 5px;
            margin-top: 15px;
            border-color: transparent;
            height: 30px;
            margin-left: 10px;
        }

    </style>
</head>
<body>
    <form id="formPerifericosAdministrador" runat="server">
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
                        <a href="PerifericosAdministrador.aspx" class="nav-link" style="color: #8B8C91">Perifericos</a>
                    </li>
                    <li class="nav-item">
                        <a href="UsuariosAdministrador.aspx" class="nav-link">Usuarios</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="margin-right: 30px">
                    <li class="nav-item align-content-lg-end">
                        <asp:Button class="btn btn-secondary" ID="btnCerrarSesion" runat="server" Style="position: center; text-align: center; width: 100%" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />
                    </li>
                </ul>
            </div>
        </nav>

        <div style="width: 100%; margin-top: 4%; color: white">

            <div class="texto">Codigo Periferico:<asp:Label ID="lbl_CodigoSeleccionado" runat="server" Text="" Style="margin-left: 15px"></asp:Label></div>
            
            <div class="texto">Precio:<asp:TextBox ID="txtPrecio" CssClass="textBoxEstilo" runat="server" TextMode="Number"></asp:TextBox></div>
           
            <div class="texto">Stock:<asp:TextBox ID="txtStock" runat="server" CssClass="textBoxEstilo" TextMode="Number"></asp:TextBox></div>

            <div style="width: 100%; text-align:center; height: 30px; margin-top: 25px">
                <asp:Button class="btn btn-primary btn-m" ID="btnActualizar" runat="server" Style="position: center; margin-right: 10px" Text="Actualizar" OnClick="btnActualizar_Click" />
                <asp:Button class="btn btn-dark btn-m" ID="btnCancelar" runat="server" Style="position: center;margin-left:10px" Text="Cancelar" OnClick="btnCancelar_Click" />
            </div>
            
            <div style="width: 100%; text-align: center; margin-top:30px">
                <asp:Label ID="lblMensaje" runat="server" Text="" Style="color: yellow; margin-top: 60px"></asp:Label></div>
        </div>
    </form>
</body>
</html>

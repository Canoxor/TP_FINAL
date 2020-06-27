<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticiaModificar.aspx.cs" Inherits="Vistas.NoticiaModificar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
        .auto-style1 {
            width: 696px;
            text-align: right;
        }
        .auto-style2 {
            text-align: right;
            width: 790px;
        }
    </style>
</head>
<body>
    <form id="formNoticiasAdministrador" runat="server">
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
                        <a href="NoticiasAdministrador.aspx" class="nav-link" style="color: #8B8C91">Noticias</a>
                    </li>
                    <li class="nav-item">
                        <a href="PerifericosAdministrador.aspx" class="nav-link">Perifericos</a>
                    </li>
                    <li class="nav-item">
                        <a href="UsuariosAdministrador.aspx" class="nav-link">Usuarios</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="margin-right: 30px">
                    <li class="nav-item align-content-lg-end">
                        <asp:Button class="btn btn-secondary" ID="btnCerrarSesion" runat="server" style="position: center;text-align: center; width:100%" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />
                    </li>
                </ul>
            </div>
        </nav>
</head>
<body>
    <div>
        <br />
        <br />
        <table class="w-100">
            <tr>
                <td class="auto-style1"><span class="text-white"><strong>Codigo de notícia seleccionado:<br />
                    </strong></span><strong>&nbsp; </strong></td>
                <td>&nbsp;&nbsp;
                    <asp:Label ID="lbl_CodigoSeleccionado" runat="server" CssClass="text-white"></asp:Label>
                    <br />
&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1"><span class="text-white"><strong>URL Imagen:<br /></strong></span>&nbsp;</td>
                <td>&nbsp;&nbsp;
                    <asp:TextBox ID="txt_Imagen" runat="server" Width="400px"></asp:TextBox>
&nbsp;&nbsp;
                    <asp:CheckBox ID="ch_Imagen" runat="server" CssClass="text-white" Text="Aplicar este cambio" />
                    <br />&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1"><span class="text-white"><strong>Nombre:</strong></span><strong><br /></strong>&nbsp;</td>
                <td>&nbsp;&nbsp;
                    <asp:TextBox ID="txt_Nombre" runat="server" Width="400px"></asp:TextBox>
&nbsp;&nbsp;
                    <asp:CheckBox ID="ch_Nombre" runat="server" CssClass="text-white" Text="Aplicar este cambio" />
                    <br />&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1"><span class="text-white"><strong>Descripción:<br />
                    </strong></span>&nbsp;</td>
                <td>&nbsp;&nbsp;
                    <asp:TextBox ID="txt_Descripcion" runat="server" Width="400px"></asp:TextBox>
&nbsp;&nbsp;
                    <asp:CheckBox ID="ch_Precio0" runat="server" CssClass="text-white" Text="Aplicar este cambio" />
                    <br />&nbsp;&nbsp;</td>
            </tr>
        </table>
        <br />
        <table class="w-100">
            <tr>
                <td class="auto-style2">
                    <asp:Button runat="server" CommandName="Update" Text="Actualizar" ID="btn_Actualizar"></asp:Button>
&nbsp;&nbsp; </td>
                <td>&nbsp;&nbsp;&nbsp;
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancelar" ID="btn_Cancelar" PostBackUrl="~/JuegosAdministrador.aspx"></asp:Button>
                </td>
            </tr>
        </table>
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


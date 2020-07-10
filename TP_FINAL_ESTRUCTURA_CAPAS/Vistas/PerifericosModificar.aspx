﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerifericosModificar.aspx.cs" Inherits="Vistas.PerifericosModificar" %>

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
        .columna {
            width: 25%;
            color: white;
        }

        .fila {
            width: 100%;
        }

        .textoColumna {
            text-align:end;
        }

        .columna_3 {
            margin-left:20px;
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
                    <li class="nav-item">
                        <a href="FacturasAdministrador.aspx" class="nav-link">Facturas</a>
                    </li>
                    <li class="nav-item">
                        <a href="ReportesAdministrador.aspx" class="nav-link" >Reportes</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="margin-right: 30px">
                    <li class="nav-item align-content-lg-end">
                        <asp:Label ID="lblUsuario" runat="server" Style="color: white; margin-right: 20px"></asp:Label>
                    </li>
                    <li class="nav-item align-content-lg-end">
                        <asp:Button class="btn btn-secondary" ID="btnCerrarSesion" runat="server" Style="position: center; text-align: center; width: 100%" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />
                    </li>
                </ul>
            </div>
        </nav>


        <table align="center" cellpadding="4" cellspacing="2" class="w-100" style="margin-top:6%">
        <tr class="fila">
            <td class="columna">&nbsp;</td>
            <td class="columna textoColumna">Codigo de Periferico: </td>
            <td class="columna columna_3">
                <asp:Label ID="lblCodigoPeriferico" runat="server" Text=""></asp:Label>
            </td>
            <td class="columna">&nbsp;</td>
        </tr>
        <tr class="fila">
            <td class="columna">&nbsp;</td>
            <td class="columna textoColumna">Tipo de Periferico: </td>
            <td class="columna columna_3">
                <asp:DropDownList ID="ddlTipoPerif" runat="server">
                </asp:DropDownList>
            </td>
            <td class="columna"><asp:RequiredFieldValidator ID="rfvDropTipoPerif" runat="server" ControlToValidate="ddlTipoPerif" Font-Bold="True" ForeColor="Red" ValidationGroup="Grupo1" InitialValue="0">Guarde un Genero primero</asp:RequiredFieldValidator></td>
        </tr>
        <tr class="fila">
            <td class="columna">&nbsp;</td>
            <td class="columna textoColumna">Marca: </td>
            <td class="columna columna_3">
                <asp:DropDownList ID="ddlMarca" runat="server">
                </asp:DropDownList>
            </td>
            <td class="columna"><asp:RequiredFieldValidator ID="rfvDropMarca" runat="server" ControlToValidate="ddlMarca" Font-Bold="True" ForeColor="Red" ValidationGroup="Grupo1" InitialValue="0">Guarde un Indice PEGI Primero</asp:RequiredFieldValidator></td>
        </tr>
        <tr class="fila">
            <td class="columna">&nbsp;</td>
            <td class="columna textoColumna">Nombre: </td>
            <td class="columna columna_3">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </td>
            <td class="columna">
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="Grupo1">Ingrese un Nombre</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr class="fila">
            <td class="columna">&nbsp;</td>
            <td class="columna textoColumna">Descripcion: </td>
            <td class="columna columna_3">
                <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" runat="server"></asp:TextBox>
            </td>
            <td class="columna">
                <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ValidationGroup="Grupo1">Ingrese una Descripcion</asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr class="fila">
            <td class="columna">&nbsp;</td>
            <td class="columna textoColumna">Stock: </td>
            <td class="columna columna_3">
                <asp:TextBox ID="txtStock" runat="server" TextMode="Number"></asp:TextBox>
             </td>
            <td class="columna">
                <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock" ValidationGroup="Grupo1">Ingrese una cantidad</asp:RequiredFieldValidator>
             </td>
        </tr>
         <tr class="fila">
            <td class="columna">&nbsp;</td>
            <td class="columna textoColumna">Precio Unitario: </td>
            <td class="columna columna_3">
                <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number"></asp:TextBox>
             </td>
            <td class="columna">
                <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio" ValidationGroup="Grupo1">Ingrese un precio</asp:RequiredFieldValidator>
             </td>
        </tr>
         <tr class="fila">
            <td class="columna">&nbsp;</td>
            <td class="columna textoColumna">URL Imagen: </td>
            <td class="columna columna_3">
                <asp:TextBox ID="txtURL" runat="server"></asp:TextBox>
             </td>
            <td class="columna">
                <asp:RequiredFieldValidator ID="rfvURL" runat="server" ControlToValidate="txtURL" ValidationGroup="Grupo1">Ingrese una URL</asp:RequiredFieldValidator>
             </td>
        </tr>
    </table>

        <div style="width: 100%; margin-top: 4%; color: white">

            <div style="width: 100%; text-align: center; height: 30px; margin-top: 25px">
                <asp:Button class="btn btn-primary btn-m" ID="btnActualizar" ValidationGroup="Grupo1" runat="server" Style="position: center; margin-right: 10px" Text="Actualizar" OnClick="btnActualizar_Click" />
                <asp:Button class="btn btn-dark btn-m" ID="btnCancelar" runat="server" Style="position: center; margin-left: 10px" Text="Volver Atras" OnClick="btnCancelar_Click" />
            </div>

            <div style="width: 100%; text-align: center; height: 30px; margin-top: 20px">
                <asp:Button class="btn btn-danger btn-m" ID="btnEliminar" runat="server" Style="position: center" Text="Eliminar Periferico" OnClick="btnEliminar_Click" />
            </div>

            <div style="width: 100%; text-align: center; height: 30px; margin-top: 20px">
                <asp:Button class="btn btn-warning btn-m" ID="btnActivar" runat="server" Style="position: center" Text="Activar Periferico" OnClick="btnActivar_Click" />
            </div>

            <div style="width: 100%; text-align: center; margin-top: 30px">
                <asp:Label ID="lblMensaje" runat="server" Text="" Style="color: yellow; margin-top: 60px"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

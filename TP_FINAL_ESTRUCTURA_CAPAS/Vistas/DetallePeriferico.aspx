﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallePeriferico.aspx.cs" Inherits="Vistas.DetallePeriferico" %>

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
    <style type="text/css">
        
        .auto-style2 {
            text-align: center;
            width: 601px;
        }

        .auto-style4 {
            margin-left: 94px;
            width: 515px;
        }
        .auto-style5 {
            margin-left: 94px;
            width: 577px;
        }
    </style>
</head>
<body>
    <form id="formPerifericos" runat="server">
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
                        <a href="Perifericos.aspx" class="nav-link" style="color: #8B8C91">Perifericos</a>
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
       <div>
            <br />
            <br />
            <br />
            <br />
            <table class="w-100">
                <tr>
                    <td class="auto-style5">
                        &nbsp;</td>
                    <td class="auto-style2">
                        <asp:FormView ID="FormView1" runat="server" CssClass="auto-style7" DataKeyNames="PE_Codigo_Periferico" DataSourceID="DS_Detalle">
                            <EditItemTemplate>
                                Imagen:
                                <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("PE_Imagen") %>' />
                                <br />
                                Nombre:
                                <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("PE_Nombre") %>' />
                                <br />
                                Descripcion:
                                <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("PE_Descripcion") %>' />
                                <br />
                                PrecioUnitario:
                                <asp:TextBox ID="PrecioUnitarioTextBox" runat="server" Text='<%# Bind("PE_PrecioUnitario") %>' />
                                <br />
                                Codigo_Juego:
                                <asp:Label ID="Codigo_JuegoLabel1" runat="server" Text='<%# Eval("PE_Codigo_Juego") %>' />
                                <br />
                                Estado:
                                <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Bind("PE_Estado") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                Imagen:
                                <asp:TextBox ID="ImagenTextBox0" runat="server" Text='<%# Bind("PE_Imagen") %>' />
                                <br />
                                Nombre:
                                <asp:TextBox ID="NombreTextBox0" runat="server" Text='<%# Bind("PE_Nombre") %>' />
                                <br />
                                Descripcion:
                                <asp:TextBox ID="DescripcionTextBox0" runat="server" Text='<%# Bind("PE_Descripcion") %>' />
                                <br />
                                PrecioUnitario:
                                <asp:TextBox ID="PrecioUnitarioTextBox0" runat="server" Text='<%# Bind("PE_PrecioUnitario") %>' />
                                <br />
                                Codigo_Juego:
                                <asp:TextBox ID="Codigo_JuegoTextBox" runat="server" Text='<%# Bind("PE_Codigo_Juego") %>' />
                                <br />
                                Estado:
                                <asp:CheckBox ID="EstadoCheckBox0" runat="server" Checked='<%# Bind("PE_Estado") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                
                            <td class="card-columns">
                                <td class="card border-dark mb-3" style="border-radius: 20px; border-width:medium;  width: 450px; align-content: center; align-items: center; padding-left:5%;padding-right:5%; padding-top:5%; background-color:#FFFFFF; margin-left:20%">
                                    <asp:Image ID="Imagen0" Style="border-radius: 20px" runat="server" Height="240px" ImageUrl='<%# Eval("PE_Imagen") %>' Width="280px" />
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <br />
                                    <span class="text-black"><b>
                                    <asp:Label ID="NombreLabel0" runat="server" CssClass="auto-style3" Font-Size="22px" Text='<%# Eval("PE_Nombre") %>'></asp:Label>
                                    <br />
                                    </b></span>
                                <p align="center
                                    <br />
                                    <br />
                                    <span class="text-black">&nbsp;<span style="color: black; font-size: 13pt"><strong>Descripcion</strong>
                                    <br />
                                    <asp:Label ID="lblDescripcionJuegoLv_DJ" runat="server" Text='<%# Eval("PE_Descripcion") %>'></asp:Label>
                                    <br />
                                    <br />
                                    Precio: $
                                    <asp:Label ID="lblPrecioJuegoLv_DJ" runat="server" Text='<%# Eval("PE_PrecioUnitario") %>'></asp:Label>
                                    <br />
                                    <br />
                                    ¿Desea agregar este producto al carrito?
                                    <br />
                                    </span>
                                </p>
                                     <asp:Button ID="btnAgregarCarritoDJ" runat="server" Text="Agregar" OnCommand="btnAgregar_Command"/>
                                <br />
                                    <br />
                                </td>
                            </td>
                            
                        </ItemTemplate>
                            
                        </asp:FormView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style4">
                        <asp:SqlDataSource ID="DS_Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:PARCIAL_LAB_3_Version_10ConnectionString2 %>" SelectCommand="SELECT [PE_Imagen], [PE_Nombre], [PE_Descripcion], [PE_PrecioUnitario], [PE_Codigo_Periferico] FROM [Perifericos]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
    <script>
        $(function () {
            $(document).scroll(function () {
                var $nav = $("#mainNavbar");
                $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
            });
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>


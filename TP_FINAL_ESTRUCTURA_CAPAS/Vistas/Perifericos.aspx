﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perifericos.aspx.cs" Inherits="TP_Integrador_Grupo_4.Perifericos" %>

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
        .auto-style10 {
            width: 17%;
        }

        .auto-style20 {
            width: 60%;
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
                            <a class="dropdown-item nav-link" style="text-align: center" href="#"><i class="fas fa-sign-out-alt"></i>Cerrar Sesion</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        &nbsp
       <table class="w-100">
           <tr>
               <td style="width: 34%; text-align: center">
                   <a style="color: white">Buscar Perifericos:</a>
                   <asp:TextBox ID="txtBusquedaPerifericos" runat="server"></asp:TextBox>
                   <asp:Button class="btn btn-primary btn-sm" ID="btnBuscarPerifericos" runat="server" Style="position: center" Text="Buscar" />
               </td>
               <td style="width: 33%; text-align: center">
                   <div class="btn-group dropdown">
                       <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           Filtar Perifericos
                       </button>
                       <div class="dropdown-menu">
                           <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltrarMarcas" runat="server" Style="position: center" Text="Marcas" />
                           <asp:Button class="dropdown-item btn btn-secondary" ID="btnPP" runat="server" Style="position: center" Text="Algo" />
                           <asp:Button class="dropdown-item btn btn-secondary" ID="btnPPP" runat="server" Style="position: center" Text="Algo mas" />
                       </div>
                   </div>
               </td>
               <td style="width: 33%; text-align: center">
                    <asp:Button class="btn btn-secondary" ID="btnCarrito" runat="server" Style="position: center" Text="Ir a mi carrito" />
               </td>
           </tr>
           <tr>
               <td style="text-align: center" colspan="3">&nbsp;</td>
           </tr>
       </table>
        &nbsp
        &nbsp<table class="w-100">
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style20">
                    <asp:ListView ID="lvPerifericos" runat="server" Style="position: center" DataSourceID="SqlDataPerifericos" GroupItemCount="3">
                        <EditItemTemplate>
                            <td runat="server" style="">PE_Imagen:
                                <asp:TextBox ID="PE_ImagenTextBox" runat="server" Text='<%# Bind("PE_Imagen") %>' />
                                <br />
                                PE_Nombre:
                                <asp:TextBox ID="PE_NombreTextBox" runat="server" Text='<%# Bind("PE_Nombre") %>' />
                                <br />
                                PE_PrecioUnitario:
                                <asp:TextBox ID="PE_PrecioUnitarioTextBox" runat="server" Text='<%# Bind("PE_PrecioUnitario") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                                <br />
                            </td>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No se han devuelto datos.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td runat="server" />
                        </EmptyItemTemplate>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </GroupTemplate>
                        <InsertItemTemplate>
                            <td runat="server" style="">PE_Imagen:
                                <asp:TextBox ID="PE_ImagenTextBox0" runat="server" Text='<%# Bind("PE_Imagen") %>' />
                                <br />
                                PE_Nombre:
                                <asp:TextBox ID="PE_NombreTextBox0" runat="server" Text='<%# Bind("PE_Nombre") %>' />
                                <br />
                                PE_PrecioUnitario:
                                <asp:TextBox ID="PE_PrecioUnitarioTextBox0" runat="server" Text='<%# Bind("PE_PrecioUnitario") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                <br />
                                <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" Text="Borrar" />
                                <br />
                            </td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <td runat="server" class="text-center" style="">&nbsp;&nbsp;&nbsp;
                                <asp:Image class="rounded-circle" ID="Image1" runat="server" Height="250px" ImageUrl='<%# Eval("PE_Imagen") %>' Width="250px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <br />
                                <br />
                                <span class="text-white">
                                    <asp:Label ID="PE_NombreLabel0" runat="server" Text='<%# Eval("PE_Nombre") %>'></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="PE_PrecioUnitarioLabel0" runat="server" Text='<%# Eval("PE_PrecioUnitario") %>'></asp:Label>
                                    <br />
                                    <br />
                                </span>&nbsp;<br />
                            </td>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <td runat="server" style="">PE_Imagen:
                                <asp:Label ID="PE_ImagenLabel" runat="server" Text='<%# Eval("PE_Imagen") %>' />
                                <br />
                                PE_Nombre:
                                <asp:Label ID="PE_NombreLabel1" runat="server" Text='<%# Eval("PE_Nombre") %>' />
                                <br />
                                PE_PrecioUnitario:
                                <asp:Label ID="PE_PrecioUnitarioLabel1" runat="server" Text='<%# Eval("PE_PrecioUnitario") %>' />
                                <br />
                            </td>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </td>
            </tr>
        </table>
        <br />
        <table class="w-100">
            <tr>
                <td style="width: 10%; text-align: center"></td>
                <td style="width: 80%; text-align: center">&nbsp;</td>
                <td style="width: 10%; text-align: center"></td>
            </tr>
        </table>
        &nbsp;
        <asp:SqlDataSource ID="SqlDataPerifericos" runat="server" ConnectionString="<%$ ConnectionStrings:PARCIAL_LAB_3_Version_10ConnectionString2 %>" SelectCommand="SELECT [PE_Imagen], [PE_Nombre], [PE_PrecioUnitario] FROM [Perifericos]"></asp:SqlDataSource>



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
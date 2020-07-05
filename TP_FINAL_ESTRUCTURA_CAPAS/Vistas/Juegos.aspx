<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Juegos.aspx.cs" Inherits="Vistas.Juegos" %>

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
        .auto-style1 {
            width: 11%;
        }

        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            width: 9%;
        }
        .auto-style5 {
            width: 10%;
        }
    </style>
</head>
<body>
    <form id="formJuegos" runat="server">
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
                        <a href="Juegos.aspx" class="nav-link" style="color: #8B8C91">Juegos</a>
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
        &nbsp
        <table class="w-100">
            <tr>
                <td style="width: 34%; text-align: center">
                    <a style="color: white">Buscar Juegos:</a>
                    <asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox>
                    <asp:Button class="btn btn-primary btn-sm" ID="btnBuscar" runat="server" Style="position: center" Text="Buscar" OnClick="btnBuscar_Click"/>
                </td>
                <td style="width: 33%; text-align: center">
                    <div class="btn-group dropdown">
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filtar Juegos
                        </button>
                        <div class="dropdown-menu">
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltroCategoria" runat="server" Style="position: center" Text="Categoria" OnClick="btnFiltroCategoria_Click"/>
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltroDesarrollador" runat="server" Style="position: center" Text="Desarrollador" OnClick="btnFiltroDesarrollador_Click"/>
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltroPegi" runat="server" Style="position: center" Text="Etiquetas PEGI" OnClick="btnFiltroPegi_Click"/>
                        </div>
                    </div>
                </td>
                <td style="width: 33%; text-align: center">
                    <asp:Button class="btn btn-secondary" ID="btnCarrito" runat="server" Style="position: center" Text="Ir a mi carrito" />
                </td>
            </tr>
        </table>
        &nbsp
        &nbsp<br />
        <br />
        <br />
        <table class="w-100">
            <tr>
                <td style="text-align: center" class="auto-style5">
                </td>
                <td style="text-align: center" class="auto-style4">
                    <asp:ListView ID="ListView" runat="server" Style="position: center" DataSourceID="Sql_DataSource" GroupItemCount="3">

                        <EditItemTemplate>
                            <td runat="server" style="">Imagen:
                        <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("J_Imagen") %>' />
                                <br />
                                J_Nombre:
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("J_Nombre") %>' />
                                <br />
                                J_PrecioUnitario:
                        <asp:TextBox ID="PrecioUnitarioTextBox" runat="server" Text='<%# Bind("J_PrecioUnitario") %>' />
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
                            <td runat="server" style="">Imagen:
                        <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("J_Imagen") %>' />
                                <br />
                                Nombre:
                        <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("J_Nombre") %>' />
                                <br />
                                PrecioUnitario:
                        <asp:TextBox ID="PrecioUnitarioTextBox" runat="server" Text='<%# Bind("J_PrecioUnitario") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                                <br />
                            </td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <p align="center">

                            
                            <td class="card-columns">
                                <td class="card border-dark mb-3" style="border-radius: 20px; border-width:medium;  width: 350px; align-content: center; align-items: center; padding-left:5%;padding-right:5%; padding-top:5%; background-color:#FFFFFF; margin-left:20%">
                                    <asp:Image ID="Imagen" Style="border-radius: 20px" runat="server" Height="400px" ImageUrl='<%# Eval("J_Imagen") %>' Width="270px" />
                                <br />
                                <br />
                                <span class="text-black">
                                    <b><asp:Label ID="Nombre" runat="server" Text='<%# Eval("J_Nombre") %>' CssClass="auto-style3" Font-Size="22px"></asp:Label></b>
                                </span>
                                <br />
                                <br />
                                <span style="color: black; font-size: 13pt"> $
                                    <asp:Label ID="PrecioUnitario" runat="server" Text='<%# Eval("J_PrecioUnitario") %>' Font-Size="18px"></asp:Label>
                                </span>
                                <br />
                                <br />
                                <asp:Button ID="btn_Info" runat="server" Text='Ir al juego' CommandArgument='<%# Eval("J_Codigo_Juego") %>' CommandName="JuegoSeleccionado" OnCommand="btnInfo_Command"/>
                                <br />
                                </td>
                            </td>
                                </p>
                            
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
                            <td runat="server" style="">J_Imagen:
                        <asp:Label ID="ImagenLabel" runat="server" Text='<%# Eval("J_Imagen") %>' />
                                <br />
                                J_Nombre:
                        <asp:Label ID="NombreLabel1" runat="server" Text='<%# Eval("J_Nombre") %>' />
                                <br />
                                J_PrecioUnitario:
                        <asp:Label ID="PrecioUnitarioLabel1" runat="server" Text='<%# Eval("J_PrecioUnitario") %>' />
                                <br />
                            </td>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </td>
                <td style="width: 10%; text-align: center"></td>
            </tr>
        </table>
        &nbsp;
        &nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div class="auto-style1">
        </div>
        <table class="w-100">
            <tr>
                <td style="width: 10%; text-align: center"></td>
                <td style="width: 80%; text-align: center">&nbsp;</td>
                <td style="width: 10%; text-align: center"></td>
            </tr>
        </table>
        &nbsp;<br />
        <br />
        <br />
        <asp:SqlDataSource ID="Sql_DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PARCIAL_LAB_3_Version_10ConnectionString2 %>" SelectCommand="SELECT [J_Imagen], [J_Nombre], [J_PrecioUnitario], [J_Codigo_Juego], [J_Estado] FROM [Juegos]"></asp:SqlDataSource>





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

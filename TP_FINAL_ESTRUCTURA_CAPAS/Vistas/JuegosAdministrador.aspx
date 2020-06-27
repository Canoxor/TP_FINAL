<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JuegosAdministrador.aspx.cs" Inherits="Vistas.JuegosAdministrador" %>

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
        .auto-style3 {
            width: 11%;
            text-align: right;
        }

        .auto-style5 {
            width: 20%;
        }


    </style>
</head>
<body>
    <form id="formJuegosAdministrador" runat="server">
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
                        <a href="JuegosAdministrador.aspx" class="nav-link" style="color: #8B8C91">Juegos</a>
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
                </ul>
                <ul class="navbar-nav" style="margin-right: 30px">
                    <li class="nav-item align-content-lg-end">
                        <asp:Button class="btn btn-secondary" ID="btnCerrarSesion" runat="server" style="position: center;text-align: center; width:100%" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />
                    </li>
                </ul>
            </div>
        </nav>
        &nbsp<br />
        &nbsp;<table class="w-100">
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
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltroJuegosActivos" runat="server" Style="position: center" Text="Juegos Activos" OnClick="btnFiltroJuegosActivos_Click"/>
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltroJuegosInactivos" runat="server" Style="position: center" Text="Juegos In-Activos" OnClick="btnFiltroJuegosInactivos_Click"/>
                        </div>
                    </div>
                </td>
                <td style="width: 33%; text-align: center">
                    <asp:Button class="btn btn-secondary" ID="btnCarrito" runat="server" Style="position: center" Text="Ir a mi carrito" />
                </td>
            </tr>
        </table>
        &nbsp
        &nbsp<table class="w-100">
            <tr>
                <td style="text-align: center" class="auto-style3">
                    <asp:Label ID="lbl_Codigo" runat="server" CssClass="text-white" Text="Label invisible" Visible="False"></asp:Label>
                </td>
                <td style="text-align: center" class="auto-style5">
                    <asp:ListView ID="ListView2" runat="server" Style="position: center" DataSourceID="SqlDataSource1" GroupItemCount="3">

                        <EditItemTemplate>
                            <td runat="server" style="">J_Imagen:
                        <asp:TextBox ID="J_ImagenTextBox" runat="server" Text='<%# Bind("J_Imagen") %>' />
                                <br />
                                J_Nombre:
                        <asp:TextBox ID="J_NombreTextBox" runat="server" Text='<%# Bind("J_Nombre") %>' />
                                <br />
                                J_PrecioUnitario:
                        <asp:TextBox ID="J_PrecioUnitarioTextBox" runat="server" Text='<%# Bind("J_PrecioUnitario") %>' />
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
                            <td runat="server" style="">J_Imagen:
                        <asp:TextBox ID="J_ImagenTextBox0" runat="server" Text='<%# Bind("J_Imagen") %>' />
                                <br />
                                J_Nombre:
                        <asp:TextBox ID="J_NombreTextBox0" runat="server" Text='<%# Bind("J_Nombre") %>' />
                                <br />
                                J_PrecioUnitario:
                        <asp:TextBox ID="J_PrecioUnitarioTextBox0" runat="server" Text='<%# Bind("J_PrecioUnitario") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                <br />
                                <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" Text="Borrar" />
                                <br />
                            </td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <td runat="server" class="text-center" style="">&nbsp;
                                &nbsp;
                                &nbsp;
                                <asp:Image ID="J_Imagen0" Style="border-radius: 20px" runat="server" Height="400px" ImageUrl='<%# Eval("J_Imagen") %>' Width="270px" />
                                &nbsp;
                                &nbsp;
                                &nbsp;
                                &nbsp;
                                <br />
                                <br />
                                <span class="text-white">
                                    <asp:Label ID="J_NombreLabel0" runat="server" Text='<%# Eval("J_Nombre") %>' CssClass="auto-style3"></asp:Label>
                                </span>
                                <br />
                                <br />
                                <span class="text-white">Precio: $
                                    <asp:Label ID="J_PrecioUnitarioLabel0" runat="server" Text='<%# Eval("J_PrecioUnitario") %>'></asp:Label>
                                </span>
                                <br />
                                <br />
                                <asp:Button ID="btn_Modificar" runat="server" Text='Modificar' CommandArgument='<%# Eval("J_Codigo_Juego") %>' CommandName="JuegoSeleccionado" OnCommand="btn_Modificar_Command" PostBackUrl="~/JuegosModificar.aspx" />
                                <br />
                                &nbsp;
                                <br />
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
                            <td runat="server" style="">J_Imagen:
                        <asp:Label ID="J_ImagenLabel" runat="server" Text='<%# Eval("J_Imagen") %>' />
                                <br />
                                J_Nombre:
                        <asp:Label ID="J_NombreLabel1" runat="server" Text='<%# Eval("J_Nombre") %>' />
                                <br />
                                J_PrecioUnitario:
                        <asp:Label ID="J_PrecioUnitarioLabel1" runat="server" Text='<%# Eval("J_PrecioUnitario") %>' />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PARCIAL_LAB_3_Version_10ConnectionString2 %>" SelectCommand="SELECT [J_Imagen], [J_Nombre], [J_PrecioUnitario], [J_Codigo_Juego] FROM [Juegos]"></asp:SqlDataSource>


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


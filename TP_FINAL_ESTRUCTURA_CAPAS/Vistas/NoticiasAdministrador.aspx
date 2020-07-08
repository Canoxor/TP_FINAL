<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticiasAdministrador.aspx.cs" Inherits="Vistas.NoticiasAdministrador" %>

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
        .auto-style1 {
            width: 287px;
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
                    <li class="nav-item">
                        <a href="FacturasAdministrador.aspx" class="nav-link">Facturas</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="margin-right: 30px">
                    <li class="nav-item align-content-lg-end">
                        <asp:Label ID="lblUsuario" runat="server" Style="color: white;margin-right:20px"></asp:Label>
                    </li>
                    <li class="nav-item align-content-lg-end">
                        <asp:Button class="btn btn-secondary" ID="btnCerrarSesion" runat="server" Style="position: center; text-align: center; width: 100%" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />
                    </li>
                </ul>
            </div>
        </nav>
        &nbsp
        <table class="w-100">
            <tr>
                <td style="width: 33%; text-align: center">
                    &nbsp;</td>
                <td style="width: 34%; text-align: center">
                    <div class="btn-group dropdown">
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filtar Noticias</button>
                        <div class="dropdown-menu">
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltrarPorJuegos" runat="server" Style="position: center" Text="Juegos" OnClick="btnFiltrarPorJuegos_Click" />
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltrarActivas" runat="server" Style="position: center" Text="Noticas Activas" OnClick="btnFiltrarActivas_Click" />
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltrarInactivas" runat="server" Style="position: center" Text="Noticias In-Activas" OnClick="btnFiltrarInactivas_Click" />
                        </div>
                    </div>
                </td>
                <td style="width: 33%; text-align: center">
                    <asp:Button class="btn btn-primary" ID="btnAgregarNoticia" runat="server" Text="Agregar Noticia" OnClick="btnAgregarNoticia_Click" />
                </td>
            </tr>
        </table>
        &nbsp<br />
        <table class="w-100">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:ListView ID="lvNoticias" runat="server" DataSourceID="SqlDataNoticias">

                        <EditItemTemplate>
                            <span style="">N_Nombre:
                            <asp:TextBox ID="N_NombreTextBox" runat="server" Text='<%# Bind("N_Nombre") %>' />
                                <br />
                                N_Imagen:
                            <asp:TextBox ID="N_ImagenTextBox" runat="server" Text='<%# Bind("N_Imagen") %>' />
                                <br />
                                N_Descripcion:
                            <asp:TextBox ID="N_DescripcionTextBox" runat="server" Text='<%# Bind("N_Descripcion") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                                <br />
                                <br />
                            </span>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <span>No se han devuelto datos.</span>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <span style="">N_Nombre:
                            <asp:TextBox ID="N_NombreTextBox0" runat="server" Text='<%# Bind("N_Nombre") %>' />
                                <br />
                                N_Imagen:
                            <asp:TextBox ID="N_ImagenTextBox0" runat="server" Text='<%# Bind("N_Imagen") %>' />
                                <br />
                                N_Descripcion:
                            <asp:TextBox ID="N_DescripcionTextBox0" runat="server" Text='<%# Bind("N_Descripcion") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" Text="Borrar" />
                                <br />
                                <br />
                            </span>
                        </InsertItemTemplate>

                        <ItemTemplate>
                            <!-- Este es el item que se usa -->
                            <div class="card mb-3" style="width: 530px; align-content: center; align-items: center; padding-top: 1%; background-color: #CFCDD4; margin-left: 20%">
                                <asp:Image class="card-img-top" ID="Image1" runat="server" Height="300px" ImageUrl='<%# Eval("N_Imagen") %>' Width="500px" />
                                <div class="card-body">
                                    <asp:Label ID="Label1" class="card-title" runat="server" Style="font-size: 1.5em; width: 500px" Text='<%# Eval("N_Nombre") %>'></asp:Label>
                                    <br />
                                    <asp:Label class="card-text" ID="Label2" runat="server" Text='<%# Eval("N_Descripcion") %>'></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Button class="btn btn-secondary" ID="btnSeleccionNoticia" runat="server" CommandArgument='<%# Eval("N_Codigo_Noticia") %>' OnCommand="btn_Modificar_Command" Text="Modificar"/>
                                </div>
                            </div>

                        </ItemTemplate>
                        <LayoutTemplate>
                            <div style="" id="itemPlaceholderContainer" runat="server" class="text-center">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <span style="">N_Nombre:
                            <asp:Label ID="N_NombreLabel1" runat="server" Text='<%# Eval("N_Nombre") %>' />
                                <br />
                                N_Imagen:
                            <asp:Label ID="N_ImagenLabel" runat="server" Text='<%# Eval("N_Imagen") %>' />
                                <br />
                                N_Descripcion:
                            <asp:Label ID="N_DescripcionLabel1" runat="server" Text='<%# Eval("N_Descripcion") %>' />
                                <br />
                                <br />
                            </span>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </td>
                <td>
                    <br />
                </td>
            </tr>
        </table>
        &nbsp;
        <asp:SqlDataSource ID="SqlDataNoticias" runat="server" ConnectionString="<%$ ConnectionStrings:PARCIAL_LAB_3_Version_10ConnectionString2 %>" SelectCommand="SELECT [N_Nombre], [N_Imagen], [N_Descripcion], [N_Codigo_Noticia] FROM [Noticias]"></asp:SqlDataSource>

        <br />
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>

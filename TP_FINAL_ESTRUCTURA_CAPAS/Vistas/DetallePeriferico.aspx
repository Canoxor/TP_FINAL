<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallePeriferico.aspx.cs" Inherits="Vistas.DetallePeriferico" %>

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
            width: 536px;
        }

        .auto-style2 {
            text-align: left;
            width: 601px;
        }

        .auto-style3 {
            margin-left: 94px;
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
        &nbsp
        &nbsp
        &nbsp
        <br />
        <p>
            &nbsp;
        </p>
        <table class="w-100">
            <tr>
                <td class="auto-style2">
                    <div class="text-left">
                        <asp:Label ID="lbl_Codigo" runat="server" CssClass="text-white" Text="Label Invisible" Visible="False"></asp:Label>
                        <br />
                        <br />
                    </div>
                    <asp:SqlDataSource ID="DS_DetallePeriferico" runat="server" ConnectionString="<%$ ConnectionStrings:PARCIAL_LAB_3_Version_10ConnectionString2 %>" SelectCommand="SELECT [PE_Imagen], [PE_Nombre], [PE_Descripcion], [PE_PrecioUnitario] FROM [Perifericos] WHERE ([PE_Codigo_Periferico] = @PE_Codigo_Periferico)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lbl_Codigo" Name="PE_Codigo_Periferico" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style1">
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="DS_DetallePeriferico" CssClass="auto-style3">
                        <EditItemTemplate>
                            PE_Nombre:
                                <asp:TextBox ID="PE_NombreTextBox1" runat="server" Text='<%# Bind("PE_Nombre") %>' />
                            <br />
                            PE_Descripcion:
                                <asp:TextBox ID="PE_DescripcionTextBox" runat="server" Text='<%# Bind("PE_Descripcion") %>' />
                            <br />
                            PE_PrecioUnitario:
                                <asp:TextBox ID="PE_PrecioUnitarioTextBox1" runat="server" Text='<%# Bind("PE_PrecioUnitario") %>' />
                            <br />
                            PE_Imagen:
                                <asp:TextBox ID="PE_ImagenTextBox1" runat="server" Text='<%# Bind("PE_Imagen") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            PE_Nombre:
                                <asp:TextBox ID="PE_NombreTextBox2" runat="server" Text='<%# Bind("PE_Nombre") %>' />
                            <br />
                            PE_Descripcion:
                                <asp:TextBox ID="PE_DescripcionTextBox0" runat="server" Text='<%# Bind("PE_Descripcion") %>' />
                            <br />
                            PE_PrecioUnitario:
                                <asp:TextBox ID="PE_PrecioUnitarioTextBox2" runat="server" Text='<%# Bind("PE_PrecioUnitario") %>' />
                            <br />
                            PE_Imagen:
                                <asp:TextBox ID="PE_ImagenTextBox2" runat="server" Text='<%# Bind("PE_Imagen") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="text-center">
                                <span class="text-white">
                                    <asp:Image ID="J_Imagen0" runat="server" Height="300px" ImageUrl='<%# Eval("PE_Imagen") %>' Style="border-radius: 20px" Width="300px" />
                                    <br />
                                    <br />
                                    <asp:Label ID="NombreLabel" runat="server" CssClass="auto-style6" Text='<%# Eval("PE_Nombre") %>'></asp:Label>
                                    <br />
                                    <br />
                                    <span class="auto-style6">Descripcion</span><br />
                                    <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("PE_Descripcion") %>'></asp:Label>
                                    <br />
                                    <br />
                                    Precio: $
                                    <asp:Label ID="PrecioUnitarioLabel" runat="server" Text='<%# Eval("PE_PrecioUnitario") %>'></asp:Label>
                                    <br />
                                    <br />
                                    ¿Desea agregar este periférico al carrito?<br />
                                </span>
                                <br />
                                <asp:Button ID="btn_Agregar" runat="server" Text="Agregar" />
                                <br />
                                <br />
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleJuego.aspx.cs" Inherits="Vistas.DetalleJuego" %>

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
            width: 628px;
            text-align: center;
        }

        .auto-style3 {
            width: 440px;
        }

        .auto-style4 {
            height: 44px;
        }

        .auto-style7 {
            margin-left: 183px;
        }
    </style>
</head>
<body>
    <form id="formDetalleJuego" runat="server">
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
                            <asp:Button class="btn btn-secondary" ID="btnCerrarSesion" runat="server" style="position: center;text-align: center; width:100%" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />
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
                    <td class="auto-style3">
                        <br />
                        <asp:Label ID="lbl_Mensaje" runat="server" CssClass="text-white" Visible="False">Label invisible</asp:Label>
                        <br />
                    </td>
                    <td class="auto-style2">
                        <asp:FormView ID="FormView1" runat="server" CssClass="auto-style7" DataKeyNames="J_Codigo_Juego" DataSourceID="DS_DetalleJuego">
                            <EditItemTemplate>
                                J_Imagen:
                                <asp:TextBox ID="J_ImagenTextBox" runat="server" Text='<%# Bind("J_Imagen") %>' />
                                <br />
                                J_Nombre:
                                <asp:TextBox ID="J_NombreTextBox" runat="server" Text='<%# Bind("J_Nombre") %>' />
                                <br />
                                J_Descripcion:
                                <asp:TextBox ID="J_DescripcionTextBox" runat="server" Text='<%# Bind("J_Descripcion") %>' />
                                <br />
                                J_PrecioUnitario:
                                <asp:TextBox ID="J_PrecioUnitarioTextBox" runat="server" Text='<%# Bind("J_PrecioUnitario") %>' />
                                <br />
                                J_Codigo_Juego:
                                <asp:Label ID="J_Codigo_JuegoLabel1" runat="server" Text='<%# Eval("J_Codigo_Juego") %>' />
                                <br />
                                J_Estado:
                                <asp:CheckBox ID="J_EstadoCheckBox" runat="server" Checked='<%# Bind("J_Estado") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                J_Imagen:
                                <asp:TextBox ID="J_ImagenTextBox0" runat="server" Text='<%# Bind("J_Imagen") %>' />
                                <br />
                                J_Nombre:
                                <asp:TextBox ID="J_NombreTextBox0" runat="server" Text='<%# Bind("J_Nombre") %>' />
                                <br />
                                J_Descripcion:
                                <asp:TextBox ID="J_DescripcionTextBox0" runat="server" Text='<%# Bind("J_Descripcion") %>' />
                                <br />
                                J_PrecioUnitario:
                                <asp:TextBox ID="J_PrecioUnitarioTextBox0" runat="server" Text='<%# Bind("J_PrecioUnitario") %>' />
                                <br />
                                J_Codigo_Juego:
                                <asp:TextBox ID="J_Codigo_JuegoTextBox" runat="server" Text='<%# Bind("J_Codigo_Juego") %>' />
                                <br />
                                J_Estado:
                                <asp:CheckBox ID="J_EstadoCheckBox0" runat="server" Checked='<%# Bind("J_Estado") %>' />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                
                            <td class="card-columns">
                                <td class="card border-dark mb-3" style="border-radius: 20px; border-width:medium;  width: 450px; align-content: center; align-items: center; padding-left:5%;padding-right:5%; padding-top:5%; background-color:#FFFFFF; margin-left:20%">
                                    <asp:Image ID="J_Imagen0" Style="border-radius: 20px" runat="server" Height="400px" ImageUrl='<%# Eval("J_Imagen") %>' Width="270px" />
                                <br />
                                <br />
                                <span class="text-black">
                                    <b><asp:Label ID="J_NombreLabel0" runat="server" Text='<%# Eval("J_Nombre") %>' CssClass="auto-style3" Font-Size="22px"></asp:Label></b>
                                </span>
                                <br />
                                <br />
                                <p align="center">
                                    <span style="color: black; font-size: 13pt">
                                        Descripcion
                                        <br />
                                            <asp:Label ID="lblDescripcionJuegoLv_DJ" runat="server" Text='<%# Eval("J_Descripcion") %>'></asp:Label>
                                        <br />
                                        <br />
                                        Precio: $
                                            <asp:Label ID="lblPrecioJuegoLv_DJ" runat="server" Text='<%# Eval("J_PrecioUnitario") %>'></asp:Label>
                                        <br />
                                        <br />
                                        ¿Desea agregar este juego al carrito?
                                        <br />
                                    </span>
                                </p>
                                     <asp:Button ID="btnAgregarCarritoDJ" runat="server" Text="Agregar" PostBackUrl="~/CompraVerificarJuego.aspx"/>
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
                        <asp:SqlDataSource ID="DS_DetalleJuego" runat="server" ConnectionString="<%$ ConnectionStrings:PARCIAL_LAB_3_Version_10ConnectionString2 %>" SelectCommand="SELECT [J_Imagen], [J_Nombre], [J_Descripcion], [J_PrecioUnitario], [J_Codigo_Juego] FROM [Juegos] WHERE ([J_Codigo_Juego] = @J_Codigo_Juego)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lbl_Mensaje" Name="J_Codigo_Juego" PropertyName="Text" Type="String" />
                            </SelectParameters>
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

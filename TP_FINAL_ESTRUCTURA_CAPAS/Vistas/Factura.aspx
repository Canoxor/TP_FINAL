<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="Vistas.Factura" %>

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
        .auto-style4 {
            text-align: left;
            height: 50px;
        }

        .auto-style5 {
            text-align: left;
            width: 23px;
            color: #666699;
            font-weight: bold;
        }

        .auto-style6 {
            text-align: left;
            width: 24px;
        }

        .auto-style7 {
            text-align: left;
            width: 25px;
            font-size: large;
        }

        .auto-style8 {
            text-align: left;
            width: 40px;
        }

        .auto-style10 {
            font-size: large;
        }

        .auto-style11 {
            text-align: left;
            width: 24px;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
        <p>
            &nbsp;
        </p>

        <table class="w-100" style="background: rgb(42, 40, 48); color: white">
            <tr>
                <td class="auto-style4" colspan="3"></td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <br />
                    <br />
                    <br />
                </td>
                <td class="text-left">
                    <strong><span class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style10">Nombre del usuario: </span></span>
                    </strong>
                    <asp:Label ID="lbl_Nombre" runat="server" CssClass="auto-style11"></asp:Label>
                    <strong>
                        <br class="auto-style6" />
                        <br class="auto-style6" />
                        <span class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style10">DNI: </span></span>
                    </strong>
                    <asp:Label ID="lbl_DNI" runat="server" CssClass="auto-style11"></asp:Label>
                    <strong>
                        <br class="auto-style6" />
                        <br class="auto-style6" />
                        <span class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style10">Numero de factura: </span></span>
                    </strong>
                    <asp:Label ID="lbl_NumeroFac" runat="server" CssClass="auto-style11"></asp:Label>
                    <strong>
                        <br class="auto-style6" />
                        <br class="auto-style6" />
                        <span class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style10">Productos:</span></span><br />
                        &nbsp;<div class="text-left">
                            <div class="text-center">
                                <asp:GridView ID="grd_Factura" runat="server" AutoGenerateColumns="False" OnRowDataBound="grd_Factura_RowDataBound" BackColor="White" BorderColor="DimGray" BorderWidth="1px" CellPadding="3" CssClass="auto-style3" Height="30px" Width="1069px" Style="margin-left: 357px">

                                    <Columns>
                                        <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                                        <asp:ImageField DataImageUrlField="Imagen" HeaderText="Imagen" HeaderStyle-Width="130px" ControlStyle-Height="130px" ControlStyle-Width="130px">
                                            <ControlStyle Height="70px" Width="70px"></ControlStyle>

                                            <HeaderStyle Width="130px"></HeaderStyle>
                                        </asp:ImageField>
                                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" HeaderStyle-Width="400px">
                                            <HeaderStyle Width="400px"></HeaderStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Precio" HeaderText="Precio en ARS" HeaderStyle-Width="200px">
                                            <HeaderStyle Width="200px"></HeaderStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" HeaderStyle-Width="200px">
                                            <HeaderStyle Width="200px"></HeaderStyle>
                                        </asp:BoundField>
                                    </Columns>
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                                </asp:GridView>
                            </div>
                            <div class="text-center">
                                <span class="auto-style6"><span class="auto-style10">
                                    <br />
                                    Monto total: </span>
                            
                    </strong>
                    <span class="auto-style7">$</span><strong><span class="auto-style10"> </span>
                    </strong>
                    </span>
                        <asp:Label ID="lbl_MontoTotal" runat="server" CssClass="auto-style11"></asp:Label>
                    <strong>
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" Height="46px" Text="Aceptar y volver" Width="193px" CssClass="auto-style5" />
                        </div>
                        </div>
                    </strong></td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="3"></td>
            </tr>
        </table>

        <div style="width:100%; text-align:center">
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </div>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Vistas.Carrito" %>

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
            width: 299px;
        }
        .auto-style2 {
            width: 565px;
        }
        .auto-style3 {
            font-size: x-large;
        }
        .auto-style4 {
            width: 495px;
            height: 93px;
        }
        .auto-style5 {
            height: 93px;
        }
        .auto-style6 {
            font-size: x-large;
            font-weight: bold;
            color: #666699;
        }
        .auto-style7 {
            color: #fff;
            font-size: x-large;
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
        <br />
        <br />

        <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin:20px; background-color:darkslateblue; color:white;">
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Atencion!&nbsp;&nbsp;&nbsp;</strong> Has entrado a tu carrito, estos son los productos que lo componen.
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true"&times;</span>
        </button>
        </div>
        <br />
        <br />
        <!-- NOMBRE DE COLUMNA = AL DE LA TABLA + TITULO DE LA COLUMNA-->
        <table class="w-100">
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style2">
                    <div class="text-center">
                    <asp:GridView ID="grd_Carrito_Juego" runat="server" AutoGenerateColumns="False" OnRowDataBound="grd_Carrito_RowDataBound" BackColor="White" BorderColor="DimGray" BorderWidth="3px" CellPadding="3" CssClass="auto-style3" Height="30px" Width="1180px" OnRowCommand="grd_Carrito_Juego_RowCommand">
                        
                        <Columns>
                            <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                            <asp:ImageField DataImageUrlField="Imagen" HeaderText="Caratula" HeaderStyle-Width="130px" ControlStyle-Height="170px" ControlStyle-Width="130px">
                            <ControlStyle Height="70px" Width="55px"></ControlStyle>

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
                            <asp:ButtonField ButtonType="Button" HeaderText="Ver juego" Text="Ver" HeaderStyle-Width="150px" CommandName="Ver_Juego_Event">
                            <ControlStyle BackColor="White" ForeColor="#666699" />

<HeaderStyle Width="150px"></HeaderStyle>
                            </asp:ButtonField>
                            <asp:ButtonField ButtonType="Button" HeaderText="Borrar juego" Text="Borrar" HeaderStyle-Width="150px" CommandName="Borrar_Juego_Event">
                            <ControlStyle ForeColor="#666699" />

<HeaderStyle Width="150px"></HeaderStyle>
                            </asp:ButtonField>
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
                        <br />
                    <asp:GridView ID="grd_Carrito_Periferico" runat="server" AutoGenerateColumns="False" OnRowDataBound="grd_Carrito_RowDataBound" BackColor="White" BorderColor="DimGray" BorderWidth="1px" CellPadding="3" CssClass="auto-style3" Height="30px" Width="1180px" OnRowCommand="grd_Carrito_Periferico_RowCommand">
                        
                        <Columns>
                            <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                            <asp:ImageField DataImageUrlField="Imagen" HeaderText="Imagen" HeaderStyle-Width="130px" ControlStyle-Height="130px" ControlStyle-Width="130px" >
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
                            <asp:ButtonField ButtonType="Button" HeaderText="Ver periferico" Text="Ver" HeaderStyle-Width="150px" CommandName="Ver_Periferico_Event">
                            <ControlStyle BackColor="White" ForeColor="#666699" />

<HeaderStyle Width="150px"></HeaderStyle>
                            </asp:ButtonField>
                            <asp:ButtonField ButtonType="Button" HeaderText="Borrar periferico" Text="Borrar" HeaderStyle-Width="150px" CommandName="Borrar_Periferico_Event">
                            <ControlStyle ForeColor="#666699" />

<HeaderStyle Width="150px"></HeaderStyle>
                            </asp:ButtonField>
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
                    <br />
                    <br />
                    <span class="auto-style7">
                    <asp:Label ID="lbl_Total" runat="server"></asp:Label>
                    </span>
                    <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" class="text-left">
                    <br />
                    <table class="w-100">
                        <tr>
                            <td class="auto-style4"></td>
                            <td class="auto-style5"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_Comprar" runat="server" CssClass="auto-style6" Height="57px" OnClick="btn_Comprar_Click" Text="Confirmar carrito" Width="293px" />
                                <br />
                                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_CompraCancelar" runat="server" CssClass="auto-style6" Height="57px" OnClick="btn_CompraCancelar_Click" Text="Cancelar" Visible="False" Width="293px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_CompraAceptar" runat="server" CssClass="auto-style6" Height="57px" OnClick="btn_CompraAceptar_Click" Text="Aceptar" Visible="False" Width="293px" />
                                </strong></td>
                            <td class="auto-style5"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
    </body>
</html>

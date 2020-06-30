<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompraVerificarJuego.aspx.cs" Inherits="Vistas.CompraVerificarJuego" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
            text-align: right;
            width: 936px;
        }
        .auto-style3 {
            margin-right: 75px;
        }
        .auto-style4 {
            font-size: x-large;
        }
        .auto-style5 {
            text-align: left;
            font-size: x-large;
        }
        .auto-style6 {
            font-weight: normal;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style8 {
            font-size: medium;
        }
        .auto-style9 {
            font-size: medium;
            color: red;
        }
    </style>
</head>
<body>
    <p>
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
                            <a class="dropdown-item nav-link" style="text-align: center" href="#"><i class="fas fa-sign-out-alt"></i>Cerrar Sesion</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>



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
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>

        <table class="w-100" style="background:rgb(42, 40, 48); color:white">
            <tr>
                <td class="auto-style2" rowspan="4">
                    &nbsp;<br />
                    <asp:Image ID="img_Imagen" runat="server" CssClass="auto-style3" Width="243px"/>
                </td>
                <td class="auto-style5"><span class="auto-style4">&nbsp;<br />
                    N<strong><span class="auto-style6">ombre:</span> </strong> </span> &nbsp;<asp:Label ID="lbl_Nombre" runat="server" CssClass="auto-style4"></asp:Label>
                    <br class="auto-style4" /><span class="auto-style4">&nbsp;

                </span>

                </td>
            </tr>
            <tr>
                <td class="auto-style5"><span class="auto-style4">Precio unitario:<strong> </strong> </span> &nbsp;$ <asp:Label ID="lbl_Precio" runat="server" CssClass="auto-style4"></asp:Label>
                    <br class="auto-style4" /><span class="auto-style4">&nbsp;
                </span>
                </td>
            </tr>
            <tr>
                <td class="auto-style5"><span class="auto-style4">Cantidad:<strong> </strong> </span> &nbsp;<asp:TextBox ID="txt_Cantidad" runat="server" Height="28px" Width="55px" CssClass="auto-style4"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_Actualizar" runat="server" CssClass="auto-style8" Height="31px" OnClick="btn_Actualizar_Click" Text="Actualizar monto" />
                    <br class="auto-style4" /><span class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Cantidad" CssClass="auto-style9" ErrorMessage="RequiredFieldValidator">* Debe ingresar una cantidad</asp:RequiredFieldValidator>

                </span>

                </td>
            </tr>
            <tr>
                <td class="auto-style5"><span class="auto-style4">Monto total:<strong> </strong></span>&nbsp;<asp:Label ID="lbl_Monto" runat="server" CssClass="auto-style4"></asp:Label>
                    <br class="auto-style4" /><span class="auto-style4">&nbsp;

                </span>

                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;<br />
                    <asp:Button ID="btn_Cancelar" runat="server" Text="Cancelar y volver" CssClass="auto-style7" Height="45px" Width="197px" PostBackUrl="~/Juegos.aspx" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

                </td>
                <td class="text-left">&nbsp;
                    <br />
                    <asp:Button ID="btn_Confirmar" runat="server" Text="Agregar al carrito" CssClass="auto-style7" Height="45px" Width="197px" PostBackUrl="~/CompraMensajeJuego.aspx" OnClick="btn_Confirmar_Click" />
                    <br />
&nbsp;</td>
            </tr>
        </table>

        <p>
            <asp:Label ID="lbl_Codigo" runat="server" CssClass="text-white" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:SqlDataSource ID="DS_CompraJuego" runat="server" ConnectionString="<%$ ConnectionStrings:PARCIAL_LAB_3_Version_10ConnectionString2 %>" SelectCommand="SELECT [J_Codigo_Juego], [J_Imagen], [J_Nombre], [J_PrecioUnitario] FROM [Juegos] WHERE ([J_Codigo_Juego] = @J_Codigo_Juego)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbl_Codigo" Name="J_Codigo_Juego" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </form>
</body>
</html>

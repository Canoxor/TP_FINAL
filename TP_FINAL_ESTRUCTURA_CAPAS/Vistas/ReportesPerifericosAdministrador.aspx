<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportesPerifericosAdministrador.aspx.cs" Inherits="Vistas.ReportesPerifericosAdministrador" %>

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
    <title>True Games Administrador</title>
    <style type="text/css">
        .fondoPrimarioCard {
            background-color: #C9C7D0;
            width: 70%;
        }

        .fondoSecundarioCard {
            background-color: #AEACB3;
        }
        .auto-style7 {
            color: #fff;
            font-size: medium;
        }
        .auto-style14 {
            width: 100%;
            height: 137px;
        }
        .auto-style15 {
            height: 68px;
            text-align: center;
            font-size: x-large;
            color: #FFFFFF;
        }
        .auto-style22 {
            color: #fff;
            font-size: x-large;
            text-decoration: underline;
        }
        .auto-style28 {
            height: 69px;
            text-align: center;
        }
        .auto-style33 {
            margin-left: 682px;
        }
        .auto-style34 {
            font-size: large;
        }
        .auto-style35 {
            text-align: center;
            font-weight: bold;
            font-size: large;
            color: #FFFFFF;
        }
        .auto-style37 {
            font-weight: normal;
        }
        .auto-style38 {
            font-size: x-large;
        }
        .auto-style39 {
            text-align: center;
            font-weight: bold;
            font-size: x-large;
            color: #FFFFFF;
        }
        .auto-style40 {
            color: #fff;
            font-size: medium;
            font-weight: bold;
        }
        .auto-style41 {
            font-size: medium;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="formLandingPageAdministrador" runat="server">
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
        <br />
        <br />
        <br />
        <table class="w-100"  style="background-color:ThreeDDarkShadow">
            <tr>
                <td class="text-center"><strong class="auto-style37"><span class="auto-style38">&nbsp;</span></strong><span class="auto-style22"><strong>Reporte de perifericos</strong></span></td>
            </tr>
        </table>
        <br />
        <table class="auto-style14">
            <tr>
                <td class="auto-style39">Consultar el estado del stock de todos los perifericos</td>
            </tr>
            <tr>
                <td class="auto-style35">Ordenar por:</td>
            </tr>
            <tr>
                <td class="text-center">
                    <span class="text-white">
                    <asp:CheckBox ID="chk_Stock" runat="server" CssClass="auto-style34" OnCheckedChanged="chk_Stock_CheckedChanged" Text="Stock" />
                    <br />
                    <asp:CheckBox ID="chk_Genero" runat="server" CssClass="auto-style34" OnCheckedChanged="chk_Genero_CheckedChanged" Text="Tipo" />
                    </span>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="text-center">
                    <asp:Button ID="btn_FiltrarS" runat="server" Text="Filtrar" OnClick="btn_FiltrarS_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="btn_LimpiarS" runat="server" Text="Limpiar filtros" />
                </td>
            </tr>
        </table>
        <br />
        <table class="w-100" style="background-color:ThreeDDarkShadow">
            <tr>
                <td class="text-center" >
        <asp:GridView ID="grd_ReporteS" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style33" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <table class="auto-style14">
            <tr>
                <td class="auto-style15"><strong>Calcular el porcentaje de venta del tipo de perifericos</strong></td>
            </tr>
            <tr>
                <td class="auto-style28">
                    <span class="auto-style7"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></span><span class="auto-style40">De esta fecha:&nbsp; </span>
                    <asp:TextBox ID="txt_FechaMin" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
&nbsp;<b><br class="auto-style7" />
                    <span class="auto-style7">Hasta esta fecha:&nbsp; </span></b>
                    <asp:TextBox ID="txt_FechaMax" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                    <b>
                    <br class="auto-style7" />
                    <span class="auto-style7">Codigo del periferico:&nbsp; </span></b>
                    <asp:TextBox ID="txt_CodigoPerif" runat="server" TextMode="Number" CssClass="auto-style41" Width="94px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
                    <asp:CheckBox ID="chk_TotosTipos" runat="server" CssClass="auto-style7" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Todos los tipos" TextAlign="Left" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">
                    <asp:Button ID="btn_FiltrarV" runat="server" Text="Filtrar" />
&nbsp;&nbsp;
                    <asp:Button ID="btn_LimpiarV" runat="server" Text="Limpiar filtros" />
                </td>
            </tr>
        </table>
        <br />
        <table class="w-100"  style="background-color:ThreeDDarkShadow">
            <tr>
                <td>
        <asp:GridView ID="grd_ReporteV" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style33" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
    <p class="text-white">
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>

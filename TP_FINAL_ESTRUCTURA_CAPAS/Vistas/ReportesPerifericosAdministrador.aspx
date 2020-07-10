<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportesPerifericosAdministrador.aspx.cs" Inherits="Vistas.ReportesPerifericosAdministrador" %>

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
    </head>
<body>
    <form id="form1" runat="server">

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
                        <asp:Label ID="lblUsuario" runat="server" Style="color: white; margin-right: 20px"></asp:Label>
                    </li>
                    <li class="nav-item align-content-lg-end">
                        <asp:Button class="btn btn-secondary" ID="btnCerrarSesion" runat="server" Style="position: center; text-align: center; width: 100%" Text="Cerrar Sesion" OnClick="btnCerrarSesion_Click" />
                    </li>
                </ul>
            </div>
        </nav>

        <div style="width: 100%; text-align: center; color: white">
            <h2 style="color: yellow"><span class="auto-style22"><strong>Reporte de perifericos</strong></span></h2>
            <h3>Consultar el estado del stock de todos los perifericos</h3>
            <h4>Ordenar por:</h4>
            <span class="text-white">
                <asp:CheckBox ID="chk_Stock" runat="server" CssClass="auto-style34" OnCheckedChanged="chk_Stock_CheckedChanged" Text="Stock" AutoPostBack="true" />
            </span>
            <br />
            <asp:CheckBox ID="chk_TipoDePeriferico" runat="server" CssClass="auto-style34" OnCheckedChanged="chk_Genero_CheckedChanged" Text="Tipo de Periferico" AutoPostBack="true" />
            <br />
            <div style="text-align: center">
                <asp:Button CssClass="btn btn-primary" ID="btn_FiltrarS" runat="server" Text="Filtrar" Style="margin-right: 10px" OnClick="btn_FiltrarS_Click" />
                <asp:Button CssClass="btn btn-secondary" ID="btn_LimpiarS" runat="server" Text="Limpiar filtros" Style="margin-left: 10px" OnClick="btn_LimpiarS_Click" />
            </div>
            <div style="margin-top: 1%">
                <asp:GridView Style="margin-left: 30%" ID="grd_ReporteS" runat="server" CellPadding="4" CssClass="auto-style33" ForeColor="#333333" GridLines="None">
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
            </div>
        </div>

        <div style="width: 100%; height: 5px; background-color: white; margin-top: 10px; margin-bottom: 10px"></div>


        <div style="width: 100%; text-align: center; margin-top: 2%; color: white">
            <h3>Calcular el porcentaje de venta de los distintos tipos de perifericos</h3>
            <div style="width: 100%">
                <table class="w-100" style="padding: 10px">
                    <tr>
                        <td style="width: 50%; text-align: right">De esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaInicialGeneros" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFechaInicialGeneros" runat="server" ControlToValidate="txtFechaInicialGeneros" ValidationGroup="Grupo1">Ingrese una fecha inicial</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Hasta esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaFinalGeneros" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFechaFinalGeneros0" runat="server" ControlToValidate="txtFechaFinalGeneros" ValidationGroup="Grupo1">Ingrese una fecha final</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Filtrar por un tipo de periferico en especifico: </td>
                        <td style="width: 50%; text-align: left">
                            <asp:DropDownList ID="ddlTipoDePerifericos" runat="server">
                            </asp:DropDownList>
                            <asp:Label ID="lblMensajeErrorDDLTipoPerifericos" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:CheckBox ID="chk_TodosTiposDeGeneros" runat="server" Style="margin-top: 10px" CssClass="auto-style7" Text="Todos los tipos de perifericos" TextAlign="Left" OnCheckedChanged="chk_TodosTiposDeGeneros_CheckedChanged" AutoPostBack="true" />
            <div style="margin-top: 10px">
                <asp:Button CssClass="btn btn-primary" ID="btn_FiltrarG" Style="margin-right: 10px" runat="server" Text="Filtrar" ValidationGroup="Grupo1" OnClick="btn_FiltrarG_Click" />
                <asp:Button CssClass="btn btn-secondary" ID="btn_LimpiarG" Style="margin-left: 10px" runat="server" Text="Limpiar filtros" OnClick="btn_LimpiarG_Click" />
            </div>
            <div style="width: 100%; text-align: center; margin-top: 1%">
                <asp:GridView ID="grdReporteTipoPerifericos" Style="margin-left: 30%" runat="server" CellPadding="4" CssClass="auto-style33" ForeColor="#333333" GridLines="None">
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
                <asp:Label ID="lblMensajeAclarativoGrdGeneros" runat="server"></asp:Label>
            </div>
        </div>

        <div style="width: 100%; height: 5px; background-color: white; margin-top: 10px; margin-bottom: 10px"></div>

        <div style="width: 100%; text-align: center; margin-top: 2%; color: white">
            <h3>Calcular el porcentaje de la cantidad de Perifericos vendidos de un periferico en particular</h3>
            <div style="width: 100%">
                <table class="w-100" style="padding: 10px">
                    <tr>
                        <td style="width: 50%; text-align: right">De esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaInicialCantVendidos" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFechaInicialCantVendidos" ValidationGroup="Grupo2">Ingrese una fecha inicial</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Hasta esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaFinalCantVendidos" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFechaFinalCantVendidos" ValidationGroup="Grupo2">Ingrese una fecha final</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Filtrar por un Periferico en especifico: </td>
                        <td style="width: 50%; text-align: left">
                            <asp:DropDownList ID="ddlPerifericosCantVendidos" runat="server">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvDDLPerifericosCantVendida" runat="server" ControlToValidate="ddlPerifericosCantVendidos" ForeColor="White" ValidationGroup="Grupo2" InitialValue="0">Guarde un Periferico Primero</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-top: 10px">
                <asp:Button CssClass="btn btn-primary" ID="btnFiltrarCantJuegosVendidos" Style="margin-right: 10px" runat="server" Text="Filtrar" ValidationGroup="Grupo2" OnClick="btnFiltrarCantJuegosVendidos_Click" />
                <asp:Button CssClass="btn btn-secondary" ID="btnLimpiarFiltrosCantJuegosVendidos" Style="margin-left: 10px" runat="server" Text="Limpiar filtros" OnClick="btnLimpiarFiltrosCantJuegosVendidos_Click" />
            </div>
            <div style="width: 100%; text-align: center; margin-top: 1%">
                <asp:GridView ID="grdCantPerifericosVendidos" Style="margin-left: 42%" runat="server" CellPadding="4" CssClass="auto-style33" ForeColor="#333333" GridLines="None">
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
            </div>
        </div>

        <div style="width: 100%; height: 5px; background-color: white; margin-top: 10px; margin-bottom: 10px"></div>

        <div style="width: 100%; text-align: center; margin-top: 2%; color: white">
            <h3>Calcular la ganancia y el porcentaje de ganancia de los Perifericos vendidos</h3>
            <div style="width: 100%">
                <table class="w-100" style="padding: 10px">
                    <tr>
                        <td style="width: 50%; text-align: right">De esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaInicialPorcentajeMonto" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFechaInicialPorcentajeMonto" ValidationGroup="Grupo3">Ingrese una fecha inicial</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Hasta esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaFinalPorcentajeMonto" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFechaFinalPorcentajeMonto" ValidationGroup="Grupo3">Ingrese una fecha final</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Filtrar por un Periferico en especifico: </td>
                        <td style="width: 50%; text-align: left">
                            <asp:DropDownList ID="ddlPerifericosPorcentajeMonto" runat="server">
                            </asp:DropDownList>
                            <asp:Label ID="lblValidacionDDLPerifericos" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:CheckBox ID="cb_PerifericosMonto" runat="server" Style="margin-top: 10px" CssClass="auto-style7" Text="Todos los Perifericos" TextAlign="Left" AutoPostBack="true" OnCheckedChanged="cb_JuegosMonto_CheckedChanged" />
            <div style="margin-top: 10px">
                <asp:Button CssClass="btn btn-primary" ID="btnFiltrarPorcentajeMonto" Style="margin-right: 10px" runat="server" Text="Filtrar" ValidationGroup="Grupo3" OnClick="btnFiltrarPorcentajeMonto_Click" />
                <asp:Button CssClass="btn btn-secondary" ID="btnLimpiarFiltrosPorcentajeMonto" Style="margin-left: 10px" runat="server" Text="Limpiar filtros" OnClick="btnLimpiarFiltrosPorcentajeMonto_Click" />
            </div>
            <div style="width: 100%; text-align: center; margin-top: 1%">
                <asp:GridView ID="grdPorcentajeMontoPeriferico" Style="margin-left: 42%" runat="server" CellPadding="4" CssClass="auto-style33" ForeColor="#333333" GridLines="None">
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
                <asp:Label Style="margin-top: 15px" ID="lblMensajeAclarativoMontoPeriferico" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>

        <br />
        <br />
        <br />
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

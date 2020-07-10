<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacturasAdministrador.aspx.cs" Inherits="Vistas.FacturasAdministrador" %>

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
                    <li class="nav-item">
                        <a href="FacturasAdministrador.aspx" class="nav-link" style="color: #8B8C91">Facturas</a>
                    </li>
                    <li class="nav-item">
                        <a href="ReportesAdministrador.aspx" class="nav-link" >Reportes</a>
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


        <table class="w-100" style="margin-top: 2%; margin-bottom: 5%">
            <tr style="text-align: center; width: 100%">
                <td style="width: 50%">
                    <a style="color: white">Buscar Factura por Codigo de Usuario:</a>
                    <asp:TextBox ID="txtBusquedaFactura" runat="server"></asp:TextBox>
                    <asp:Button class="btn btn-primary btn-sm" ID="btnBuscarFactura" runat="server" Style="position: center" Text="Buscar" OnClick="btnBuscarFactura_Click" />
                </td>
                <td style="width: 50%">
                    <div class="btn-group dropdown">
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filtar Facturas</button>
                        <div class="dropdown-menu">
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltrarFechaReciente" runat="server" Style="position: center" Text="Fecha Mas Reciente" OnClick="btnFiltrarFechaReciente_Click" />
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltrarFechaMenosReciente" runat="server" Style="position: center" Text="Fecha Menos Reciente" OnClick="btnFiltrarFechaMenosReciente_Click" />
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltrarMontoDesc" runat="server" Style="position: center" Text="Monto Total Descendente" OnClick="btnFiltrarMontoDesc_Click" />
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltrarMontoAsc" runat="server" Style="position: center" Text="Monto Total Ascendente" OnClick="btnFiltrarMontoAsc_Click" />
                            <asp:Button class="dropdown-item btn btn-secondary" ID="btnFiltrarUsuarios" runat="server" Style="position: center" Text="Usuarios Agrupados" OnClick="btnFiltrarUsuarios_Click" />
                        </div>
                    </div>
                </td>
            </tr>
        </table>


        <asp:GridView ID="grdFacturas" style="margin-left:27%" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="8" GridLines="Horizontal" PageSize="7" OnPageIndexChanging="grdFacturas_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="Codigo de Factura">
                    <ItemTemplate>
                        <asp:Label ID="lblCodigoFactura" runat="server" Text='<%# Bind("F_Codigo_Factura") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Codigo de Usuario">
                    <ItemTemplate>
                        <asp:Label ID="lblCodigoUsuario" runat="server" Text='<%# Bind("F_Codigo_Usuario") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Monto Total">
                    <ItemTemplate>
                        <asp:Label ID="lblMontoTotal" runat="server" Text='<%# Bind("F_MontoTotal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha">
                    <ItemTemplate>
                        <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("F_Fecha") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField ButtonType="Button" CommandName="eventoDetalle" Text="Ver Detalle" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>



    </form>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>

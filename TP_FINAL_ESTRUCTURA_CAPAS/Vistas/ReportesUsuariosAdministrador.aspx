<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportesUsuariosAdministrador.aspx.cs" Inherits="Vistas.ReportesUsuariosAdministrador" %>

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
            text-align: center;
            font-size: xx-large;
            color: #FFCC00;
        }
    </style>
</head>
<body>
    <form id="formUsuariosAdministrador" runat="server">
        <!-- Navbar -->

        <nav id="mainNavbar" class="navbar navbar-dark navbar-expand-md py-0" style="background: rgb(42, 40, 48)">
            <a href="LandingPageAdministrador.aspx" class="navbar-brand">
                <img src="imgs/LogoPagina.png" />True Games AdministradorTrue Games Administrador</a>
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
                        <a href="FacturasAdministrador.aspx" class="nav-link">Facturas</a>
                    </li>
                    <li class="nav-item">
                        <a href="ReportesAdministrador.aspx" class="nav-link" style="color: #8B8C91">Reportes</a>
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
            <div style="text-align: center; margin-top: 2%; color: white" class="w-100">
                <div style="width: 100%">
                    <table class="w-100" style="padding: 10px">
                        <tr>
                            <td class="text-right">
                                <asp:Button CssClass="btn btn-primary" ID="btn_Menu" Style="margin-right: 10px" runat="server" Text="Volver al menú" OnClick="btn_Menu_Click" Width="123px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1"><strong>Reportes de Usuarios</strong></td>
                        </tr>
                    </table>
                </div>


            </div>
        </div>
        <div style="width: 100%; text-align: center; margin-top: 2%; color: white">
            <h2><strong>Calcular la cantidad de compras que realizó un usuarioCalcular la cantidad de compras que realizó un usuario</strong></h2>
            <div style="width: 100%">
                <table class="w-100" style="padding: 10px">
                    <tr>
                        <td style="width: 50%; text-align: right">De esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaInicial_1" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_FechaInicio_1" runat="server" ControlToValidate="txtFechaInicial_1" ErrorMessage="Debe introducir una fecha de inicio" ValidationGroup="Grupo_1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Hasta esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaFinal_1" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_FechaFin_1" runat="server" ErrorMessage="Debe introducir una fecha de fin" ControlToValidate="txtFechaFinal_1" ValidationGroup="Grupo_1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Codigo de usuario: </td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtCodigoUsuario_1" runat="server" Width="93px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_Usuario_1" runat="server" ErrorMessage="Debe introducir un codigo de usuario" ControlToValidate="txtCodigoUsuario_1" ValidationGroup="Grupo_1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-top: 10px">
                <asp:Button CssClass="btn btn-primary" ID="btn_Filtrar_1" Style="margin-right: 10px" runat="server" Text="Filtrar" ValidationGroup="Grupo_1" OnClick="btn_Filtrar_1_Click" />
                <asp:Button CssClass="btn btn-secondary" ID="btn_Limpiar_1" Style="margin-left: 10px" runat="server" Text="Limpiar filtros" OnClick="btn_Limpiar_1_Click" />
            </div>
            <div style="width: 100%; text-align: center; margin-top: 1%">
                <asp:GridView ID="grdReporteUsuarios_1" Style="margin-left: 47%" runat="server" CellPadding="4" CssClass="auto-style33" ForeColor="#333333" GridLines="None">
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
                <asp:Label ID="lblMensajeAclarativoGrd_1" runat="server"></asp:Label>
            </div>


        </div>

        <div style="width: 100%; text-align: center; margin-top: 2%; color: white">
            <h2><strong>Informar las compras que realizaron los usuarios</strong></h2>
            <div style="width: 100%">
                <table class="w-100" style="padding: 10px">
                    <tr>
                        <td style="width: 50%; text-align: right">De esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaInicial_2" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_FechaInicio_2" runat="server" ErrorMessage="Debe introducir una fecha de inicio" ControlToValidate="txtFechaInicial_2" ValidationGroup="Grupo_2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Hasta esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaFinal_2" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_FechaFin_2" runat="server" ErrorMessage="Debe introducir una fecha de fin" ControlToValidate="txtFechaFinal_2" ValidationGroup="Grupo_2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Orden (1=Asc. 2=Desc.):</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtOrden_2" runat="server" TextMode="Number" Width="66px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_Orden_2" runat="server" ErrorMessage="Debe introducir un codigo de orden" ControlToValidate="txtOrden_2" ValidationGroup="Grupo_2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-top: 10px">
                <asp:Button CssClass="btn btn-primary" ID="btn_Filtrar_2" Style="margin-right: 10px" runat="server" Text="Filtrar" ValidationGroup="Grupo_2" OnClick="btn_Filtrar_2_Click" />
                <asp:Button CssClass="btn btn-secondary" ID="btn_Limpiar_2" Style="margin-left: 10px" runat="server" Text="Limpiar filtros" OnClick="btn_Limpiar_2_Click" />
            </div>
            <div style="width: 100%; text-align: center; margin-top: 1%">
                <asp:GridView ID="grdReporteUsuarios_2" Style="margin-left: 38%" runat="server" CellPadding="4" CssClass="auto-style33" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridView_2_PageIndexChanging" PageSize="4">
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
                <asp:Label ID="lblMensajeAclarativoGrd_2" runat="server"></asp:Label>
            </div>


        </div>
        <div style="text-align: center; margin-top: 2%; color: white" class="w-100">
            <h2><strong>Informar los usuarios creados</strong></h2>
            <div style="width: 100%">
                <table class="w-100" style="padding: 10px">
                    <tr>
                        <td style="width: 50%; text-align: right">De esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaInicial_3" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_FechaInicio_3" runat="server" ErrorMessage="Debe introducir una fecha de inicio" ControlToValidate="txtFechaInicial_3" ValidationGroup="Grupo_3"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Hasta esta fecha:</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtFechaFinal_3" runat="server" TextMode="Date" CssClass="auto-style41"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_FechaFin_3" runat="server" ErrorMessage="Debe introducir una fecha de fin" ControlToValidate="txtFechaFinal_3" ValidationGroup="Grupo_3"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%; text-align: right">Orden (1=Asc. 2=Desc.):</td>
                        <td style="width: 50%; text-align: left">
                            <asp:TextBox ID="txtOrden_3" runat="server" TextMode="Number" Width="66px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_Orden_3" runat="server" ErrorMessage="Debe introducir un codigo de orden" ControlToValidate="txtOrden_3" ValidationGroup="Grupo_3"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="margin-top: 10px">
                <asp:Button CssClass="btn btn-primary" ID="btn_Filtrar_3" Style="margin-right: 10px" runat="server" Text="Filtrar" ValidationGroup="Grupo_3" OnClick="btn_Filtrar_3_Click" />
                <asp:Button CssClass="btn btn-secondary" ID="btn_Limpiar_3" Style="margin-left: 10px" runat="server" Text="Limpiar filtros" OnClick="btn_Limpiar_3_Click" />
            </div>
            <div style="width: 100%; text-align: center; margin-top: 1%">
                <asp:GridView ID="grdReporteUsuarios_3" Style="margin-left: 38%" runat="server" CellPadding="4" CssClass="auto-style33" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridView_3_PageIndexChanging" PageSize="3">
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
                <asp:Label ID="lblMensajeAclarativoGrd_3" runat="server"></asp:Label>
                <br />
                <br />
                <br />
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>

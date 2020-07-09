<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vistaArreglo.aspx.cs" Inherits="Vistas.vistaArreglo" %>

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
            font-weight: 600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 100%; text-align: center;color:white">
            <h2 style="color:yellow"><span class="auto-style22"><strong>Reporte de perifericos</strong></span></h2>
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
        <div style="width: 100%; text-align: center; margin-top: 2%;color:white">
            <h2><strong>Calcular el porcentaje de venta de</strong> <span class="auto-style1">los distintos tipos de perifericos</span></h2>
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
            <asp:CheckBox ID="chk_TodosTiposDeGeneros" runat="server" Style="margin-top: 10px" CssClass="auto-style7" Text="Todos los tipos de perifericos" TextAlign="Left" OnCheckedChanged="chk_TodosGeneros_CheckedChanged" AutoPostBack="true" />
            <div style="margin-top: 10px">
                <asp:Button CssClass="btn btn-primary" ID="btn_FiltrarG" Style="margin-right: 10px" runat="server" Text="Filtrar" ValidationGroup="Grupo1" OnClick="btn_FiltrarG_Click" />
                <asp:Button CssClass="btn btn-secondary" ID="btn_LimpiarG" Style="margin-left: 10px" runat="server" Text="Limpiar filtros" OnClick="btn_LimpiarG_Click" />
            </div>
            <div style="width: 100%; text-align:center;margin-top:1%">
                <asp:GridView ID="grdReporteGeneros" Style="margin-left: 30%" runat="server" CellPadding="4" CssClass="auto-style33" ForeColor="#333333" GridLines="None">
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
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>


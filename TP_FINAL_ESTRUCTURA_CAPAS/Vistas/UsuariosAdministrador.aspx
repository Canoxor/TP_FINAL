﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuariosAdministrador.aspx.cs" Inherits="Vistas.UsuariosAdministrador" %>

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
    <form id="formUsuariosAdministrador" runat="server">
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
                        <a href="UsuariosAdministrador.aspx" class="nav-link" style="color: #8B8C91">Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a href="FacturasAdministrador.aspx" class="nav-link">Facturas</a>
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

        <div style="width: 100%; text-align: center; margin-top: 2%; margin-bottom: 2%">
            <a style="color: white">Buscar Usuario Por su Nombre:</a>
            <asp:TextBox ID="txtBusquedaUsuario" style="border-radius:10px;border-color:transparent" runat="server"></asp:TextBox>
            <asp:Button class="btn btn-primary btn-sm" ID="btnBuscarUsuario" runat="server" Style="position: center" Text="Buscar" OnClick="btnBuscarUsuario_Click"/>
        </div>

        <table class="w-100">
            <tr>
                <td style="width: 33%">&nbsp;</td>
                <td style="width: 34%; text-align: center">
                    <asp:GridView ID="grdUsuarios" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnRowDeleting="grdUsuarios_RowDeleting" OnRowEditing="grdUsuarios_RowEditing" AllowPaging="True" OnPageIndexChanging="grdUsuarios_PageIndexChanging" OnRowCancelingEdit="grdUsuarios_RowCancelingEdit" OnRowCommand="grdUsuarios_RowCommand" OnRowUpdating="grdUsuarios_RowUpdating">
                        <Columns>
                            <asp:TemplateField HeaderText="ID Usuario">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_EIT_ID" runat="server" Text='<%# Bind("U_Codigo_Usuario") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_IT_ID" runat="server" Text='<%# Bind("U_Codigo_Usuario") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNombreEdit" runat="server" Text='<%# Bind("U_Nombre") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_IT_Nombre" runat="server" Text='<%# Bind("U_Nombre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Apellido">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtApellidoEdit" runat="server" Text='<%# Bind("U_Apellido") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_IT_Apellido" runat="server" Text='<%# Bind("U_Apellido") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmailEdit" runat="server" Text='<%# Bind("U_Email") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_IT_Email" runat="server" Text='<%# Bind("U_Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contraseña">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtContraseñaEdit" runat="server" Text='<%# Bind("U_Contrasenia") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_IT_Contraseña" runat="server" Text='<%# Bind("U_Contrasenia") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Administrador">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="cbAdminEdit" runat="server" Checked='<%# Bind("U_Admin") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cb_IT_Admin" runat="server" Checked='<%# Bind("U_Admin") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Usuario Activo">
                                <EditItemTemplate>
                                    <asp:Label ID="lblActivoEdit" runat="server" Text='<%# Bind("U_Estado") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cb_IT_Activo" runat="server" Checked='<%# Bind("U_Estado") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField ButtonType="Button" CommandName="eventoActivar" Text="Activar Usuario" />
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
                </td>
                <td style="width: 33%">&nbsp;</td>
            </tr>
        </table>
        <div style="width: 100%; text-align: center; margin-top: 35px">
            <asp:Label ID="lblMensaje" runat="server" Style="color: yellow" Text=""></asp:Label>
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

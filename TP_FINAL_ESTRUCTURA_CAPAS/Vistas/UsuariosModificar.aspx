<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuariosModificar.aspx.cs" Inherits="Vistas.UsuariosModificar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
        .texto {
            width: 50%;
            float: left;
            text-align: end;
            height: 30px;
            margin-top: 15px;
        }

        .textBoxEstilo {
            border-radius: 5px;
            margin-top: 15px;
            border-color: transparent;
            height: 30px;
            margin-left: 10px;
        }

        .divEstilo {
            width: 50%;
            float: left;
        }
    </style>
</head>
<body>
    <form id="formUsuariosModificar" runat="server">
        <div style="width: 100%; margin-top: 4%; color: white">
            <div style="width: 100%; margin-bottom: 1%; text-align: center">
                <asp:Label ID="lblIntro" runat="server" Text="" Style="font-size: 1.2em"></asp:Label>
            </div>
            <div class="texto">Nombre:</div>
            <div class="divEstilo">
                <asp:TextBox ID="txtNombre" CssClass="textBoxEstilo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="Grupo1">Ingrese un Nombre</asp:RequiredFieldValidator>
            </div>
            <div class="texto">Apellido:</div>
            <div class="divEstilo">
                <asp:TextBox ID="txtApellido" CssClass="textBoxEstilo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ValidationGroup="Grupo1">Ingrese un Apellido</asp:RequiredFieldValidator>
            </div>
            <div class="texto">DNI:</div>
            <div class="divEstilo">
                <asp:TextBox ID="txtDni" runat="server" CssClass="textBoxEstilo" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDni" ValidationGroup="Grupo1">Ingrese un DNI</asp:RequiredFieldValidator>
                <asp:Label ID="lblDni" runat="server" Text="" Style="margin-left: 15px"></asp:Label>
            </div>
            <div class="texto">Direccion:</div>
            <div class="divEstilo">
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="textBoxEstilo"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ValidationGroup="Grupo1">Ingrese una Direccion</asp:RequiredFieldValidator>
            </div>
            <div class="texto">Telefono:</div>
            <div class="divEstilo">
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="textBoxEstilo" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ValidationGroup="Grupo1">Ingrese un Telefono</asp:RequiredFieldValidator>
            </div>
            <div class="texto">Email:</div>
            <div class="divEstilo">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textBoxEstilo" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="Grupo1">Ingrese un Email</asp:RequiredFieldValidator>
                <asp:Label ID="lblEmail" runat="server" Text="" Style="margin-left: 15px"></asp:Label>
            </div>
            <div class="texto">Contraseña Actual:</div>
            <div class="divEstilo">
                <asp:TextBox ID="txtContraseniaActual" runat="server" CssClass="textBoxEstilo" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContraseñaActual" runat="server" ControlToValidate="txtContraseniaActual" ValidationGroup="Grupo1">Ingrese la contraseña actual</asp:RequiredFieldValidator>
                <asp:Label ID="lblContraseña" runat="server" Text="" Style="margin-left: 15px"></asp:Label>
            </div>
            <div class="texto">Nueva Contraseña:</div>
            <div class="divEstilo">
                <asp:TextBox ID="txtContraseniaNueva" runat="server" CssClass="textBoxEstilo" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContraseñaNueva" runat="server" ControlToValidate="txtContraseniaNueva" ValidationGroup="Grupo1">Ingrese una contraseña</asp:RequiredFieldValidator>
            </div>
            <div style="width: 50%; float: left; text-align: end; height: 30px; margin-top: 15px">
                <asp:Button class="btn btn-dark btn-m" ID="btnVolver" runat="server" Style="position: center" Text="Volver a mi Perfil" OnClick="btnVolver_Click" />
            </div>
            <div style="width: 50%; float: left; height: 30px; margin-top: 15px">
                <asp:Button class="btn btn-primary btn-m" ID="btnConfirmar" runat="server" Style="position: center; margin-left: 10px" Text="Confirmar Cambios" ValidationGroup="Grupo1" OnClick="btnConfirmar_Click" />
            </div>
            <div style="width: 100%; text-align: center">
                <asp:Label ID="lblMensaje" runat="server" Text="" Style="color: yellow; margin-top: 60px"></asp:Label>
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

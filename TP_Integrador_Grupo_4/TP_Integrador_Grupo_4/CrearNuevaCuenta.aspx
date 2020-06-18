<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearNuevaCuenta.aspx.cs" Inherits="TP_Integrador_Grupo_4.CrearNuevaCuenta" %>

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

        .auto-style2 {
            width: 206px;
        }

        .auto-style3 {
            width: 206px;
        }

    </style>
</head>
<body>

    <form id="formSignIn" runat="server">
        &nbsp
        <div style="text-align: center">
            <h2 style="position: center; color: #ffd800">True Games</h2>
            &nbsp
            <img src="imgs/LogoPagina_M.png" style="position: center; height: 150px; width: 150px" />
        </div>
        &nbsp
        <div style="text-align: center">
            <h6 style="position: center; color: #ffd800">Bienvenido! Por favor completa todos los datos que se requieren para crear tu cuenta!
            </h6>
        </div>
        &nbsp
        <table class="w-100" style="border: none; margin-left: 35%">
            <tr>
                <td class="auto-style2" style="color: #FFFFFF">Nombre:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNombre_SignIn" CssClass="textBoxLogIn" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #FFFFFF">Apellido:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtApellido_SignIn" CssClass="textBoxLogIn" runat="server"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #FFFFFF">Dni:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDni_SignIn" CssClass="textBoxLogIn" runat="server"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #FFFFFF">Nombre de usuario:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtNombreUsuario_SignIn" CssClass="textBoxLogIn" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #FFFFFF">Email:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmail_SignIn" CssClass="textBoxLogIn" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #FFFFFF">Contraseña:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPassword_SignIn" CssClass="textBoxLogIn" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="color: #FFFFFF">Repita su contraseña:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPasswordCheck_SignIn" CssClass="textBoxLogIn" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                </td>
            </tr>

        </table>
        &nbsp
        <div style="text-align: center">
            <asp:Button class="btn btn-primary btn-m" ID="btnCrearCuenta" runat="server" Style="position: center" Text="Crear Cuenta" />
        </div>
        &nbsp
        <div style="text-align: center">
            <asp:Button class="btn btn-secondary btn-m" ID="btnCuentaExistente" runat="server" Style="position: center" Text="¿Ya tienes una cuenta?" OnClick="btnCuentaExistente_Click" />
        </div>
        &nbsp
        <div style="text-align: center">
            <asp:Button class="btn btn-dark btn-m" ID="btnInicio" runat="server" Style="position: center" Text="Volver al Inicio" OnClick="btnInicio_Click"/>
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

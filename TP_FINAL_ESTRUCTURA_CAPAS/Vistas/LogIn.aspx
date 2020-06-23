<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Vistas.LogIn" %>

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
        .auto-style8 {
            width: 206px;
        }

        .auto-style9 {
            width: 138px;
        }
    </style>
</head>
<body>
    <form id="formLogIn" runat="server">
        &nbsp
        <div style="text-align: center">
            <h2 style="position: center; color: #ffd800">True Games</h2>
            &nbsp
            <img src="imgs/LogoPagina_M.png" style="position: center; height: 150px; width: 150px" />
        </div>
        &nbsp
        <div style="text-align: center">
            <h6 style="position: center; color: #ffd800">Bienvenido! Ingresa tu email y contraseña para iniciar sesion!
            </h6>
        </div>
        &nbsp
        <table class="w-100" style="border: none; margin-left: 39%">
            <tr>
                <td class="auto-style9" style="color: #FFFFFF">Email:</td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtEmail_LogIn" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9" style="color: #FFFFFF">Contraseña:</td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtContraseña_LogIn" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        &nbsp
        <div style="text-align: center">
            <asp:Button class="btn btn-primary btn-m" ID="btnIniciarSesion" runat="server" Style="position: center" Text="Iniciar Sesion" />
        </div>
        &nbsp
        <div style="text-align: center">
            <asp:Button class="btn btn-secondary btn-m" ID="btnCrearCuenta_LogIn" runat="server" Style="position: center" OnClick="btnCrearCuenta_LogIn_Click" Text="¿No tienes una cuenta?"/>
        </div>
        &nbsp
        <div style="text-align: center">
            <asp:Button class="btn btn-dark btn-m" ID="btnInicio_LogIn" runat="server" Style="position: center" Text="Volver al Inicio" OnClick="btnInicio_LogIn_Click"/>
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
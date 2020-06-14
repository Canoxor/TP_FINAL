<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Juegos.aspx.cs" Inherits="TP_Integrador_Grupo_4.Juegos" %>

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
    <title>True Games</title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->

        <nav id="mainNavbar" class="navbar navbar-dark navbar-expand-md py-0 sticky-top">
            <a href="#" class="navbar-brand">
                <img src="imgs/LogoPagina.png" />
                True Games</a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between blurb" id="navLinks">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="Juegos.aspx" class="nav-link" style="color:#8B8C91">Juegos</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link">Noticias</a>
                    </li>
                    <li class="nav-item">
                        <a href="Perifericos.aspx" class="nav-link">Perifericos</a>
                    </li>
                </ul>
                <ul class="navbar-nav" style="margin-right: 30px">
                    <li class="nav-item dropdown align-content-lg-end">
                        <asp:Label ID="lblNavbarUsuario" runat="server" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" Text="Usuario"></asp:Label>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item nav-link btn btn-secondary btn-l active" style="text-align: center" role="button" href="#">Mi Cuenta</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item nav-link" style="text-align: center" href="#"><i class="fas fa-sign-out-alt"></i>Cerrar Sesion</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        &nbsp
        <table class="w-100">
            <tr>
                <td style="width: 34%; text-align: center">
                    <a style="color: white">Buscar Juegos:</a>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button class="btn btn-primary btn-sm" ID="Button1" runat="server" Style="position: center" Text="Buscar" />
                </td>
                <td style="width: 33%; text-align: center">
                    <div class="btn-group dropdown">
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filtar Juegos
                        </button>
                        <div class="dropdown-menu">
                            <asp:Button class="dropdown-item btn btn-secondary" ID="Button2" runat="server" Style="position: center" Text="Categoria" />
                            <asp:Button class="dropdown-item btn btn-secondary" ID="Button3" runat="server" Style="position: center" Text="Desarrollador" />
                            <asp:Button class="dropdown-item btn btn-secondary" ID="Button4" runat="server" Style="position: center" Text="Etiquetas PEGI" />
                        </div>
                    </div>
                </td>
                <td style="width: 33%; text-align: center">
                    <asp:Button class="btn btn-secondary" ID="Button5" runat="server" Style="position: center" Text="Lista de deseos" />
                </td>
            </tr>
        </table>
        &nbsp
        &nbsp<table class="w-100">
            <tr>
                <td style="width: 10%; text-align: center"></td>
                <td style="width: 80%; text-align: center">
                    <asp:ListView ID="ListView1" runat="server" style="position: center" >
                    </asp:ListView>
                </td>
                <td style="width: 10%; text-align: center"></td>
            </tr>
        </table>
        &nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>



    </form>
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
</body>
</html>

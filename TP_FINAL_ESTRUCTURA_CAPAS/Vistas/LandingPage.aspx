<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="Vistas.LandingPage" %>

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
    <!--<form id="form1" runat="server">-->

    <!-- Navbar -->

    <nav id="mainNavbar" class="navbar navbar-dark navbar-expand-md py-0 sticky-top">
        <a href="LandingPage.aspx" class="navbar-brand">
            <img src="imgs/LogoPagina.png" />
            True Games</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between blurb" id="navLinks">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="Juegos.aspx" class="nav-link">Juegos</a>
                </li>
                <li class="nav-item">
                    <a href="Noticias.aspx" class="nav-link">Noticias</a>
                </li>
                <li class="nav-item">
                    <a href="Perifericos.aspx" class="nav-link">Perifericos</a>
                </li>
            </ul>
            <ul class="navbar-nav" style="margin-right: 30px">
                <li class="nav-item dropdown align-content-lg-end">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Mi Cuenta
                    </a>
                    <!-- <asp:Label ID="lblNavbarUsuario" runat="server" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" Text="Usuario"></asp:Label>-->
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item nav-link btn btn-primary btn-l active" style="text-align: center" role="button" href="LogIn.aspx"><i class="fas fa-sign-in-alt"></i>Iniciar sesion</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item nav-link" style="text-align: center" href="CrearNuevaCuenta.aspx"><i class="fas fa-user-plus"></i>Crear una cuenta</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Empieza el desarrollo de la landing page -->

    <!-- Carrusel de fotos -->

    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active" style="height: 500px">
                <img src="https://cdn02.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_Fortnite_Chapter2_Season2.jpg" class="d-block w-100" alt="..." />
                <div class="carousel-caption d-none d-md-block">
                    <h1>Juegos</h1>
                    <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                </div>
            </div>
            <div class="carousel-item" style="height: 500px">
                <img src="imgs/COD_4S.jpg" class="d-block w-100" alt="..." />
                <div class="carousel-caption d-none d-md-block">
                    <h1>Noticias</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
            </div>
            <div class="carousel-item" style="height: 500px">
                <img src="imgs/RazerPerifericos.png" class="d-block w-100" alt="..." />
                <div class="carousel-caption d-none d-md-block">
                    <h1>Perifericos</h1>
                    <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- Imagenes con descripcion -->

    <section class="container-fluid px-0">
        <div class="row align-items-center content margen">
            <div class="col-md-6 order-2 order-md-2">
                <a title="Juegos" href="Juegos.aspx">
                    <img src="https://gaming4.cash/wp-content/uploads/2018/04/Best-eSports-games-2018.png" alt="" class="img-fluid" />
                </a>
            </div>
            <div class="col-md-6 text-center order-1 order-md-1">
                <div class="row justify-content-center">
                    <div class="col-10 col-lg-8 blurb mb-5 mb-md-0">
                        <h2>JUEGOS</h2>
                        <p class="lead">
                            Aqui podras encontrar todo tipo de juegos digitales para viciarla como un cra! 
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, iste molestiae
                            beatae, maiores
                            deserunt
                            in voluptatibus
                            aspernatur architecto excepturi delectus soluta? Ipsa, deleniti dolorem hic consequatur
                            repellat eveniet
                            quidem
                            voluptate necessitatibus dolorum delectus minus vitae, ut, veritatis sint ipsum magnam
                            autem nam ex deserunt
                            debitis
                            eaque ratione! Nobis, quidem assumenda.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row align-items-center content margen">
            <div class="col-md-6 text-center order-1 order-md-2">
                <div class="row justify-content-center">
                    <div class="col-10 col-lg-8 blurb mb-5 mb-md-0">
                        <h2>NOTICIAS</h2>
                        <p class="lead">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, iste molestiae
                            beatae, maiores deserunt
                            in voluptatibus
                            aspernatur architecto excepturi delectus soluta? Ipsa, deleniti dolorem hic consequatur
                            repellat eveniet quidem
                            voluptate necessitatibus dolorum delectus minus vitae, ut, veritatis sint ipsum magnam
                            autem nam ex deserunt debitis
                            eaque ratione! Nobis, quidem assumenda.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 order-2 order-md-1">
                <a title="Noticias" href="Noticias.aspx">
                    <img src="https://blog.playstation.com/tachyon/2020/06/ps5-fi.jpg?resize=1088,612&crop_strategy=smart&zoom=1" alt="" class="img-fluid" />
                </a>
            </div>
        </div>
        <div class="row align-items-center content margen">
            <div class="col-md-6 order-2 order-md-2">
                <a title="Perifericos" href="Perifericos.aspx">
                    <img src="https://i.pinimg.com/736x/70/5f/68/705f6887d55626e8ab10eda0eee42cdf.jpg" alt="Redireccion" class="img-fluid" />
                </a>
            </div>
            <div class="col-md-6 text-center order-1 order-md-1">
                <div class="row justify-content-center">
                    <div class="col-10 col-lg-8 blurb mb-5 mb-md-0">
                        <h2>PERIFERICOS</h2>
                        <p class="lead">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque, iste molestiae
                            beatae, maiores
                            deserunt
                            in voluptatibus
                            aspernatur architecto excepturi delectus soluta? Ipsa, deleniti dolorem hic consequatur
                            repellat eveniet
                            quidem
                            voluptate necessitatibus dolorum delectus minus vitae, ut, veritatis sint ipsum magnam
                            autem nam ex deserunt
                            debitis
                            eaque ratione! Nobis, quidem assumenda.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- </form>-->
    <!-- jQuery primero, despues Popper.js, despues Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

    <!--Funcion con javaScript para que cambie de color el navbar al scrolear -->

    <script>
        $(function () {
            $(document).scroll(function () {
                var $nav = $("#mainNavbar");
                $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
            });
        });
    </script>
</body>
</html>
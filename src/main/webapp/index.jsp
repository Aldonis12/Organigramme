<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="favicon.ico">
    <title>Gestion Societe En ligne - Organigramme</title>
    <link rel="stylesheet" href="public/css/simplebar.css">
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="public/css/feather.css">
    <link rel="stylesheet" href="public/css/daterangepicker.css">
    <link rel="stylesheet" href="public/css/app-light.css" id="lightTheme" disabled>
    <link rel="stylesheet" href="public/css/app-dark.css" id="darkTheme">
</head>
<body class="vertical  dark  ">
<div class="wrapper">
    <nav class="topnav navbar navbar-light">
        <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
            <i class="fe fe-menu navbar-toggler-icon"></i>
        </button>

        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link text-muted my-2" href="#" id="modeSwitcher" data-mode="dark">
                    <i class="fe fe-sun fe-16"></i>
                </a>
            </li>
        </ul>
    </nav>

    <aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
        <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
            <i class="fe fe-x"><span class="sr-only"></span></i>
        </a>
        <nav class="vertnav navbar navbar-light">
            <div class="w-100 mb-4 d-flex">
                <a class="navbar-brand mx-auto mt-2 flex-fill text-center">
                    <strong>GESTION-SOCIETE</strong>
                </a>
            </div>

            <p class="text-muted nav-heading mt-4 mb-1">
                <span>Société</span>
            </p>
            <ul class="navbar-nav flex-fill w-100 mb-2">
                <li class="nav-item w-100">
                    <a class="nav-link" href="#" data-toggle="modal" data-target=".modal-full">
                        <i class="fe fe-plus-circle fe-16"></i>
                        <span class="ml-3 item-text">Ajouter</span>
                    </a>
                </li>
                <li class="nav-item w-100">
                    <a class="nav-link" href="#" data-toggle="modal" data-target=".modal-full">
                        <i class="fe fe-layers fe-16"></i>
                        <span class="ml-3 item-text">Listes</span>
                    </a>
                </li>
            </ul>
            <p class="text-muted nav-heading mt-4 mb-1">
                <span>Login</span>
            </p>
            <ul class="navbar-nav flex-fill w-100 mb-2">
                <li class="nav-item dropdown">
                    <a href="#auth" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                        <i class="fe fe-shield fe-16"></i>
                        <span class="ml-3 item-text" data-toggle="modal" data-target=".modal-full">Authentication</span>
                    </a>
                    <ul class="collapse list-unstyled pl-4 w-100" id="auth" >
                        <a class="nav-link pl-3" href="./auth-login.html" data-toggle="modal" data-target=".modal-full"><span class="ml-1">Société</span></a>
                        <a class="nav-link pl-3" href="./auth-login-half.html" data-toggle="modal" data-target=".modal-full"><span class="ml-1">Employé</span></a>
                    </ul>
                </li>
            </ul>
        </nav>
    </aside>

    <main role="main" class="main-content">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="row align-items-center my-4">
                        <div class="col">
                            <h1 class="h3 mb-0 page-title">Bienvenue sur notre site!</h1>
                        </div>
                    </div>
                    <button type="button" class="btn mb-2 btn-primary" data-toggle="modal" data-target=".modal-full">COMMENCER</button>
                    <!-- Fullscreen modal -->
                    <div class="modal fade modal-full" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                        <button aria-label="" type="button" class="close px-2" data-dismiss="modal" aria-hidden="true">
                            <span aria-hidden="true">×</span>
                        </button>
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-body text-center">
                                    <p>Bienvenue sur notre page!
                                        <br>
                                        C'est un site conçu pour voir les employés d'une société.
                                        <br>
                                        Ainsi qu'un Organigramme des membres.
                                        <br>
                                        On peut également effectuer des discussions entre les membres.
                                        <br>
                                        <br>
                                        Alors qu'attendez-vous? commencez par ajouter les details de vos sociétés!
                                    </p>
                                    <a href="<%= request.getContextPath() %>/AddSociete"><button class="btn btn-primary btn-lg mb-2 my-2 my-sm-0" type="submit"><i class="fe fe-play fe-16"></i> Commencer</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

</div> <!-- .wrapper -->
<script src="public/js/jquery.min.js"></script>
<script src="public/js/popper.min.js"></script>
<script src="public/js/moment.min.js"></script>
<script src="public/js/bootstrap.min.js"></script>
<script src="public/js/simplebar.min.js"></script>
<script src='public/js/daterangepicker.js'></script>
<script src='public/js/jquery.stickOnScroll.js'></script>
<script src="public/js/tinycolor-min.js"></script>
<script src="public/js/config.js"></script>
<script src="public/js/apps.js"></script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
<script>
    window.dataLayer = window.dataLayer || [];

    function gtag()
    {
        dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'UA-56159088-1');
</script>
</body>
</html>
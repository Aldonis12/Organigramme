<%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 18/04/2023
  Time: 00:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
          <a class="nav-link" href="<%= request.getContextPath() %>/AddSociete">
            <i class="fe fe-plus-circle fe-16"></i>
            <span class="ml-3 item-text">Ajouter</span>
          </a>
        </li>
        <li class="nav-item w-100">
          <a class="nav-link" href="<%= request.getContextPath() %>/PageListSociete">
            <i class="fe fe-layers fe-16"></i>
            <span class="ml-3 item-text">Listes</span>
          </a>
        </li>
        <li class="nav-item w-100">
          <a class="nav-link" href="<%= request.getContextPath() %>/ListActualite">
            <i class="fe fe-home fe-16"></i>
            <span class="ml-3 item-text">Actualité</span>
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
            <span class="ml-3 item-text">Authentication</span>
          </a>
          <ul class="collapse list-unstyled pl-4 w-100" id="auth">
            <a class="nav-link pl-3" href="<%= request.getContextPath() %>/LoginPage"><span class="ml-1">Société</span></a>
            <a class="nav-link pl-3" href="<%= request.getContextPath() %>/LoginPageEmp"><span class="ml-1">Employé</span></a>
          </ul>
        </li>
      </ul>
    </nav>
  </aside>

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
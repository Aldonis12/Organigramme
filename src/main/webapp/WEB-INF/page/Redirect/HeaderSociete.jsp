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
        <span>Employé</span>
      </p>
      <ul class="navbar-nav flex-fill w-100 mb-2">
        <li class="nav-item w-100">
          <a class="nav-link" href="<%=request.getContextPath()%>/AddEmployes?id=<%= request.getAttribute("idSociete")%>">
            <i class="fe fe-plus-circle fe-16"></i>
            <span class="ml-3 item-text">Ajouter</span>
          </a>
        </li>
        <li class="nav-item w-100">
          <a class="nav-link" href="<%=request.getContextPath()%>/SocieteEmployes?id=<%= request.getAttribute("idSociete")%>">
            <i class="fe fe-layers fe-16"></i>
            <span class="ml-3 item-text">Listes</span>
          </a>
        </li>
      </ul>

      <p class="text-muted nav-heading mt-4 mb-1">
        <span>Pour vous</span>
      </p>
      <ul class="navbar-nav flex-fill w-100 mb-2">
        <li class="nav-item w-100">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#varyModal" data-whatever="@mdo">
            <i class="fe fe-share fe-16"></i>
            <span class="ml-3 item-text">Publication rapide</span>
          </a>
        </li>
        <li class="nav-item w-100">
          <a class="nav-link" href="<%= request.getAttribute("idSociete")%>">
            <i class="fe fe-message-circle fe-16"></i>
            <span class="ml-3 item-text">Discussion de groupe</span>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav flex-fill w-100 mb-2">
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <li class="nav-item w-100">
          <a class="nav-link" href="<%=request.getContextPath()%>/LoginPage">
            <i class="fe fe-log-out fe-16"></i>
            <span class="ml-3 item-text">Se deconnecter</span>
          </a>
        </li>
      </ul>
    </nav>
  </aside>
  <main>

    <div class="modal fade" id="varyModal" tabindex="-1" role="dialog" aria-labelledby="varyModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="varyModalLabel">Nouvelle annonce</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <input type="hidden" id="idSociete" value="<%= request.getAttribute("idSociete")%>">
              <div class="form-group">
                <label for="annonce" class="col-form-label">Texte :</label>
                <textarea class="form-control" id="annonce"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="reset" class="btn mb-2 btn-secondary" data-dismiss="modal">Fermer</button>
            <button type="button" class="btn mb-2 btn-primary" onclick="addAnnonce()">Publier</button>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
  function addAnnonce(){
    let formActuStatus = new FormData();
    formActuStatus.append('idSociete',document.getElementById("idSociete").value);
    formActuStatus.append('annonce',document.getElementById("annonce").value);
    fetch('<%=request.getContextPath()%>/NewAnnonce', {
      method: 'POST',
      body: formActuStatus
    }).then(() => alert('Annonce publiée.'));
  }
</script>

</body>
</html>
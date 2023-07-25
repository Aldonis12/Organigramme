<%@ page import="projet.organigramme.Model.Societe" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 19/04/2023
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Societe> list = (List<Societe>) request.getAttribute("listeSociete");
%>
<jsp:include page="../Redirect/Header.jsp"/>
<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="row align-items-center my-4">
                    <div class="col">
                        <h2 class="h3 mb-0 page-title">Liste des sociétés</h2>
                    </div>
                </div>
                <div class="row">
                    <%for(Societe p: list) {%>
                    <a>
                    <div class="col-md-3">
                        <div class="card shadow mb-4">
                            <div class="card-body text-center">
                                <div class="avatar avatar-lg mt-4">
                                    <a href="">
                                        <img src="./assets/avatars/face-4.jpg" alt="..." class="avatar-img rounded-circle">
                                    </a>
                                </div>
                                <div class="card-text my-2">
                                    <strong class="card-title my-0"><%=p.getNomSociete()%></strong>
                                    <p class="small text-muted mb-0"><%=p.getContact()%></p>
                                    <p class="small text-muted mb-0"><%=p.getAdresse()%></p>
                                    <p class="small"><span class="badge badge-light text-muted"><%=p.getLieu()%></span></p>
                                </div>
                            </div> <!-- ./card-text -->
                            <div class="card-footer">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto">
                                        <small>
                                            <span></span></small>
                                    </div>
                                    <div class="col-auto">
                                        <div class="file-action">
                                            <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="text-muted sr-only">Action</span>
                                            </button>
                                            <div class="dropdown-menu m-2">
                                                <a class="dropdown-item" href="<%=request.getContextPath()%>/PageOrganigramme?id=<%=p.getIdSociete()%>"><i class="fe fe-command fe-12 mr-4"></i>Organigramme</a>
                                                <a class="dropdown-item" href="mailto:<%=p.getMail()%>"><i class="fe fe-mail fe-12 mr-4"></i>Contact</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- /.card-footer -->
                        </div>
                    </div> <!-- .col -->
                    <%}%>
                </div> <!-- .col-12 -->
            </div> <!-- .row -->
        </div> <!-- .container-fluid -->
    </div>
    </main> <!-- main -->
</div> <!-- .wrapper -->
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/simplebar.min.js"></script>
<script src='js/daterangepicker.js'></script>
<script src='js/jquery.stickOnScroll.js'></script>
<script src="js/tinycolor-min.js"></script>
<script src="js/config.js"></script>
<script src="js/apps.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
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

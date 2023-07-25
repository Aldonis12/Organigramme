<%@ page import="projet.organigramme.Model.Actualite" %>
<%@ page import="java.util.List" %>
<%@ page import="projet.organigramme.Service.SocieteService" %>
<%@ page import="projet.organigramme.Model.Societe" %><%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 23/04/2023
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%
    List<Actualite> list = (List<Actualite>) request.getAttribute("ListActualite");
    Societe societeService = new Societe();
%>
<jsp:include page="../Redirect/Header.jsp"/>
<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card card-fill timeline">
                    <div class="card-header">
                        <strong class="card-title">Activité recent</strong>
                    </div>
                    <div class="card-body">
                    <%for (Actualite p : list){%>
                        <% if (p.getTypes()==2) {%>
                        <div class="pb-3 timeline-item item-success">
                            <div class="pl-5">
                                <div class="mb-1"><strong>@<%=p.getSociete().getNomSociete()%></strong><span class="text-muted small mx-2"><%=p.getAnnonce()%></span></div>
                                <p class="small text-muted"><span class="badge badge-light"><%=p.getTemps()%></span>
                                </p>
                            </div>
                        </div>
                        <%} else if(p.getTypes()==1) {%>
                        <div class="pb-3 timeline-item item-warning">
                            <div class="pl-5">
                                <div class="mb-3"><a href="mailto:<%=p.getSociete().getMail()%>?subject=Reponse à l'annonce&body=Bonjour l'assistant du société <%=p.getSociete().getNomSociete()%>, "><strong>@<%=p.getSociete().getNomSociete()%></strong></a><span class="text-muted small mx-2"> a publié</span></div>
                                <div class="card d-inline-flex mb-2">
                                    <div class="card-body bg-light py-2 px-3"> <%=p.getAnnonce()%> </div>
                                </div>
                                </p>
                                <p class="small text-muted"><span class="badge badge-light"><%=p.getTemps()%></span>
                                </p>
                            </div>
                        </div>
                        <%}%>
                        <%}%>
                    </div> <!-- / .card-body -->
                </div> <!-- / .card -->
            </div> <!-- .col-12 -->
        </div> <!-- .row -->
    </div> <!-- .container-fluid -->
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

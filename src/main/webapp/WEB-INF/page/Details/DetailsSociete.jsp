<%@ page import="java.util.List" %>
<%@ page import="projet.organigramme.Model.Societe" %><%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 15/04/2023
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Societe> list = (List<Societe>) request.getAttribute("societe");
%>
<jsp:include page="../Redirect/HeaderSociete.jsp"/>
<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="h3 mb-4 page-title">Profil société</h2>
                <%for(Societe p: list) {%>
                <div class="row mt-5 align-items-center">
                    <div class="col-md-3 text-center mb-5">
                        <div class="avatar avatar-xl">
                            <img src="./assets/avatars/face-1.jpg" alt="..." class="avatar-img rounded-circle">
                        </div>
                    </div>
                    <div class="col">
                        <div class="row align-items-center">
                            <div class="col-md-7">
                                <h4 class="mb-1"><%=p.getNomSociete()%></h4>
                                <p class="small mb-3"><span class="badge badge-dark"><%=p.getLieu()%></span></p>
                            </div>
                        </div>
                        <div class="row mb-4">

                            <div class="col">
                                <p class="small mb-0 text-muted">ADRESSE : <%=p.getAdresse()%> </p>
                                <p class="small mb-0 text-muted">MAIL :  <%=p.getMail()%></p>
                                <p class="small mb-0 text-muted">CONTACT : <%=p.getContact()%></p>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
                <div class="row my-4">
                    <div class="col-md-6">
                        <div class="card mb-4 shadow">
                            <div class="card-body my-n3">
                                <div class="row align-items-center">
                                    <div class="col-3 text-center">
                          <span class="circle circle-lg bg-light">
                            <i class="fe fe-user fe-24 text-primary"></i>
                          </span>
                                    </div> <!-- .col -->
                                    <div class="col">
                                        <a href="<%=request.getContextPath()%>/SocieteEmployes?id=<%= request.getAttribute("idSociete")%>">
                                            <h3 class="h5 mt-4 mb-1">Liste des employés</h3>
                                        </a>
                                        <p class="text-muted"></p>
                                    </div> <!-- .col -->
                                </div> <!-- .row -->
                            </div>
                        </div> <!-- .card -->
                    </div> <!-- .col-md-->
                    <div class="col-md-6">
                        <div class="card mb-4 shadow">
                            <div class="card-body my-n3">
                                <div class="row align-items-center">
                                    <div class="col-3 text-center">
                          <span class="circle circle-lg bg-light">
                            <i class="fe fe-user-plus fe-24 text-primary"></i>
                          </span>
                                    </div> <!-- .col -->
                                    <div class="col">
                                        <a href="<%=request.getContextPath()%>/AddEmployes?id=<%= request.getAttribute("idSociete")%>">
                                            <h3 class="h5 mt-4 mb-1">Ajouter un nouveau employé</h3>
                                        </a>
                                        <p class="text-muted"></p>
                                    </div> <!-- .col -->
                                </div> <!-- .row -->
                            </div>
                        </div> <!-- .card -->
                    </div> <!-- .col-md-->
                    <div class="col-md-6">
                        <div class="card mb-4 shadow">
                            <div class="card-body my-n3">
                                <div class="row align-items-center">
                                    <div class="col-3 text-center">
                          <span class="circle circle-lg bg-light">
                            <i class="fe fe-share fe-24 text-primary"></i>
                          </span>
                                    </div> <!-- .col -->
                                    <div class="col">
                                        <a href="#" data-toggle="modal" data-target="#varyModal" data-whatever="@mdo">
                                            <h3 class="h5 mt-4 mb-1">Publier une annonce</h3>
                                        </a>
                                        <p class="text-muted"></p>
                                    </div> <!-- .col -->
                                </div> <!-- .row -->
                            </div>
                        </div> <!-- .card -->

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

                    </div> <!-- .col-md-->
                    <div class="col-md-6">
                        <div class="card mb-4 shadow">
                            <div class="card-body my-n3">
                                <div class="row align-items-center">
                                    <div class="col-3 text-center">
                          <span class="circle circle-lg bg-light">
                            <i class="fe fe-message-circle fe-24 text-primary"></i>
                          </span>
                                    </div> <!-- .col -->
                                    <div class="col">
                                        <a href="<%=request.getContextPath()%>/AddEmployes?id=<%= request.getAttribute("idSociete")%>">
                                            <h3 class="h5 mt-4 mb-1">Discussion de groupe</h3>
                                        </a>
                                        <p class="text-muted"></p>
                                    </div> <!-- .col -->
                                </div> <!-- .row -->
                            </div>
                        </div> <!-- .card -->
                    </div> <!-- .col-md-->
                </div> <!-- .row-->
            </div> <!-- /.col-12 -->
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
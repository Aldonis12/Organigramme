<%@ page import="projet.organigramme.Model.Organigramme" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 20/04/2023
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../Redirect/Header.jsp"/>

<%
    List<Organigramme> liste1 = null;
    List<Organigramme> liste2 = null;
    List<Organigramme> liste3 = null;
    List<Organigramme> liste4 = null;
    List<Organigramme> liste5 = null;
    List<Organigramme> liste6 = null;
    List<Organigramme> liste7 = null;
    List<Organigramme> liste8 = null;
    List<Organigramme> liste9 = null;
    List<Organigramme> liste10 = null;
    List<Organigramme> liste11 = null;
    List<Organigramme> liste12 = null;
    List<Organigramme> liste13 = null;
    List<Organigramme> liste14 = null;
    List<Organigramme> liste15 = null;
%>

<% if (request.getAttribute("categ1")!=null){%>
<%  liste1 = (List<Organigramme>) request.getAttribute("categ1"); %>
<% } %>
<% if (request.getAttribute("categ2")!=null){%>
<% liste2 = (List<Organigramme>) request.getAttribute("categ2"); %>
<% } %>
<% if (request.getAttribute("categ3")!=null){%>
<% liste3 = (List<Organigramme>) request.getAttribute("categ3"); %>
<% } %>
<% if (request.getAttribute("categ4")!=null){%>
<% liste4 = (List<Organigramme>) request.getAttribute("categ4"); %>
<% } %>
<% if (request.getAttribute("categ5")!=null){%>
<% liste5 = (List<Organigramme>) request.getAttribute("categ5"); %>
<% } %>
<% if (request.getAttribute("categ6")!=null){%>
<% liste6 = (List<Organigramme>) request.getAttribute("categ6"); %>
<% } %>
<% if (request.getAttribute("categ7")!=null){%>
<% liste7 = (List<Organigramme>) request.getAttribute("categ7"); %>
<% } %>
<% if (request.getAttribute("categ8")!=null){%>
<% liste8 = (List<Organigramme>) request.getAttribute("categ8"); %>
<% } %>
<% if (request.getAttribute("categ9")!=null){%>
<% liste9 = (List<Organigramme>) request.getAttribute("categ9"); %>
<% } %>
<% if (request.getAttribute("categ10")!=null){%>
<% liste10 = (List<Organigramme>) request.getAttribute("categ10"); %>
<% } %>
<% if (request.getAttribute("categ11")!=null){%>
<% liste11 = (List<Organigramme>) request.getAttribute("categ11"); %>
<% } %>
<% if (request.getAttribute("categ12")!=null){%>
<% liste12 = (List<Organigramme>) request.getAttribute("categ12"); %>
<% } %>
<% if (request.getAttribute("categ13")!=null){%>
<% liste13 = (List<Organigramme>) request.getAttribute("categ13"); %>
<% } %>
<% if (request.getAttribute("categ14")!=null){%>
<% liste14 = (List<Organigramme>) request.getAttribute("categ14"); %>
<% } %>
<% if (request.getAttribute("categ15")!=null){%>
<% liste15 = (List<Organigramme>) request.getAttribute("categ15"); %>
<% } %>

<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="row align-items-center my-4">
                    <div class="col">
                        <h2 class="h3 mb-0 page-title">ORGANIGRAMME</h2>
                    </div>
                </div>

                <% if (liste1.size()!=0){%>
                    <h6>Directeur General</h6>
                    <div class="row">
                        <% for(Organigramme p: liste1) {%>
                        <div class="col-md-3">
                            <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                            </a>
                        </div>
                        <% } %>
                    </div>
                <% } %>

                <% if (liste2.size()!=0){%>
                    <h6>Directeur finances</h6>
                <div class="row">
                    <% for(Organigramme p: liste2) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste9.size()!=0){%>
                    <h6>Employes finances</h6>
                <div class="row">
                    <% for(Organigramme p: liste9) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste3.size()!=0){%>
                    <h6>Directeur RH</h6>
                <div class="row">
                    <% for(Organigramme p: liste3) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste10.size()!=0){%>
                    <h6>Employes RH</h6>
                <div class="row">
                    <% for(Organigramme p: liste10) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste4.size()!=0){%>
                    <h6>Directeur du marketing et des operations</h6>
                <div class="row">
                    <% for(Organigramme p: liste4) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste11.size()!=0){%>
                    <h6>Employes du marketing et des operations</h6>
                <div class="row">
                    <% for(Organigramme p: liste11) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste5.size()!=0){%>
                    <h6>Directeur de division</h6>
                <div class="row">
                    <% for(Organigramme p: liste5) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste12.size()!=0){%>
                    <h6>Employes de division</h6>
                <div class="row">
                    <% for(Organigramme p: liste12) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste6.size()!=0){%>
                    <h6>Directeur des chefs de projet</h6>
                <div class="row">
                    <% for(Organigramme p: liste6) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste13.size()!=0){%>
                    <h6>Employes des projets</h6>
                <div class="row">
                    <% for(Organigramme p: liste13) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste7.size()!=0){%>
                    <h6>Directeur des responsables de service</h6>
                <div class="row">
                    <% for(Organigramme p: liste7) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste14.size()!=0){%>
                    <h6>Employes des responsables de service</h6>
                <div class="row">
                    <% for(Organigramme p: liste14) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste8.size()!=0){%>
                    <h6>Directeur des superviseurs</h6>
                <div class="row">
                    <% for(Organigramme p: liste8) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <% if (liste15.size()!=0){%>
                    <h6>Employes superviseurs</h6>
                <div class="row">
                    <% for(Organigramme p: liste15) {%>
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/?<%=p.getEmploye().getIdEmp()%>">
                            <div class="card shadow mb-4">
                                <div class="card-body text-center">
                                    <div class="card-text my-2">
                                        <strong class="card-title my-0"><%=p.getEmploye().getNomEmp()%> <%=p.getEmploye().getPrenom()%></strong>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <% } %>
                </div>
                <% } %>

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
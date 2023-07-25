<%@ page import="projet.organigramme.Model.Genre" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 16/04/2023
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Genre> genre = (List<Genre>) request.getAttribute("genre");%>

<jsp:include page="../Redirect/HeaderSociete.jsp"/>
<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="page-title">Ajout Employé</h2>
                <p class="text-muted"></p>

                <!-- / .card-desk-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <form action="<%=request.getContextPath()%>/AjoutEmploye" method="post">
                                    <input type="hidden" name="id" value="<%= request.getAttribute("idSociete")%>">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputCity5">Nom</label>
                                            <input type="text" name="nomEmp" class="form-control" id="inputCity5">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputCity4">Prenom</label>
                                            <input type="text" name="prenom" class="form-control" id="inputCity4">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="dateField">Date de naissance</label>
                                            <input type="date" name="dtn" id="dateField" class="form-control">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <div class="form-group mb-3">
                                                <label for="custom-select">Genre</label>
                                                <select class="custom-select" name="idgenre" id="custom-select">
                                                    <option selected>Choisir</option>
                                                    <%for(Genre p: genre) {%>
                                                    <option value="<%=p.getIdGenre()%>"><%=p.getNomGenre()%></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Contact</label>
                                            <input type="text" name="contact" class="form-control">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Adresse</label>
                                            <input type="text" name="adresse" class="form-control">
                                        </div>
                                    </div>
                                        <button type="submit" class="btn btn-primary">Ajouter</button>

                                </form>
                            </div> <!-- /. card-body -->
                        </div> <!-- /. card -->
                    </div> <!-- /. col -->
                </div>
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

    var date = new Date();
    date.setFullYear(date.getFullYear() - 19);
    var maxDate = date.toISOString().slice(0,10);

    document.getElementById("dateField").setAttribute("max", maxDate);

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
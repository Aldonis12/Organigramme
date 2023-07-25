<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 13/04/2023
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<String> Province = (ArrayList<String>) request.getAttribute("ListProvince");
%>
<script>
    <% if (request.getAttribute("erreur")!=null){%>
    alert("<%=request.getAttribute("erreur") %>")
    <% } %>
</script>
<jsp:include page="../Redirect/Header.jsp"/>
<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="page-title">Ajout Société</h2>
                <p class="text-muted"></p>

                <!-- / .card-desk-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <form action="<%=request.getContextPath()%>/NouveauSociete" method="post">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Nom</label>
                                            <input type="text" name="nom" class="form-control" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Contact</label>
                                            <input type="text" name="contact" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="simple-select2">Lieu</label>
                                            <select class="form-control select2" name="lieu" id="simple-select2" required>
                                                <option value="AK">Choisir le province</option>
                                                <optgroup label="Province de Madagascar">
                                                    <%for (int i = 0; i<Province.size();i++){%>
                                                    <option value="<%=Province.get(i)%>"><%=Province.get(i)%></option>
                                                    <%}%>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Adresse</label>
                                            <input type="text" name="adresse" class="form-control" required>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modal-full">Ajouter</button>
                                    <!-- Fullscreen modal -->
                                    <div class="modal fade modal-full" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                        <button aria-label="" type="button" class="close px-2" data-dismiss="modal" aria-hidden="true">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body text-center">
                                                    <p>Veuillez ajouter un Email avec un Mot de passe pour continuer
                                                    </p>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label for="inputEmail5">Email</label>
                                                            <input type="email" class="form-control" name="mail" id="inputEmail5" required>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label for="inputPassword5">Mot de passe</label>
                                                            <input type="password" class="form-control" name="mdp" id="inputPassword5" required>
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Ajouter</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



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
    $('.input-phoneus').mask('(+261) 00-000-00');

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
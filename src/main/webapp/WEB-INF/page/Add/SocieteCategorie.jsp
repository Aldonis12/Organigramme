<%@ page import="java.util.List" %>
<%@ page import="projet.organigramme.Model.Genre" %>
<%@ page import="projet.organigramme.Model.Categorie" %><%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 15/04/2023
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Categorie> categorie = (List<Categorie>) request.getAttribute("categorie");
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
                <div class="row align-items-center my-4">
                    <div class="col">
                        <h2 class="h3 mb-0 page-title">Categorie par Société</h2>
                    </div>
                </div>
                <!-- table -->
                <div class="card shadow">
                    <div class="card-body">
                        <form action="<%=request.getContextPath()%>/AddPosteSociete" method="post">
                            <input type="hidden" name="idSociete" value="<%= request.getAttribute("idSociete")%>">
                            <a onclick="toggleFirst()"><button type="button" class="btn mb-2 btn-outline-secondary"><span class="fe fe-arrow-down fe-16 mr-2"></span>Directeurs</button></a>
                            <div id="myFirst" style="display:none;">
                        <table class="table table-borderless table-hover">
                            <thead>
                            <tr>
                                <th>CHECK</th>
                                <th>CATEGORIE</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%for(int i= 0; i<8;i++) {%>
                            <tr>
                                <td>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" name="idCateg" value="<%=categorie.get(i).getIdCateg()%>" class="custom-control-input" id="customCheck<%=categorie.get(i).getIdCateg()%>">
                                        <label class="custom-control-label" for="customCheck<%=categorie.get(i).getIdCateg()%>"></label>
                                    </div>
                                </td>
                                <td>
                                    <p class="mb-0 text-muted"><%=categorie.get(i).getNomCateg()%></p>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                            </div>
                            <a onclick="toggleBalise()"><button type="button" class="btn mb-2 btn-outline-secondary"><span class="fe fe-arrow-down fe-16 mr-2"></span>Employes</button></a>
                            <div id="maBalise" style="display:none;">
                                <table class="table table-borderless table-hover">
                                    <tbody>
                                    <%for(int i= 8; i<15;i++) {%>
                                    <tr>
                                        <td>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="idCateg" value="<%=categorie.get(i).getIdCateg()%>" class="custom-control-input" id="customCheck<%=categorie.get(i).getIdCateg()%>">
                                                <label class="custom-control-label" for="customCheck<%=categorie.get(i).getIdCateg()%>"></label>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-0 text-muted"><%=categorie.get(i).getNomCateg()%></p>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                            <br><br>
                        <button type="submit" class="btn btn-primary">Ajouter</button>
                        </form>

                        <script>
                            function toggleBalise() {
                                var balise = document.getElementById("maBalise");
                                if (balise.style.display === "none") {
                                    balise.style.display = "block";
                                } else {
                                    balise.style.display = "none";
                                }
                            }
                            function toggleFirst() {
                                var balise = document.getElementById("myFirst");
                                if (balise.style.display === "none") {
                                    balise.style.display = "block";
                                } else {
                                    balise.style.display = "none";
                                }
                            }
                        </script>
                    </div>
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
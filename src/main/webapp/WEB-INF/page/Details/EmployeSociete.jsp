<%@ page import="java.util.List" %>
<%@ page import="projet.organigramme.Model.Employe" %>
<%@ page import="projet.organigramme.Model.CategEmploye" %><%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 15/04/2023
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<CategEmploye> employes = (List<CategEmploye>) request.getAttribute("employe");
%>

<jsp:include page="../Redirect/HeaderSociete.jsp"/>
<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="mb-2 page-title">Liste  des employés</h2>
                <div class="row my-4">
                    <!-- Small table -->
                    <div class="col-md-12">
                        <div class="card shadow">
                            <div class="card-body">
                                <!-- table -->
                                <table class="table datatables" id="dataTable-1">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>Nom</th>
                                        <th>Prenom</th>
                                        <th>Date de naissance</th>
                                        <th>Genre</th>
                                        <th>Contact</th>
                                        <th>Adresse</th>
                                        <th>Categorie</th>
                                        <th>Identifiant</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%  int i = 1;
                                        for(CategEmploye p: employes) {%>
                                    <tr>
                                        <td><%=i++%></td>
                                        <td><%=p.getNomEmp()%></td>
                                        <td><%=p.getPrenom()%></td>
                                        <td><%=p.getDtn()%></td>
                                        <td><%=p.getGenre().getIdGenre()%></td>
                                        <td><%=p.getContact()%></td>
                                        <td><%=p.getAdresse()%></td>
                                        <td><%=p.getIdCategorie().getIdCateg()%></td>
                                        <td><%=p.getIdentifiant()%></td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div> <!-- simple table -->
                </div> <!-- end section -->
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
<script src='js/jquery.dataTables.min.js'></script>
<script src='js/dataTables.bootstrap4.min.js'></script>
<script>
    $('#dataTable-1').DataTable(
        {
            autoWidth: true,
            "lengthMenu": [
                [16, 32, 64, -1],
                [16, 32, 64, "All"]
            ]
        });
</script>
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
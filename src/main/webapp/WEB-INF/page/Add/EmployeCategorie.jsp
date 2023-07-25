<%@ page import="projet.organigramme.Model.Categorie" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 16/04/2023
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Categorie> categorie = (List<Categorie>) request.getAttribute("categorie");%>
<script>
    <% if (request.getAttribute("erreur")!=null){%>
    alert("<%=request.getAttribute("erreur") %>")
    <% } %>
</script>
<jsp:include page="../Redirect/HeaderSociete.jsp"/>
<main role="main" class="main-content">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="row align-items-center my-4">
                    <div class="col">
                        <h2 class="h3 mb-0 page-title">Choisir son poste</h2>
                    </div>
                </div>
                <!-- table -->
                <div class="card shadow">
                    <div class="card-body">
                        <form action="<%=request.getContextPath()%>/AjoutCategEmp" method="post">
                            <input type="hidden" name="idsociete" value="<%= request.getAttribute("idSociete")%>">
                            <input type="hidden" name="idemploye" value="<%= request.getAttribute("idemp")%>">
                            <table class="table table-borderless table-hover">
                                <thead>
                                <tr>
                                    <th>CHECK</th>
                                    <th>CATEGORIE</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for(Categorie p: categorie) {%>
                                <tr>
                                    <td>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" name="categorie" value="<%=p.getIdCateg()%>" class="custom-control-input" id="customCheck<%=p.getIdCateg()%>">
                                            <label class="custom-control-label" for="customCheck<%=p.getIdCateg()%>"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="mb-0 text-muted"><%=p.getNomCateg()%></p>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                            <button type="submit" class="btn btn-primary">Ajouter</button>
                        </form>
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





<html>
<head>
    <title>Title</title>
</head>
<body>

  <h1>Ajout Employer categorie</h1>
  <form action="<%=request.getContextPath()%>/AjoutCategEmp" method="post">
      <input type="hidden" name="idsociete" value="<%= request.getAttribute("id")%>">
      <input type="hidden" name="idemploye" value="<%= request.getAttribute("idemp")%>">
      <p>Categorie : <select name="categorie">
          <%for(Categorie p: categorie) {%>
          <option value="<%=p.getIdCateg()%>"><%=p.getNomCateg()%></option>
          <%}%>
      </select></p>
      <input type="submit">
  </form>
</body>
</html>

<%@ page import="projet.organigramme.Model.Discussion" %>
<%@ page import="java.util.List" %><%
    List<Discussion> discussions = (List<Discussion>) request.getAttribute("discussion");
%>

<%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 18/04/2023
  Time: 00:20
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="../Redirect/HeaderEmploye.jsp"/>
<main role="main" class="main-content" onload="actualiserPage()">
    <div class="col">
        <h2 class="h5 page-title">Discussion de groupe</h2>
    </div>
    <br><br>
    <div class="container" id="myDiv">
        <header>
            <h1>Page de discussion</h1>
        </header>
        <% for(Discussion p: discussions) {%>
        <div class="row">
            <div class="column user">
                <h2><%=p.getEmploye().getNomEmp()%></h2>
            </div>
            <div class="column message">
                <p><%=p.getMessage()%></p>
                <p class="date"><%=p.getTemps()%></p>
            </div>
        </div>
        <%}%>
        <footer>
            <form action="<%=request.getContextPath()%>/AddDiscussion" method="post">
                <label for="message">Ajouter un message :</label>
                <input type="hidden" name="idSociete" value="<%= request.getAttribute("idSociete")%>">
                <input type="hidden" name="idEmploye" value="<%= request.getAttribute("idEmp")%>">
                <textarea id="message" name="message"></textarea>
                <button type="submit">Envoyer</button>
            </form>
        </footer>
    </div>
</main>
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
<script>
    window.onload = function() {
        var myDiv = document.getElementById("myDiv");
        myDiv.scrollTop = myDiv.scrollHeight;
    };
</script>

</body>
</html>

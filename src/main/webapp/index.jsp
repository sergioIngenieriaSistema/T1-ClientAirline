<%-- 
    Document   : index
    Created on : 21-abr-2018, 19:23:05
    Author     : sldia
--%>
<%@ include file = "includes/header.jsp" %>

<c:if test="${companies != null}">
    <div class="container mt-4">
        <table class="table table-striped table-hover">
            <caption>Compañias</caption>
            <thead class="w3-card text-white">
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>EMAIL</th>
                    <th>TELÉFONO</th>
                    <th>CÓDIGO</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="company" items="${companies}">
                    <tr>
                        <td>${company.id}</td>
                        <td>${company.name}</td>
                        <td>${company.email}</td>
                        <td>${company.phone}</td>
                        <td>${company.code}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>
<c:if test="${companies == null}">
    <img src="images/travel.jpg">
</c:if>

<%@ include file = "includes/footer.jsp" %>
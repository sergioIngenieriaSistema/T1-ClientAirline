<%-- 
    Document   : rooms
    Created on : 22-abr-2018, 17:52:33
    Author     : sldia
--%>
<%@ include file = "includes/header.jsp" %>

<c:if test="${rooms.size() != 0 && rooms != null}">
    <div class="container mt-4">
        <table class="table table-striped table-hover">
            <caption>Habitaciones</caption>
            <thead class="w3-card text-white">
                <tr>
                    <th>ID</th>
                    <th>Nº DE HABITACIÓN</th>
                    <th>TIPO DE HABITACIÓN</th>
                    <th>PRECIO</th>
                    <th>DISPONIBILIDAD</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="room" items="${rooms}">
                    <tr>
                        <td>${room.id}</td>
                        <td>${room.number}</td>
                        <td>${room.type}</td>
                        <td>${room.price}</td>
                        <td>${room.state == 0? "No disponible": "Disponible"}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

<%@ include file = "includes/footer.jsp" %>
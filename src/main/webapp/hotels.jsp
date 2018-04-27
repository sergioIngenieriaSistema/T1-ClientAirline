<%-- 
    Document   : hotels
    Created on : 22-abr-2018, 17:22:37
    Author     : sldia
--%>
<%@page import="model.hotel.Hotel"%>
<%@page import="java.util.List"%>
<%@ include file = "includes/header.jsp" %>

<div class="container my-5 p-2">
    <form class="row justify-content-center" action="SearchHotel" method="post">
        <div class="mx-4">
            <label for="entryDate">Fecha de entrada:</label>
            <input id="entryDate" type="date" name="entryDate" required>
        </div>
        <div class="mx-4">
            <label for="departureDate">Fecha de salida: </label>
            <input id="departureDate" type="date" name="departureDate" required>
        </div>
        <div class="mx-4">
            <input class="btn btn-success" type="submit" value="Buscar hoteles">
        </div>
    </form>
</div>


<c:if test="${hotels.size() != 0 && hotels != null}">
    <div class="container">
        <table class="table table-striped table-hover table-sm">
            <caption>Hoteles</caption>
            <thead class="w3-card text-white">
                <tr>
                    <th>ID</th>
                    <th>NOMBRE</th>
                    <th>DIRECCIÓN</th>
                    <th>TELÉFONO</th>
                    <th>Nº DE HABITACIONES</th>
                    <th>CATEGORÍA</th>
                    <th>Detalles</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="hotel" items="${hotels}">
                    <tr>
                        <td>${hotel.id}</td>
                        <td>${hotel.name}</td>
                        <td>${hotel.address}</td>
                        <td>${hotel.phone}</td>
                        <td>${hotel.numRooms}</td>
                        <td>${hotel.category}</td>
                        <td><a class="btn btn-primary" href="SearchRooms?hotelid=${hotel.id}&entryDate=${entryDate}&departureDate=${departureDate}">Ver habitaciones</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

<%@ include file = "includes/footer.jsp" %>
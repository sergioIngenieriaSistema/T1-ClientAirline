<%-- 
    Document   : flights
    Created on : 22-abr-2018, 1:09:25
    Author     : sldia
--%>

<%@page import="model.airline.Flight"%>
<%@page import="java.util.List"%>
<%@ include file = "includes/header.jsp" %>

<div class="container">
    <form class="mt-4" action="SearchFlight" method="post">
        <div class="row">
            <div class="col-3">
                <label class="d-block" for="originAirport">Aeropuerto de origen:</label>
                <input class="d-block" id="originAirport" list="departureAirport" name="origin">
                <datalist id="departureAirport">
                    <option value="Gran Canaria">
                    <option value="Tenerife">
                </datalist>
            </div>
            <div class="col-3">
                <label class="d-block" for="departureDate">Fecha de ida:</label>
                <input class="d-block" id="departureDate" type="date" name="departure">
            </div>
        </div>
        
        <div class="row">
            <div class="col-3">
                <label class="d-block" for="destinatioAirport">Aeropuerto de destino:</label>
                <input class="d-block" id="destinatioAirport" list="returnAirport" name="destination">
                <datalist id="returnAirport">
                    <option value="Gran Canaria">
                    <option value="Tenerife">
                </datalist>
            </div>
            <div class="col-3">
                <label class="d-block" for="returnDate">Fecha de vuelta:</label>
                <input class="d-block" id="returnDate" type="date" name="return">
            </div>
        </div>
        <div class="my-4">
            <input class="btn btn-success" type="submit" value="Buscar vuelo">
        </div>
    </form>
</div>

<c:if test="${departureFlights.size() != 0 && departureFlights != null}">
    <div class="container">
        <table class="table table-striped table-hover">
            <caption>Vuelos de ida</caption>
            <thead class="w3-card text-white bg-secondary">
                <tr>
                    <th>ID</th>
                    <th>COMPAÑIA</th>
                    <th>ORIGEN</th>
                    <th>DESTINO</th>
                    <th>PLAZAS</th>
                    <th>NUMERO DE VUELO</th>
                    <th>MODELO DEL AVIÓN</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="flight" items="${departureFlights}">
                    <tr>
                        <td>${flight.id}</td>
                        <td>${flight.company.name}</td>
                        <td>${flight.route.origin.airportName}</td>
                        <td>${flight.route.destination.airportName}</td>
                        <td>${flight.capacity}</td>
                        <td>${flight.flightNumber}</td>
                        <td>${flight.plainModel}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${returnFlights.size() != 0 }">
        <table class="table table-striped table-hover">
            <caption>Vuelos de vuelta</caption>
            <thead class="w3-card text-white">
                <tr>
                    <th>ID</th>
                    <th>COMPAÑIA</th>
                    <th>ORIGEN</th>
                    <th>DESTINO</th>
                    <th>PLAZAS</th>
                    <th>NUMERO DE VUELO</th>
                    <th>MODELO DEL AVIÓN</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="flight" items="${returnFlights}">
                    <tr>
                        <td>${flight.id}</td>
                        <td>${flight.company.name}</td>
                        <td>${flight.route.origin.airportName}</td>
                        <td>${flight.route.destination.airportName}</td>
                        <td>${flight.capacity}</td>
                        <td>${flight.flightNumber}</td>
                        <td>${flight.plainModel}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

<%@ include file = "includes/footer.jsp" %>

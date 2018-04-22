<%-- 
    Document   : index
    Created on : 21-abr-2018, 19:23:05
    Author     : sldia
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aerolíneas y Hoteles</title>
    </head>
    <body>
        <a href="ModelServlet">Ver Compañias Aéreas</a>

        <form action="SearchFlight" method="post">
            Aeropuerto de salida: 
            <input list="departureAirport" name="origin">
            <datalist id="departureAirport">
                <option value="Gran Canaria">
                <option value="Tenerife">
            </datalist>
            Aeropuerto de llegada: 
            <input list="returnAirport" name="destination">
            <datalist id="returnAirport">
                <option value="Gran Canaria">
                <option value="Tenerife">
            </datalist>
            Fecha de ida: <input type="date" name="departure">
            Fecha de vuelta: <input type="date" name="return">
            <input type="submit" value="Buscar vuelo">
        </form>
        
        <form action="SearchHotel" method="post">
            Fecha de entrada: <input type="date" name="entryDate">
            Fecha de salida: <input type="date" name="departureDate">
            <input type="submit" value="Buscar hoteles">
        </form>
        
        <c:if test="${companies != null}">
            <table>
                <caption>Compañias</caption>
                <thead>
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
        </c:if>

        <c:if test="${flights != null}">
            <table>
                <caption>Vuelos</caption>
                <thead>
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
                    <c:forEach var="flight" items="${flights}">
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
    </body>
</html>

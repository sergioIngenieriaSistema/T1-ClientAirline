<%-- 
    Document   : flights
    Created on : 22-abr-2018, 1:09:25
    Author     : sldia
--%>

<%@page import="model.airline.Flight"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aerolíneas</title>
    </head>
    <body>
        <c:if test="${departureFlights.size() != 0 }">
            <table>
                <caption>Vuelos de ida</caption>
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
            <table>
                <caption>Vuelos de vuelta</caption>
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
        </c:if>
    </body>
</html>

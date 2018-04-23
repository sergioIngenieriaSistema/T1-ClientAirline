<%-- 
    Document   : hotels
    Created on : 22-abr-2018, 17:22:37
    Author     : sldia
--%>
<%@page import="model.hotel.Hotel"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoteles</title>
    </head>
    <body>
        <c:if test="${hotels.size() != 0 }">
            <table>
                <caption>Hoteles</caption>
                <thead>
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
                            <td><a href="SearchRooms?hotelid=${hotel.id}&entryDate=${entryDate}&departureDate=${departureDate}">Ver habitaciones</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>

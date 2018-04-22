<%-- 
    Document   : rooms
    Created on : 22-abr-2018, 17:52:33
    Author     : sldia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Habitaciones</title>
    </head>
    <body>
        <c:if test="${rooms.size() != 0 }">
            <table>
                <caption>Habitaciones</caption>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nº DE HABITACIÓN</th>
                        <th>Tipo DE HABITACIÓN</th>
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
        </c:if>
    </body>
</html>

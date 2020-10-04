<%-- 
    Document   : index
    Created on : Oct 4, 2020, 7:38:24 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.fatecpg.poo.prova.Disciplina" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Abner Lima Tavares de Freitas</h1>
        <h2>RA: 1290481913002</h2>
        <%= Disciplina.getList().size() %> disciplinas matriculadas
    </body>
</html>

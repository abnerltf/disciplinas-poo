<%-- 
    Document   : disciplinas
    Created on : Oct 4, 2020, 7:43:18 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.fatecpg.poo.prova.Disciplina" %>
<%@page import="java.util.ArrayList" %>
<%
    ArrayList<Disciplina> matriculadas = (ArrayList)application.getAttribute("matriculadas");
    if (matriculadas == null) {
        matriculadas = Disciplina.getList();
        application.setAttribute("matriculadas", matriculadas);
    }
    
    String[] notasAsStrings = request.getParameterValues("notas");
    if (notasAsStrings != null){        
        for (int i = 0; i < matriculadas.size(); i++) {
            String notaAsString = notasAsStrings[i];
            if (notaAsString.length() == 0) continue;
            double nota = Double.valueOf(notaAsString);
            matriculadas.get(i).setNota(nota);
        }
        
        application.setAttribute("matriculadas", matriculadas);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
        <form>
            <table border="1">
                <tr>
                    <th>Nome</th>
                    <th>Nota</th>
                    <th>Ações</th>
                </tr>
            <% for (Disciplina disciplina : matriculadas) { %>
                <tr>
                    <td><%= disciplina.getNome() %></td>
                    <td><%= disciplina.getNota() %></td>
                    <td><input name="notas" type="number" min="0" max="10"></td>
                </tr>
            <% } %>
                <tr><td><input type="submit" value="Enviar"></td></tr>
            </ŧable>
        </form>
    </body>
</html>

<%-- 
    Document   : disciplinas
    Created on : Oct 4, 2020, 7:43:18 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Disciplina" %>
<%@page import="java.util.ArrayList" %>
<%
    ArrayList<Disciplina> matriculadas = Disciplina.getList();
    String action = request.getParameter("action");
    
    if (action != null) {
        String nome = request.getParameter("nome");
        String id = request.getParameter("id");
        Double nota = Double.valueOf(request.getParameter("nota"));
        
        if (action.equals("criar")) {
            Disciplina novaDisciplina = new Disciplina(nome, nota);
            novaDisciplina.create();
        } else if (action.equals("remover")) {
            Disciplina novaDisciplina = new Disciplina(id, nome, nota);
            novaDisciplina.remove();
        }
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Nota</th>
                <th>Ações</th>
            </tr>
        <% for (Disciplina disciplina : matriculadas) { %>
            <form>
                <input type="hidden" name="id" value="<%= disciplina.getId() %>">
                <input type="hidden" name="name" value="<%= disciplina.getNome() %>">
                <input type="hidden" name="nota" value="<%= disciplina.getNota() %>">
                <tr>
                    <td><%= disciplina.getNome() %></td>
                    <td><%= disciplina.getNota() %></td>
                    <td><input type="submit" name="action" value="remover"></td>
                </tr>
            </form>
        <% } %>
            <tr><td></td></tr>
        </ŧable>

        <h1>Criar nova disciplina</h1>
        <br/>
        <form method="POST">
            <input name="nome" type="text"  />
            <input name="nota" type="number"  />
            <input name="action" type="submit" value="criar" />
        </form>
    </body>
</html>

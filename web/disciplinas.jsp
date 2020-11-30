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
        Double nota = Double.valueOf(request.getParameter("nota"));
        
        if (action.equals("criar")) {
            Disciplina novaDisciplina = new Disciplina(nome, nota);
            novaDisciplina.create();
        } else if (action.equals("remover")) {
            
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
            
            <h1>Criar nova disciplina</h1>
            <br/>
            <form method="POST">
                <input name="nome" type="text"  />
                <input name="nota" type="number"  />
                <input name="action" type="submit" value="criar" />
            </form>
        </form>
    </body>
</html>

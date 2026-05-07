<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Cheque" %>

<!DOCTYPE html>
<html>
<head>
    <title>Accueil - Liste Cheques</title>
</head>
<body>
    <h1>Liste des cheques</h1>

    <%
        List<Cheque> cheques = (List<Cheque>) request.getAttribute("cheques");
    %>

    <table border="1">
        <thead>
            <tr>
                <th>Numero de cheque</th>
                <th>Numero de compte</th>
                <th>Date de validité</th>
            </tr>
        </thead>

        <tbody>
            <% for (Cheque chq : cheques) { %>
                <tr>
                    <td><%= chq.getNumCheque() %></td>
                    <td><%= chq.getNumCompte() %></td>
                    <td><%= chq.getDatevalide() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>
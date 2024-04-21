<%-- 
    Document   : populateArray
    Created on : Apr 17, 2024, 4:26:28 PM
    Author     : Fad Rahmat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Record</title>
    </head>
    <body>
        <h1>Read Java array and populate it into HTML's table</h1>
        
        <%
        int[][] sales = {
            {2500, 2100, 2200},
            {2000, 1900, 2400},
            {1800, 2200, 24500}
        };
        %>
        
    <center>
        
        <table border='1'>
            <thead>
                <tr>
                    <th>Salesman / Month</th>
                    <th>Jan</th>
                    <th>Feb</th>
                    <th>Mar</th>
                </tr>
            </thead>
            <tbody>
                <%
                for(int i = 0; i < sales.length; i++) {
                %>
                
                <tr>
                    <td>Salesman <%= (i + 1) %></td>
                    <% for(int j = 0; j < sales[i].length; j++) { %>
                    <td><%= sales[i][j] %></td>
                    <% } %>
                    
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
</html>

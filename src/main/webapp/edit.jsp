<%@ page import="domain.model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="domain.db.ProductDatabase" %>
<%@ page import="domain.model.Product" %>
<%
    String name = request.getParameter("oldName");
    Product product = ProductDatabase.findProduct(name);
%>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@900&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="css/style.css"/>
    <title>Toevoegen</title>
</head>
<body>
<div class="containerpage">
    <jsp:include page="header.jsp">
        <jsp:param name="actual" value="Toevoegen"/>
    </jsp:include>
    <main>
        <c:if test="${not empty errors}">
            <div class="alert alert-danger">
                <ul>
                    <c:forEach items="${errors}" var="error">
                        <li>${error}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        <h1>Bewerken</h1>
        <form method="POST" action="Servlet?command=editProduct&oldName=<%= request.getParameter("oldName") %>" novalidate>

            <p class="form-group ${nameClass}">
                <label for="name">Productnaam:</label>
                <input id="name" name="name" type="text" value="<%= product.getName() %>"/>
            </p>

            <p class="form-group ${typeClass}">
                <label for="type">Type:</label>
                <select id="type" name="type">
                    <option value="select">-- Selecteer --</option>
                    <option value="controller" <%= (product.getType().equals("controller")) ? "selected" : "" %>>
                        Controller
                    </option>
                    <option value="headset" <%= (product.getType().equals("headset")) ? "selected" : "" %>>
                        Hoofdtelefoon
                    </option>
                    <option value="laptop" <%= (product.getType().equals("laptop")) ? "selected" : "" %>>
                        Laptop
                    </option>
                    <option value="speakers" <%= (product.getType().equals("speakers")) ? "selected" : "" %>>
                        Luidsprekers
                    </option>
                    <option value="microphone" <%= (product.getType().equals("microphone")) ? "selected" : "" %>>
                        Microfoon
                    </option>
                    <option value="monitor" <%= (product.getType().equals("monitor")) ? "selected" : "" %>>
                        Monitor
                    </option>
                    <option value="mouse" <%= (product.getType().equals("mouse")) ? "selected" : "" %>>
                        Muis
                    </option>
                    <option value="mouse_pad" <%= (product.getType().equals("mouse_pad")) ? "selected" : "" %>>
                        Muismat
                    </option>
                    <option value="chair" <%= (product.getType().equals("chair")) ? "selected" : "" %>>
                        Stoel
                    </option>
                    <option value="keyboard" <%= (product.getType().equals("keyboard")) ? "selected" : "" %>>
                        Toetsenbord
                    </option>
                </select>
            </p>
            <p class="form-group ${priceClass}">
                <label for="price">Prijs:</label>
                <input id="price" name="price" type="number" placeholder="0,00" min="0" step="0.01"
                       value="<%= product.getPrice() %>">
            </p>

            <p class="form-group ${dateOfPurchaseClass}">
                <label for="dateOfPurchase">Aankoopdatum:</label>
                <input id="dateOfPurchase" name="dateOfPurchase" type="date" value="<%= product.getDateOfPurchase() %>">
            </p>

            <button type="submit">Bewerk</button>
        </form>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
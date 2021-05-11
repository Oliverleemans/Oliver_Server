<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <h1>Toevoegen</h1>
        <form method="POST" action="Servlet?command=add" novalidate>
            <p class="form-group ${nameClass}">
                <label for="name">Productnaam:</label>
                <input id="name" name="name" type="text" value="${namePreviousValue}">
            </p>
            <p class="form-group ${typeClass}">
                <label for="type">Type:</label>
                <select id="type" name="type">
                    <option value="select" selected>-- Selecteer --</option>
                    <option value="controller">Controller</option>
                    <option value="headset">Hoofdtelefoon</option>
                    <option value="laptop">Laptop</option>
                    <option value="speakers">Luidsprekers</option>
                    <option value="microphone">Microfoon</option>
                    <option value="monitor">Monitor</option>
                    <option value="mouse">Muis</option>
                    <option value="mouse_pad">Muismat</option>
                    <option value="chair">Stoel</option>
                    <option value="keyboard">Toetsenbord</option>
                </select>
            </p>
            <p class="form-group ${priceClass}">
                <label for="price">Prijs:</label>
                <input id="price" name="price" type="number" placeholder="0,00" min="0" step="0.01"
                       value="${pricePreviousValue}">
            </p>
            <p class="form-group ${dateOfPurchaseClass}">
                <label for="dateOfPurchase">Aankoopdatum:</label>
                <input id="dateOfPurchase" name="dateOfPurchase" type="date" value="${dateOfPurchasePreviousValue}">
            </p>
            <button type="submit">Voeg Toe</button>
        </form>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>

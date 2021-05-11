<%@ page import="domain.model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% Product product = (Product) request.getAttribute("product"); %>
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
    <title>Zoek</title>
</head>
<body>
<div class="containerpage">
    <jsp:include page="header.jsp">
        <jsp:param name="actual" value="Zoek"/>
    </jsp:include>
    <main>
        <h1>Zoeken</h1>
        <p>Het product <%= product.toString() %>, is teruggevonden in de database.</p>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
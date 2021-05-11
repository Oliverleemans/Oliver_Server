<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title>Overzicht</title>
</head>
<body>
<div class="containerpage">
    <jsp:include page="header.jsp">
        <jsp:param name="actual" value="Overzicht"/>
    </jsp:include>
    <main>
        <c:choose>
        <c:when test="${not empty products}">
        <h1>Overzicht</h1>
        <div class="overflow">
            <table>
                <thead>
                <tr>
                    <th>Type</th>
                    <th>Product</th>
                    <th>Aankoopdatum</th>
                    <th>Prijs</th>
                    <th>Bewerk</th>
                    <th>Verwijder</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="$not empty products"></c:if>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>${product.getTypeImage()}
                        </td>
                        <td>${product.getName()}
                        </td>
                        <td>${product.getFormattedDateOfPurchase()}
                        </td>
                        <td>&euro;${product.getPrice()}
                        </td>
                        <td><a href="Servlet?command=edit&oldName=${product.getName()}"><img src="images/icons/edit.svg" alt="Berweken"></a></td>
                        <td><a href="Servlet?command=confirm&name=${product.getName()}"><img
                                src="images/icons/remove.svg" alt="Verwijderen"></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            </c:when>
            <c:otherwise>
                <p>Er zijn geen producten om weer te geven.</p>
            </c:otherwise>
            </c:choose>
        </div>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>

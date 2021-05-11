<%@ page import="domain.model.Product" %>
<%@ page import="domain.db.ProductDatabase" %>
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
    <title>Home</title>
</head>
<body>
<div class="containerpage">
    <jsp:include page="header.jsp">
        <jsp:param name="actual" value="Home"/>
    </jsp:include>
    <main>
        <h1>Mijn Setup</h1>
        <p>
            Deze site is gemaakt om een lijstje te maken van je setup. Je kan producten toegoeven door op "Toevoegen" te
            klikken en je kan jouw persoonlijk lijstje zien door op "Overzicht" te klikken!
        </p>
        <p>Momenteel is het duurste product: <strong>${mostExpensive.getName()}</strong>
        </p>
        <p>U hebt deze pagina <strong>${visitCount}</strong> keer bezocht.</p>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>

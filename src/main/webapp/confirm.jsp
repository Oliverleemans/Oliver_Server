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
    <title>Bevestig</title>
</head>
<body>
<div class="containerpage">
    <jsp:include page="header.jsp">
        <jsp:param name="actual" value="Bevestig"/>
    </jsp:include>
    <main>
        <h1>Bevestig</h1>
        <p>
            Weet je zeker dat je <%= request.getParameter("name") %> wilt verwijderen?
        </p>
        <form class="conf" action="Servlet?command=delete&name=<%= request.getParameter("name") %>" method="POST">
            <button type="submit" value="yes">Bevestig</button>
            <button class="noButton" value="no"><a href="Servlet?command=overview">Annuleer</a></button>
        </form>
    </main>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
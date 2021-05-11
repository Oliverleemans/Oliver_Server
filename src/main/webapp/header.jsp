<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <nav>
        <ul>
            <li ${param.actual eq 'Home'?"id = actual":""}><a href="Servlet?command=home">Home</a></li>
            <li ${param.actual eq 'Toevoegen'?"id = actual":""}><a href="add.jsp">Toevoegen</a></li>
            <li ${param.actual eq 'Overzicht'?"id = actual":""}><a href="Servlet?command=overview">Overzicht</a></li>
            <li ${param.actual eq 'Zoek'?"id = actual":""}><a href="Servlet?command=search">Zoek</a></li>
        </ul>
    </nav>
</header>
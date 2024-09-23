<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
    <h2>Welcome to E-Commerce Application</h2>
    <c:if test="${not empty principal}">
        <p>Hello, ${principal.username}</p>
        <a href="<c:url value='/logout' />">Logout</a>
    </c:if>
</body>
</html>

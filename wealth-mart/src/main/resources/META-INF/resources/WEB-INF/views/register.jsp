<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
    <h2>Register</h2>
    <form action="<c:url value='/register' />" method="post">
        <div>
            <label>Username</label>
            <input type="text" name="username" required/>
        </div>
        <div>
            <label>Password</label>
            <input type="password" name="password" required/>
        </div>
        <div>
            <button type="submit">Register</button>
        </div>
    </form>
</body>
</html>

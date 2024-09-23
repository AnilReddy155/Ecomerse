<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="/login" method="post">
        <div>
            <label>Username</label>
            <input type="text" name="username" required/>
        </div>
        <div>
            <label>Password</label>
            <input type="password" name="password" required/>
        </div>
        <div>
            <button type="submit">Login</button>
        </div>
    </form>
</body>
</html>

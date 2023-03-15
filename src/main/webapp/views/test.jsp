<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/16/2023
  Time: 12:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/test/add" method="post">
        <label>
            <input type="text" name="name">
        </label>
        <label>
            <input type="text" name="age">
        </label>
        <label>
            <input type="text" name="address">
        </label>
        <label>
            <input type="time" name="time">
        </label>
        <input type="submit" value="submit">
    </form>
</body>
</html>

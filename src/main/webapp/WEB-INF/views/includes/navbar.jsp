<%--
  Created by IntelliJ IDEA.
  User: Max The Stranger
  Date: 3/12/2023
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>qPark - Parking Made Easy</title>

    <!-- bootstrap icons -->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
    />

    <!-- bootstrap css -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
            crossorigin="anonymous"
    />

    <!-- custom css -->
    <link rel="stylesheet" href="../../../css/main.css" />
</head>
<body>
<%-- nabar start --%>
    <header class="navbar-light">
        <nav class="navbar navbar-expand-xl">
            <div class="container">
                <!-- logo -->
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <img
                            class="navbar-brand-item"
                            src="../../../images/logo.svg"
                            alt="logo"
                    />
                </a>
            </div>
        </nav>
    </header>
<%-- navbar end --%>
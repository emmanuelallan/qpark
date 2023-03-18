<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta
            name="viewport"
            content="width=device-width,initial-scale=1,viewport-fit=cover"
    />
    <meta name="color-scheme" content="dark light" />
    <title>qPark | Parking made easy</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/utilities.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/custom.css" />
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
    />
</head>
<body>
<div class="flex-lg-1 h-screen overflow-y-lg-auto bg-surface-secondary">
    <div class="flex-lg-1 h-screen overflow-y-lg-auto">
        <!-- header start -->
        <nav
                class="navbar navbar-light position-lg-sticky top-lg-0 d-block overlap-10 flex-none bg-white border-bottom px-0 py-3"
                id="topbar"
        >
            <div class="container">
                <a class="navbar-brand d-inline-block px-lg-6 me-0" href="${pageContext.request.contextPath}"
                ><img src="${pageContext.request.contextPath}/images/logo.svg" alt="..."
                /></a>
            </div>
        </nav>
        <!-- header end -->

        <!-- client header start -->
        <header class="bg-surface-secondary">
            <div class="bg-cover hero"></div>
            <div class="container mt-8">
                <div class="row align-items-center">
                    <div class="col-sm col-12">
                        <h1 class="h2 ls-tight">Parking areas near you</h1>
                    </div>
                    <div class="col-sm-auto col-12 mt-4 mt-sm-0">
                        <div class="hstack gap-2 justify-content-sm-end">
                            <a
                                    href="#"
                                    class="btn btn-sm btn-neutral border-base"
                                    data-bs-toggle="modal"
                            ><span>View all</span>
                                <span class="ps-2"
                                ><i class="bi bi-arrow-right-short"></i>
                    </span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- client header end -->

        <main class="py-6 bg-surface-secondary">
            <div class="container">
                <!-- stats start -->
                <div class="row g-5">
                    <c:if test="${parkingAreasList != null}">
                        <c:forEach var="parkingArea" items="${parkingAreasList}">
                            <div class="col-lg-3 col-sm-6">
                                <div class="card shadow-4-hover">
                                    <div class="p-2">
                                        <a href="${pageContext.request.contextPath}/parking_slot?id=${parkingArea.id}" class="d-block"
                                        ><img
                                                class="img-fluid rounded-2"
                                                alt="${parkingArea.name}"
                                                src="${pageContext.request.contextPath}/uploads/${parkingArea.image}"
                                        /></a>
                                    </div>
                                    <div class="px-4 pt-2 pb-4">
                                        <h6 class="font-semibold mb-2">${parkingArea.name}</h6>
                                        <div class="d-flex align-items-center">
                                            <div class="text-xs text-muted">
                                                <i class="bi bi-geo-alt me-1"></i>${parkingArea.location}
                                            </div>
                                            <div class="text-sm text-muted ms-auto">
                                                Ksh. <span class="text-primary font-bold">${parkingArea.price}</span>/hr
                                            </div>
                                        </div>
                                        <span class="d-block"></span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <!-- stats end -->
            </div>
        </main>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>

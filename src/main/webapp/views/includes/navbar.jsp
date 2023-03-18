<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="currentURL" value="<c:url value='${pageContext.request.requestURL}'/>"/>
<!DOCTYPE html>
<html lang="en" data-theme="light">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover" />
        <meta name="color-scheme" content="dark light" />
        <title>qPark | Parking made easy</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/utilities.css" />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
    </head>
    <body>
        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
<%-- sidebar start --%>
        <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg scrollbar" id="sidebar">
            <div class="container-fluid">
                <button
                        class="navbar-toggler ms-n2"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#sidebarCollapse"
                        aria-controls="sidebarCollapse"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand d-inline-block py-lg-2 mb-lg-5 px-lg-6 me-0" href="${pageContext.request.contextPath}/admin">
                    <img src="${pageContext.request.contextPath}/images/logo.svg" alt="..." />
                </a>
                <div class="navbar-user d-lg-none">
                    <div class="dropdown">
                        <a href="#"
                           id="sidebarAvatar"
                           role="button"
                           data-bs-toggle="dropdown"
                           aria-haspopup="true"
                           aria-expanded="false"
                        >
                            <div class="avatar-parent-child">
                                <img alt="..."
                                     src="${pageContext.request.contextPath}/images/img-profile.png"
                                     class="avatar avatar- rounded-circle"
                                />
                                <span class="avatar-child avatar-badge bg-success"></span>
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="sidebarAvatar">
                            <a href="#" class="dropdown-item">Logout</a>
                        </div>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="sidebarCollapse">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link ${currentURL.contains('admin') ? 'active' : ''}" href="${pageContext.request.contextPath}/admin">
                                <i class="bi bi-kanban"></i>
                                Dashboard
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link ${currentURL.contains('drivers') ? 'active' : ''}" href="${pageContext.request.contextPath}/drivers">
                                <i class="bi bi-person-bounding-box"></i>
                                Drivers
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link ${currentURL.contains('booking') ? 'active' : ''}" href="${pageContext.request.contextPath}/booking">
                                <i class="bi bi-ticket-perforated"></i>
                                Bookings
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link ${currentURL.contains('parking_area') ? 'active' : ''}" href="${pageContext.request.contextPath}/parking_area">
                                <i class="bi bi-truck-front"></i>
                                Parking Areas
                            </a>
                        </li>
                    </ul>
                    <hr class="navbar-divider my-4 opacity-70" />
                    <ul class="navbar-nav">
                        <li>
                        <span
                                class="nav-link text-xs font-semibold text-uppercase text-muted ls-wide"
                        >Resources</span
                        >
                        </li>
                        <li class="nav-item">
                            <a class="nav-link py-2 ${currentURL.contains('settings') ? 'active' : ''}" href="${pageContext.request.contextPath}/setting">
                                <i class="bi bi-gear"></i>
                                Settings
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
<%-- sidebar end --%>
    <div class="flex-lg-1 h-screen overflow-y-lg-auto">
        <!-- header start -->
        <nav
                class="navbar navbar-light position-lg-sticky top-lg-0 d-none d-lg-block overlap-10 flex-none bg-white border-bottom px-0 py-3"
                id="topbar"
        >
            <div class="container">
                <div class="navbar-user d-none d-sm-flex ms-auto">
                    <div class="hstack gap-3 ms-4">
                        <div class="dropdown">
                            <a
                                    class="d-flex align-items-center"
                                    href="#"
                                    role="button"
                                    data-bs-toggle="dropdown"
                                    aria-haspopup="false"
                                    aria-expanded="false"
                            >
                                <div>
                                    <div
                                            class="avatar avatar-sm bg-warning rounded-circle text-white"
                                    >
                                        <img alt="..." src="${pageContext.request.contextPath}/images/img-profile.png" />
                                    </div>
                                </div>
                                <div class="d-none d-sm-block ms-3">
                                    <span class="h6">Admin</span>
                                </div>
                                <div class="d-none d-md-block ms-md-2">
                                    <i class="bi bi-chevron-down text-muted text-xs"></i>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <div class="dropdown-header">
                      <span class="d-block text-sm text-muted mb-1"
                      >Signed in as</span
                      >
                                    <span class="d-block text-heading font-semibold"
                                    >System Admin</span
                                    >
                                </div>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin">
                                    <i class="bi bi-person me-3"></i>
                                    Logout
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <!-- header end -->
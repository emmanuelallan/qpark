<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/views/includes/navbar.jsp" />

<%-- main start --%>
<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <c:if test="${not empty param.success}">
                <div class="alert alert-success" role="alert">
                    <div class="d-flex align-items-center">
                        <div class="flex-grow-1">
                            <p>
                                ${
                                    param.success == 'create' ? 'Driver Added Successfully' :
                                    param.success == 'update' ? 'Driver Updated Successfully' :
                                    param.success == 'delete' ? 'Driver Deleted Successfully' :
                                    ''
                                    }
                            </p>
                        </div>
                        <div class="flex-shrink-0 ms-3">
                            <i class="bi bi-check-circle-fill fs-2 text-success"></i>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>

<!-- admin header start -->
<header>
    <div class="container">
        <div class="border-bottom pt-6">
            <div class="row align-items-center">
                <div class="col-sm col-12">
                    <h1 class="h2 ls-tight">Drivers</h1>
                </div>
                <div class="col-sm-auto col-12 mt-4 mt-sm-0">
                    <div class="hstack gap-2 justify-content-sm-end">
                        <a
                                href="${pageContext.request.contextPath}/drivers/new"
                                class="btn btn-sm btn-primary"
                        >
                      <span class="pe-2">
                        <i class="bi bi-plus-square-dotted"></i>
                      </span>
                            <span>Add Driver</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- admin header end -->

<main class="py-6 bg-surface-secondary">
    <div class="container">
        <!-- latest bookings start -->
        <div class="card">
            <div class="card-header border-bottom">
                <h5 class="mb-0">All Drivers</h5>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-nowrap">
                    <thead class="table-light">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Driving Licence</th>
                        <th scope="col">Vehicles</th>
                        <th scope="col">Actions</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${driversList != null}">
                        <c:forEach items="${driversList}" var="driver">
                            <tr>
                                <td>
                                    <img
                                        alt="..."
                                        src="${pageContext.request.contextPath}/uploads/${driver.avatar}"
                                        class="avatar avatar-sm rounded-circle me-2"
                                    />
                                    <a class="text-heading font-semibold" href="#">${driver.name}</a>
                                </td>
                                <td>
                                    <a href="mailto:${driver.email}"> ${driver.email} </a>
                                </td>
                                <td>
                                    <a href="tel:${driver.phone}"> ${driver.phone} </a>
                                </td>
                                <td>${driver.drivingLicence}</td>
<%--                                <td>--%>
<%--                                    <c:forEach items="${driver.vehicles}" var="vehicle">--%>
<%--                                        <span class="text-xs">${vehicle.plate}</span>--%>
<%--                                    </c:forEach>--%>
<%--                                </td>--%>
                                <td>
                                    <a href="${pageContext.request.contextPath}/drivers/edit?id=${driver.id}"
                                       class="btn btn-sm btn-outline-dark me-1">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <form action="${pageContext.request.contextPath}/drivers/delete" method="post">
                                        <input type="hidden" name="id" value="${driver.id}">
                                        <button type="submit" class="btn btn-sm btn-outline-danger">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- latest bookings end -->
    </div>
</main>
<%-- main end --%>

<jsp:include page="/views/includes/footer.jsp" />

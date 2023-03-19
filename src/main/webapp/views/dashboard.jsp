<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/includes/navbar.jsp" />

<%-- main start --%>
<!-- admin header start -->
<header>
    <div class="container">
        <div class="border-bottom pt-6">
            <div class="row align-items-center">
                <div class="col-sm col-12">
                    <h1 class="h2 ls-tight text-capitalize">
                        <span class="d-inline-block me-3">👋</span>
                        Hi, ${admin.name}
                    </h1>
                </div>
                <div class="col-sm-auto col-12 mt-4 mt-sm-0">
                    <div class="hstack gap-2 justify-content-sm-end">
                        <a
                                href="${pageContext.request.contextPath}/parking_area/new"
                                class="btn btn-sm btn-primary"
                        >
                      <span class="pe-2">
                        <i class="bi bi-plus-square-dotted"></i>
                      </span>
                            <span>Add Parking</span>
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
        <!-- stats start -->
        <div class="row g-6 mb-6">
            <!-- total earnings -->
            <div class="col-xl-3 col-sm-6 col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                        <span
                                class="h6 font-semibold text-muted text-sm d-block mb-2"
                        >Earnings</span
                        >
                                <span class="h3 font-bold mb-0">KES. ${totalAmount}</span>
                            </div>
                            <div class="col-auto">
                                <div
                                        class="icon icon-shape bg-tertiary text-white text-lg rounded-circle"
                                >
                                    <i class="bi bi-credit-card"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2 mb-0 text-sm">
                      <span class="text-nowrap text-xs text-muted"
                      >Total booked earnings</span
                      >
                        </div>
                    </div>
                </div>
            </div>
            <!-- total drivers -->
            <div class="col-xl-3 col-sm-6 col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                        <span
                                class="h6 font-semibold text-muted text-sm d-block mb-2"
                        >All Drivers</span
                        >
                                <span class="h3 font-bold mb-0">${driversCount}</span>
                            </div>
                            <div class="col-auto">
                                <div
                                        class="icon icon-shape bg-primary text-white text-lg rounded-circle"
                                >
                                    <i class="bi bi-people"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2 mb-0 text-sm">
                      <span class="text-nowrap text-xs text-muted"
                      >Since the start</span
                      >
                        </div>
                    </div>
                </div>
            </div>
            <!-- total parking areas -->
            <div class="col-xl-3 col-sm-6 col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                        <span
                                class="h6 font-semibold text-muted text-sm d-block mb-2"
                        >Parking Areas</span
                        >
                                <span class="h3 font-bold mb-0">${parkingAreasCount}</span>
                            </div>
                            <div class="col-auto">
                                <div
                                        class="icon icon-shape bg-info text-white text-lg rounded-circle"
                                >
                                    <i class="bi bi-clock-history"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2 mb-0 text-sm">
                      <span class="text-nowrap text-xs text-muted"
                      >All available areas</span
                      >
                        </div>
                    </div>
                </div>
            </div>
            <!-- bookings count -->
            <div class="col-xl-3 col-sm-6 col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                        <span
                                class="h6 font-semibold text-muted text-sm d-block mb-2"
                        >Orders</span
                        >
                                <span class="h3 font-bold mb-0">${totalBookings}</span>
                            </div>
                            <div class="col-auto">
                                <div
                                        class="icon icon-shape bg-warning text-white text-lg rounded-circle"
                                >
                                    <i class="bi bi-minecart-loaded"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-2 mb-0 text-sm">
                      <span class="text-nowrap text-xs text-muted"
                      >Overall booking</span
                      >
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- stats end -->

        <!-- latest bookings start -->
        <div class="card">
            <div class="card-header border-bottom">
                <h5 class="mb-0">Latest Bookings</h5>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-nowrap">
                    <thead class="table-light">
                    <tr>
                        <th scope="col">Check In</th>
                        <th scope="col">Driver</th>
                        <th scope="col">Parking Area</th>
                        <th scope="col">Slot No.</th>
                        <th scope="col">Vehicle</th>
                        <th scope="col">Status</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Duration</th>
                        <th scope="col">Action</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${bookingList != null}">
                        <c:forEach var="booking" items="${bookingList}">
                            <tr>
                                <td><fmt:formatDate value="${booking.checkIn}" pattern="hh:mm a" /></td>
                                <td>${booking.driver}</td>
                                <td>${booking.parking}</td>
                                <td>${booking.slotNo}</td>
                                <td>${booking.plate}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${booking.status eq 'Active'}">
                        <span class="badge badge-lg badge-dot">
                          <i class="bg-success"></i>
                          ${booking.status}
                        </span>
                                        </c:when>
                                        <c:otherwise>
                        <span class="badge badge-lg badge-dot">
                          <i class="bg-danger"></i>
                          ${booking.status}
                        </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <span class="text-sm font-bold">Ksh. ${booking.amount}</span>
                                </td>
                                <td>${booking.duration}</td>
                                <td class="text-end">
                                    <c:choose>
                                        <c:when test="${booking.status eq 'Active'}">
                                            <button class="btn btn-sm btn-outline-success">
                                                <i class="bi bi-check2-all"></i>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn btn-sm btn-outline-success">
                                                <i class="bi bi-arrow-repeat"></i>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
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

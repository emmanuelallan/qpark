<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/views/includes/navbar.jsp" />

<%-- main start --%>
<!-- admin header start -->
<header>
  <div class="container">
    <div class="border-bottom pt-6">
      <div class="row align-items-center">
        <div class="col-sm col-12">
          <h1 class="h2 ls-tight">Bookings</h1>
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

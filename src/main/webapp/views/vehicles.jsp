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
                    param.success == 'create' ? 'Vehicles Added Successfully' :
                    param.success == 'update' ? 'Vehicles Updated Successfully' :
                    param.success == 'delete' ? 'Vehicles Deleted Successfully' :
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
          <a href="${pageContext.request.contextPath}/drivers" class="d-flex align-items-center text-decoration-none">
            <i class="bi bi-arrow-left-short h4 mb-0 text-primary"></i>
            <span class="h6 mb-0 ms-2 text-primary">Back to Driver</span>
          </a>
        </div>
        <div class="col-sm-auto col-12 mt-4 mt-sm-0">
          <div class="hstack gap-2 justify-content-sm-end">
            <a href="${pageContext.request.contextPath}/vehicles/new?driver=${driverId}"
               class="btn btn-primary">
              <span class="pe-2">
                <i class="bi bi-plus-square-dotted"></i>
              </span>
              <span>Add Vehicle</span>
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
        <h5 class="mb-0">Vehicles</h5>
      </div>
      <div class="table-responsive">
        <table class="table table-hover table-nowrap">
          <thead class="table-light">
          <tr>
            <th scope="col">Image</th>
            <th scope="col">Brand</th>
            <th scope="col">Color</th>
            <th scope="col">Plate</th>
            <th scope="col">Type</th>
            <th scope="col">Actions</th>
            <th></th>
          </tr>
          </thead>
          <tbody>
          <c:if test="${listVehicles != null}">
            <c:forEach items="${listVehicles}" var="vehicle">
              <tr>
                <td>
                  <img
                      alt=${vehicle.brand}
                      src="${pageContext.request.contextPath}/uploads/${vehicle.image}"
                      class="img-fluid w-1/3"
                  />
                </td>
                <td>
                  ${vehicle.brand}
                </td>
                <td>
                  ${vehicle.color}
                </td>
                <td>
                    <span class="badge bg-soft-dark text-white">
                      ${vehicle.plate}
                    </span>
                </td>
                <td>
                    ${vehicle.type}
                </td>
                <td>
                  <div class="d-flex gap-2">
                    <a href="${pageContext.request.contextPath}/vehicles/edit?id=${vehicle.id}&driver=${driverId}"
                       class="btn btn-sm btn-outline-dark me-1">
                      <i class="bi bi-pencil"></i>
                    </a>
                    <form action="${pageContext.request.contextPath}/vehicles/delete?driver=${driverId}"
                          method="post">
                      <input type="hidden" name="id" value="${vehicle.id}">
                      <button type="submit" class="btn btn-sm btn-outline-danger">
                        <i class="bi bi-trash"></i>
                      </button>
                    </form>
                  </div>
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

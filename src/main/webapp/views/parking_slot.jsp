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
  <link
          href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet"
  />
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
  />

  <style>
    .slot {
      height: 100px;
      border-top: 2px solid #000;
      border-left: 2px dashed #000;
      border-right: 2px dashed #000;
      padding: 0;
      position: relative;
    }

    .slot-inner {
      height: 100%;
      background-color: #fff;
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      text-align: center;
      cursor: pointer;
    }

    .slot.selected .slot-inner {
      background-color: #007bff;
      color: #fff;
    }

    .slot-label {
      opacity: 0;
    }

    input[type="radio"] {
      position: absolute;
      top: 0;
      left: 0;
      opacity: 0;
      z-index: -1;
    }

    input[type="radio"]:checked + .slot .slot-inner {
      background-color: #007bff;
      color: #fff;
    }
  </style>
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

    <c:if test="${parkingArea != null}">
      <c:set var="id" value="${parkingArea.id}" />
      <c:set var="name" value="${parkingArea.name}" />
      <c:set var="status" value="${parkingArea.status}" />
      <c:set var="location" value="${parkingArea.location}" />
      <c:set var="price" value="${parkingArea.price}" />
      <c:set var="fine" value="${parkingArea.fine}" />
      <c:set var="capacity" value="${parkingArea.capacity}" />
      <c:set var="openingTime" value="${parkingArea.openingTime}" />
      <c:set var="closingTime" value="${parkingArea.closingTime}" />
      <c:set var="image" value="${parkingArea.image}" />
    </c:if>

    <!-- client header start -->
    <header class="bg-surface-secondary">
      <div class="container mt-8">
        <div class="row align-items-center">
          <div class="col-sm col-12">
            <div class="hstack gap-2">
              <a
                      href="${pageContext.request.contextPath}"
                      class="btn btn-sm btn-neutral border-base"
              >
                    <span class="pe-2"
                    ><i class="bi bi-arrow-left-short"></i>
                    </span>
                <span>Back to Area</span>
              </a>
            </div>
          </div>
          <div class="col-sm-auto col-12 mt-4 mt-sm-0">
            <h1 class="h2 ls-tight">${name}</h1>
          </div>
        </div>
      </div>
    </header>
    <!-- client header end -->

    <main class="py-6 bg-surface-secondary">
      <div class="container">
          <!-- stats start -->
          <div class="row g-6">
            <div class="col-xl-8">
              <div class="card">
                <div class="card-body">
                  <h5 class="mb-3">Select a parking slot</h5>
                  <div class="row mb-3">
                    <div class="col">
                          <img src="${pageContext.request.contextPath}/uploads/${image}" alt="${name}" class="img-fluid rounded-3" />
                    </div>
                  </div>
                  <div class="row g-6">

<%--                    <c:if test="parkingSlots != null">--%>
                      <c:forEach items="${parkingSlots}" var="slot">
                        <div class="col-md-2 col-lg-2 col-4 mb-3 position-relative">
                          <label class="slot-label" id="${slot.name}">${slot.name}</label>
                          <input
                            type="radio"
                            name="${slot.name}"
                            id="${slot.name}"
                            value="${slot.id}"
                            class="slot-radio"
                          />
                          <div class="slot">
                            <div class="slot-inner">${slot.name}</div>
                          </div>
                        </div>
                      </c:forEach>
<%--                    </c:if>--%>

                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-4">
              <div class="vstack gap-6">
                <c:if test="${param.error != null}">
                  <div class="alert alert-danger" role="alert">
                    <i class="bi bi-exclamation-triangle"></i> Driver not found
                  </div>
                </c:if>
                <form class="card" action="${pageContext.request.contextPath}/parking_slot/search?parkingAreaId=${id}" method="post">
                  <div class="card-body">
                    <h5 class="mb-4">Search existing driver</h5>
                    <div
                            class="input-group input-group-sm input-group-inline mb-1"
                    >
                          <span class="input-group-text"
                          ><i class="bi bi-search"></i> </span
                          ><input
                            type="text"
                            class="form-control"
                            placeholder="Search driver"
                            name="drivingLicense"
                            required
                    />
                    </div>
                    <div class="text-end mt-3">
                      <button
                              type="submit"
                              class="btn btn-sm btn-primary w-100"
                      >
                        Search
                      </button>
                    </div>
                  </div>
                </form>

                <c:if test="${driver != null}">
                  <div class="card">
                    <div class="card-body">
                      <div class="container-fluid max-w-screen-xl">
                        <div class="row g-0">
                          <div class="col-auto">
                            <a href="#" class="avatar w-40 h-40 border border-body border-4 rounded-circle shadow mt-n16">
                              <img alt="${driver.name}" src="${pageContext.request.contextPath}/uploads/${driver.avatar}" class="rounded-circle">
                            </a>
                          </div>
                          <div class="col ps-4 pt-4">
                            <h6 class="text-xs text-lowercase text-muted mb-1">${driver.email}</h6>
                            <h1 class="h2">${driver.name}</h1>
                            <div class="d-flex gap-2 flex-wrap mt-3 d-none d-sm-block">
                              <a href="#" class="bg-white bg-opacity-50 bg-opacity-100-hover border rounded px-3 py-1 font-semibold text-heading text-xs">
                                UI/UX
                              </a>
                              <a href="#" class="bg-white bg-opacity-50 bg-opacity-100-hover border rounded px-3 py-1 font-semibold text-heading text-xs">
                                Mobile Apps
                              </a>
                              <a href="#" class="bg-white bg-opacity-50 bg-opacity-100-hover border rounded px-3 py-1 font-semibold text-heading text-xs">
                                UI Research
                              </a>
                            </div>
                            <div class="vstack gap-4">
                              <div class="d-flex align-items-center">
                                <i class="bi bi-telephone-forward me-2 text-muted"></i>
                                <a href="#" class="text-sm text-heading text-primary-hover">
                                  ${driver.phone}
                                </a>
                              </div>
                              <div class="d-flex align-items-center">
                                <i class="bi bi-ev-front me-2 text-muted"></i>
                                <a href="#" class="text-sm text-heading text-primary-hover">
                                    ${driver.drivingLicense}
                                </a>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:if>

                <div class="card">
                  <div class="card-body">
                    <div class="mb-7">
                      <h4 class="mb-1">Owner Details</h4>
                      <p class="text-xs text-muted">
                        The owner of the vehicle
                      </p>
                    </div>
                    <div class="row g-5">
                      <div class="col-md-12">
                        <div>
                          <label class="form-label">Name</label>
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                      <div class="col-6">
                        <div>
                          <label class="form-label">Email</label>
                          <input type="email" class="form-control" />
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div>
                          <label class="form-label">Phone</label>
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div>
                          <label class="form-label">Driving Licence</label>
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div>
                          <label class="form-label"
                          >One time password</label
                          >
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="card">
                  <div class="card-body">
                    <div class="mb-7">
                      <h4 class="mb-1">Vehicle Details</h4>
                    </div>
                    <div class="row g-5">
                      <div class="col-md-5">
                        <div>
                          <label class="form-label">Brand</label>
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                      <div class="col-6">
                        <div>
                          <label class="form-label">Color</label>
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div>
                          <label class="form-label">Plate No.</label>
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div>
                          <label class="form-label">Type</label>
                          <select class="form-select">
                            <option selected="">Vehicle type</option>
                            <option value="Open">Sedan</option>
                            <option value="Closed">Micro</option>
                            <option value="Full">CUV</option>
                            <option value="Full">SUV</option>
                            <option value="Full">Pick up</option>
                            <option value="Full">Coupe</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="card">
                  <div class="card-body pb-0">
                    <div class="mb-7">
                      <h4 class="mb-1">Driver Details</h4>
                      <div>
                        <div class="form-check">
                          <input
                                  class="form-check-input"
                                  type="checkbox"
                                  id="checkApi2"
                          />
                          <label class="form-check-label" for="checkApi2"
                          >Owner is the driver</label
                          >
                        </div>
                      </div>
                    </div>
                    <div class="row g-5">
                      <div class="col-md-12">
                        <div>
                          <label class="form-label">Name</label>
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                      <div class="col-6">
                        <div>
                          <label class="form-label">Email</label>
                          <input type="email" class="form-control" />
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div>
                          <label class="form-label">Phone</label>
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div>
                          <label class="form-label">Driving Licence</label>
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div>
                          <label class="form-label"
                          >One time password</label
                          >
                          <input type="text" class="form-control" />
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card-footer text-end">
                    <button type="submit" class="btn btn-sm btn-primary">
                      Reserve Spot
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </main>
  </div>
</div>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script>
  const slotRadios = document.querySelectorAll(".slot-radio");

  // Add event listeners to each slot
  document.querySelectorAll(".slot").forEach((slot, index) => {
    slot.addEventListener("click", () => {
      // Check the corresponding radio button
      slotRadios[index].checked = true;

      // Uncheck all other radio buttons
      slotRadios.forEach((radio, i) => {
        if (i !== index) {
          radio.checked = false;
        }
      });
    });
  });
</script>
</body>
</html>

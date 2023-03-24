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

    input[type="radio"]:disabled + .slot .slot-inner {
      background-color: #ccc;
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

    <div class="container mt-5">
      <div class="row">
        <div class="col-12">
          <c:if test="${param.success != null}">
            <div class="alert alert-success" role="alert">
              <i class="bi bi-check-circle"></i> Parking slot booked successfully!
            </div>
          </c:if>
        </div>
      </div>
    </div>
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
                            ${slot.status == 'booked' ? 'disabled' : ''}
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
                <form class="card" action="${pageContext.request.contextPath}/parking_slot/search" method="post">
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
                      <input type="hidden" name="parkingAreaId" value="${id}" />
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
                          <div class="col-auto m-auto">
                            <a href="#" class="avatar w-40 h-40 border border-body border-4 rounded-circle shadow">
                              <img alt="${driver.name}" src="${pageContext.request.contextPath}/uploads/${driver.avatar}" class="rounded-circle">
                            </a>
                          </div>
                          <div class="col ps-4 pt-4 text-center">
                            <h6 class="text-xs text-lowercase text-muted mb-1">${driver.email}</h6>
                            <h1 class="h2">${driver.name}</h1>
                            <div class="d-flex gap-2 flex-wrap mt-3 d-none d-sm-block">
                              <c:if test="${vehicles != null}">
                                <c:forEach items="${vehicles}" var="vehicle">
                                  <span class="bg-white bg-opacity-50 bg-opacity-100-hover border rounded px-3 py-1 font-semibold text-heading text-xs mx-1">
                                    ${vehicle.plate}
                                  </span>
                                </c:forEach>
                              </c:if>
                            </div>
                            <div class="gap-4 mt-4 vstack">
                              <div class="d-flex align-items-center">
                                <i class="bi bi-telephone-forward me-2 text-muted"></i>
                                <a href="tel:${driver.phone}" class="text-sm text-heading text-primary-hover">
                                  ${driver.phone}
                                </a>
                              </div>
                              <div class="d-flex align-items-center">
                                <i class="bi bi-ev-front me-2 text-muted"></i>
                                <span class="text-sm text-heading text-primary-hover">
                                    ${driver.drivingLicence}
                                </span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <form action="${pageContext.request.contextPath}/parking_slot/booking" method="post">
                    <div class="card">
                      <div class="card-body">
                        <div class="mb-7">
                          <h4 class="mb-1">Choose a Vehicle</h4>
                        </div>
                        <input type="hidden" name="driverId" value="${driver.id}" />
                        <input type="hidden" name="parkingAreaId" value="${id}" />
                        <div class="row g-5">
                          <div class="col-md-12">
                            <div>
                              <label class="form-label" for="vehicles">Vehicles</label>
                              <select class="form-select" name="vehicleId" id="vehicles" required>
                                <c:if test="${vehicles != null}">
                                  <c:forEach items="${vehicles}" var="vehicle">
                                    <option value="${vehicle.id}">${vehicle.plate}</option>
                                  </c:forEach>
                                </c:if>
                              </select>
                            </div>
                          </div>
                        </div>
                        <input type="hidden" name="parkingSlotId" required />
                      </div>
                    </div>

                    <div class="card">
                      <div class="card-body">
                        <div class="mb-7">
                          <h4 class="mb-1">Booking Details</h4>
                        </div>
                        <div class="row g-5">
                          <div class="col-md-6">
                            <div>
                              <label class="form-label" for="checkin">Check In</label>
                                <input type="time" class="form-control" name="checkIn" id="checkin" min="" required />
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div>
                              <label class="form-label" for="duration">Booking Duration</label>
                                <select class="form-select" name="bookingDuration" id="duration" required>
                                  <option value="1">1 Hour</option>
                                  <option value="2">2 Hours</option>
                                  <option value="3">3 Hours</option>
                                  <option value="4">4 Hours</option>
                                  <option value="5">5 Hours</option>
                                  <option value="6">6 Hours</option>
                                  <option value="7">7 Hours</option>
                                  <option value="8">8 Hours</option>
                                  <option value="9">9 Hours</option>
                                  <option value="10">10 Hours</option>
                                  <option value="11">11 Hours</option>
                                  <option value="12">12 Hours</option>
                                  <option value="13">13 Hours</option>
                                  <option value="14">14 Hours</option>
                                  <option value="15">15 Hours</option>
                                  <option value="16">16 Hours</option>
                                  <option value="17">17 Hours</option>
                                  <option value="18">18 Hours</option>
                                  <option value="19">19 Hours</option>
                                  <option value="20">20 Hours</option>
                                  <option value="21">21 Hours</option>
                                  <option value="22">22 Hours</option>
                                  <option value="23">23 Hours</option>
                                  <option value="24">24 Hours</option>
                                </select>
                            </div>
                          </div>
                        </div>
                        <input type="text" name="parkingSlotId" value="" hidden required />
                      </div>
                      <div class="card-footer text-end">
                        <button type="submit" class="btn btn-sm btn-primary">
                          Reserve a Spot
                        </button>
                      </div>
                    </div>
                  </form>
                </c:if>

                <c:if test="${driver == null}">
                  <form action="${pageContext.request.contextPath}/parking_slot/booking" method="post" enctype="multipart/form-data">
                    <div class="card">
                      <div class="card-body">
                        <div class="mb-7">
                          <h4 class="mb-1">Driver Details</h4>
                          <p class="text-sm text-muted">
                            By filling your data you get a much better experience using
                            our website.
                          </p>
                        </div>
                        <div class="row g-5">
                          <div class="col-md-6">
                            <div>
                              <label class="form-label" for="name">Name</label>
                              <input type="text" class="form-control" id="name" name="name" required />
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div>
                              <label class="form-label" for="email">Email</label>
                              <input type="email" class="form-control" id="email" name="email" required />
                            </div>
                          </div>
                          <div class="col-6">
                            <div>
                              <label class="form-label" for="phone">phone</label>
                              <input type="tel" class="form-control" name="phone" id="phone" required />
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div>
                              <label class="form-label" for="otp">One Time Password</label>
                              <input type="text" class="form-control" name="otp" id="otp" required />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div>
                              <label class="form-label" for="drivingLicence">Driving Licence</label>
                              <input type="number" class="form-control" id="drivingLicence" name="drivingLicence" required />
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div>
                              <label class="form-label" for="file_upload">Avatar</label>
                              <div
                                      class="rounded border border-2 border-dashed border-primary-hover position-relative"
                              >
                                <div class="d-flex justify-content-center px-5 py-5">
                                  <label
                                          for="file"
                                          class="position-absolute w-full h-full top-0 start-0 cursor-pointer"
                                  ><input
                                          id="file"
                                          name="avatar"
                                          type="file"
                                          class="visually-hidden"
                                          required
                                  /></label>
                                  <div class="text-center">
                                    <div class="text-2xl text-muted">
                                      <i class="bi bi-upload"></i>
                                    </div>
                                    <div class="d-flex text-sm mt-3">
                                      <p class="font-semibold">
                                        Upload a file or drag and drop
                                      </p>
                                    </div>
                                    <p class="text-xs text-gray-500">
                                      PNG, JPG, GIF up to 3MB
                                    </p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="card">
                      <div class="card-body">
                        <div class="mb-7">
                          <h4 class="mb-1">Booking Details</h4>
                        </div>
                        <div class="row g-5">
                          <div class="col-md-6">
                            <div>
                              <label class="form-label" for="checkin2">Check In</label>
                              <input type="time" class="form-control" name="checkIn" id="checkin2" min="" required />
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div>
                              <label class="form-label" for="duration2">Booking Duration</label>
                              <select class="form-select" name="bookingDuration" id="duration2" required>
                                <option value="1">1 Hour</option>
                                <option value="2">2 Hours</option>
                                <option value="3">3 Hours</option>
                                <option value="4">4 Hours</option>
                                <option value="5">5 Hours</option>
                                <option value="6">6 Hours</option>
                                <option value="7">7 Hours</option>
                                <option value="8">8 Hours</option>
                                <option value="9">9 Hours</option>
                                <option value="10">10 Hours</option>
                                <option value="11">11 Hours</option>
                                <option value="12">12 Hours</option>
                                <option value="13">13 Hours</option>
                                <option value="14">14 Hours</option>
                                <option value="15">15 Hours</option>
                                <option value="16">16 Hours</option>
                                <option value="17">17 Hours</option>
                                <option value="18">18 Hours</option>
                                <option value="19">19 Hours</option>
                                <option value="20">20 Hours</option>
                                <option value="21">21 Hours</option>
                                <option value="22">22 Hours</option>
                                <option value="23">23 Hours</option>
                                <option value="24">24 Hours</option>
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="card">
                      <div class="card-body pb-0">
                        <div class="mb-7">
                          <h4 class="mb-1">Vehicle Details</h4>
                          <p class="text-sm text-muted">
                            By filling your data you get a much better experience using
                            our website.
                          </p>
                        </div>
                        <div class="row g-5">
                          <div class="col-md-6">
                            <div>
                              <label class="form-label" for="brand">Brand</label>
                              <select class="form-select" name="brand" id="brand" required>
                                <option value="Audi">Audi</option>
                                <option value="BMW">BMW</option>
                                <option value="Chevrolet">Chevrolet</option>
                                <option value="Ford">Ford</option>
                                <option value="Honda">Honda</option>
                                <option value="Hyundai">Hyundai</option>
                                <option value="Jaguar">Jaguar</option>
                                <option value="Jeep">Jeep</option>
                                <option value="Kia">Kia</option>
                                <option value="Land Rover">Land Rover</option>
                                <option value="Lexus">Lexus</option>
                                <option value="Mazda">Mazda</option>
                                <option value="Mercedes">Mercedes</option>
                                <option value="Mitsubishi">Mitsubishi</option>
                                <option value="Nissan">Nissan</option>
                                <option value="Peugeot">Peugeot</option>
                                <option value="Porsche">Porsche</option>
                                <option value="Subaru">Subaru</option>
                                <option value="Toyota">Toyota</option>
                                <option value="Volkswagen">Volkswagen</option>
                                <option value="Volvo">Volvo</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div>
                              <label class="form-label" for="color">Color</label>
                              <input type="color" class="form-control" id="color" name="color" required />
                            </div>
                          </div>
                          <div class="col-6">
                            <div>
                              <label class="form-label" for="plate">Plate</label>
                              <input type="text" class="form-control" name="plate" id="plate" required />
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div>
                              <label class="form-label" for="type">Type</label>
                              <select class="form-select" name="type" id="type" required>
                                <option value="Sedan">Sedan</option>
                                <option value="SUV">SUV</option>
                                <option value="Hatchback">Hatchback</option>
                                <option value="Coupe">Coupe</option>
                                <option value="Convertible">Convertible</option>
                                <option value="Wagon">Wagon</option>
                                <option value="Van">Van</option>
                                <option value="Pickup">Pickup</option>
                                <option value="Minivan">Minivan</option>
                                <option value="Crossover">Crossover</option>
                                <option value="Hybrid">Hybrid</option>
                                <option value="Electric">Electric</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-md-12">
                            <div>
                              <label class="form-label" for="file_upload">Image</label>
                              <div
                                      class="rounded border border-2 border-dashed border-primary-hover position-relative"
                              >
                                <div class="d-flex justify-content-center px-5 py-5">
                                  <label
                                          for="file_upload"
                                          class="position-absolute w-full h-full top-0 start-0 cursor-pointer"
                                  ><input
                                          id="file_upload"
                                          name="image"
                                          type="file"
                                          class="visually-hidden"
                                          required
                                  /></label>
                                  <div class="text-center">
                                    <div class="text-2xl text-muted">
                                      <i class="bi bi-upload"></i>
                                    </div>
                                    <div class="d-flex text-sm mt-3">
                                      <p class="font-semibold">
                                        Upload a file or drag and drop
                                      </p>
                                    </div>
                                    <p class="text-xs text-gray-500">
                                      PNG, JPG, GIF up to 3MB
                                    </p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <input type="text" name="parkingSlotId" value="" hidden required />
                      <div class="card-footer text-end">
                        <button type="submit" class="btn btn-sm btn-primary">
                          Reserve Spot
                        </button>
                      </div>
                    </div>
                  </form>
                </c:if>

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

      // Set the parking slot id
        document.querySelectorAll("input[name='parkingSlotId']").forEach((input) => {
          input.value = slotRadios[index].value;
        });


      // Uncheck all other radio buttons
      slotRadios.forEach((radio, i) => {
        if (i !== index) {
          radio.checked = false;
        }
      });
    });
  });

    // Set the min time for the check in time
    const checkIn = document.querySelectorAll("#checkin2");
    const today = new Date();
    const hours = today.getHours();
    const minutes = today.getMinutes();
    checkIn.forEach((input) => {
      input.min = `${hours}:${minutes}`;
    });
</script>
</body>
</html>

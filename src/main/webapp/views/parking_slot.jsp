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
            <h1 class="h2 ls-tight">Gate E. Student Center Slots</h1>
          </div>
        </div>
      </div>
    </header>
    <!-- client header end -->

    <main class="py-6 bg-surface-secondary">
      <div class="container">
        <form>
          <!-- stats start -->
          <div class="row g-6">
            <div class="col-xl-8">
              <div class="card">
                <div class="card-body">
                  <h5 class="mb-3">Select a parking slot</h5>
                  <div class="row g-6">
                    <div
                            class="col-md-2 col-lg-2 col-4 mb-3 position-relative"
                    >
                      <label class="slot-label" id="slot-1">NT01</label>
                      <input
                              type="radio"
                              name="slot"
                              id="slot-2"
                              value="1"
                              class="slot-radio"
                      />
                      <div class="slot">
                        <div class="slot-inner">NT01</div>
                      </div>
                    </div>
                    <div
                            class="col-md-2 col-lg-2 col-4 mb-3 position-relative"
                    >
                      <label class="slot-label">NT01</label>
                      <input
                              type="radio"
                              name="slot"
                              id="slot-3"
                              value="1"
                              class="slot-radio"
                      />
                      <div class="slot">
                        <div class="slot-inner">NT01</div>
                      </div>
                    </div>
                    <div
                            class="col-md-2 col-lg-2 col-4 mb-3 position-relative"
                    >
                      <label class="slot-label">NT01</label>
                      <input
                              type="radio"
                              name="slot"
                              id="slot-4"
                              value="1"
                              class="slot-radio"
                      />
                      <div class="slot">
                        <div class="slot-inner">NT01</div>
                      </div>
                    </div>
                    <div
                            class="col-md-2 col-lg-2 col-4 mb-3 position-relative"
                    >
                      <label class="slot-label">NT01</label>
                      <input
                              type="radio"
                              name="slot"
                              id="slot-5"
                              value="1"
                              class="slot-radio"
                      />
                      <div class="slot">
                        <div class="slot-inner">NT01</div>
                      </div>
                    </div>
                    <div
                            class="col-md-2 col-lg-2 col-4 mb-3 position-relative"
                    >
                      <label class="slot-label">NT01</label>
                      <input
                              type="radio"
                              name="slot"
                              id="slot-6"
                              value="1"
                              class="slot-radio"
                      />
                      <div class="slot">
                        <div class="slot-inner">NT01</div>
                      </div>
                    </div>
                    <div
                            class="col-md-2 col-lg-2 col-4 mb-3 position-relative"
                    >
                      <label class="slot-label">NT01</label>
                      <input
                              type="radio"
                              name="slot"
                              id="slot-7"
                              value="1"
                              class="slot-radio"
                      />
                      <div class="slot">
                        <div class="slot-inner">NT01</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-4">
              <div class="vstack gap-6">
                <div class="card">
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
                    />
                    </div>
                    <div class="text-end mt-3">
                      <button
                              type="button"
                              class="btn btn-sm btn-primary w-100"
                      >
                        Search
                      </button>
                    </div>
                  </div>
                </div>

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
        </form>
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

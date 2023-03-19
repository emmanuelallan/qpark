<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/includes/navbar.jsp" />

<%-- main start --%>
<!-- admin header start -->
<header>
  <div class="container-fluid max-w-screen-md">
    <div class="border-bottom pt-6">
      <div class="row align-items-center">
        <div class="col-sm col-12 d-flex align-items-center justify-content-between">
          <a href="${pageContext.request.contextPath}/vehicles?driver=${driverId}" class="d-flex align-items-center text-decoration-none">
            <i class="bi bi-arrow-left-short h4 mb-0 text-primary"></i>
            <span class="h6 mb-0 ms-2 text-primary">Back to Vehicles</span>
          </a>
          <h1 class="h2 ls-tight">Add Vehicle</h1>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- admin header end -->

<main class="py-6 bg-surface-secondary">
  <div class="container-fluid max-w-screen-md vstack gap-6">
    <!-- add parking form -->
    <form class="card" action="${pageContext.request.contextPath}/vehicles/add" method="post" enctype="multipart/form-data">
      <div class="card-body pb-0">
        <div class="mb-7">
          <h4 class="mb-1">Vehicle Details</h4>
          <p class="text-sm text-muted">
            By filling your data you get a much better experience using
            our website.
          </p>
        </div>
        <div class="row g-5">
          <input type="hidden" name="driver" value="${driverId}" />
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
                          name="file_upload"
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
      <div class="card-footer text-end">
        <button type="submit" class="btn btn-sm btn-primary">
          Add Vehicle
        </button>
      </div>
    </form>
    <!-- latest bookings end -->
  </div>
</main>
<%-- main end --%>

<jsp:include page="/views/includes/footer.jsp" />

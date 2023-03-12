<%--
  Created by IntelliJ IDEA.
  User: Max The Stranger
  Date: 3/12/2023
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/includes/navbar.jsp" />

<%-- main start --%>
<main>
  <!-- hero start -->
  <section class="pt-0 position-relative">
    <div class="bg-dim"></div>
    <div class="container-fluid hero">
      <div class="row">
        <!-- title -->
        <div class="col-md-6 mx-auto text-center pt-7 pb-9 z-1">
          <h1 class="text-white">
            Find the best parking deals in your city
          </h1>
          <p class="lead text-white mb-0 fst-italic font-monospace">
            qPark is a parking marketplace that connects drivers with
            available parking spaces.
          </p>
        </div>
      </div>
    </div>
  </section>
  <!-- hero end -->

  <!-- search start -->

  <!-- search end -->

  <!-- popular parking near you -->
  <section class="pt-0 pt-md-5 pb-8">
    <div class="container">
      <div class="row mb-4">
        <div class="col-12 text-center">
          <h2 class="mb-0">Popular parking spots near you</h2>
        </div>
      </div>

      <div class="row g-4">
        <div class="col-sm-6 col-xl-3">
          <div class="card card-img-scale overflow-hidden bg-transparent">
            <div class="card-img-scale-wrapper rounded-3">
              <img src="#" class="card-img" alt="">
              <div class="card-img-overlay d-flex flex-column z-index-1 p-4">
                <!-- Card overlay top -->
                <div class="d-flex justify-content-between">
                  <span class="badge text-bg-dark">Adventure</span>
                  <span class="badge text-bg-white"><i class="fa-solid fa-star text-warning me-2"></i>4.3</span>
                </div>
                <!-- Card overlay bottom -->
                <div class="w-100 mt-auto">
                  <!-- Card category -->
                  <span class="badge text-bg-white fs-6">6 days / 5 nights</span>
                </div>
              </div>
            </div>

            <div class="card-body px-2">
              <!-- Title -->
              <h5 class="card-title">
                <a href="#" class="stretched-link">Lombok, Indonesia</a>
              </h5>
              <!-- Content -->
              <div class="hstack gap-2">
                <span class="h5 mb-0 text-success">$1385</span>
                <small>Starting price</small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>
<%-- main end --%>

<jsp:include page="/WEB-INF/views/includes/footer.jsp" />

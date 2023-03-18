<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
          <tr>
            <td>11:00 AM</td>
            <td>Noel Mungai</td>
            <td>Gate E. Student Center</td>
            <td>N11</td>
            <td>KDJ 457C</td>
            <td>
                        <span class="badge badge-lg badge-dot">
                          <i class="bg-warning"></i>
                          Active
                        </span>
            </td>
            <td>
              <span class="text-sm font-bold">Ksh. 2,500</span>
            </td>
            <td>1 Hour</td>
            <td class="text-end">
              <button class="btn btn-sm btn-outline-success">
                <i class="bi bi-check2-all"></i>
              </button>
            </td>
          </tr>
          <tr>
            <td>11:00 AM</td>
            <td>Noel Mungai</td>
            <td>Gate E. Student Center</td>
            <td>N11</td>
            <td>KDJ 457C</td>
            <td>
                        <span class="badge badge-lg badge-dot">
                          <i class="bg-success"></i>
                          Complete
                        </span>
            </td>
            <td>
              <span class="text-sm font-bold">Ksh. 2,500</span>
            </td>
            <td>1 Hour</td>
            <td class="text-end">
              <button class="btn btn-sm btn-outline-dark">
                <i class="bi bi-arrow-repeat"></i>
              </button>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
    <!-- latest bookings end -->
  </div>
</main>
<%-- main end --%>

<jsp:include page="/views/includes/footer.jsp" />

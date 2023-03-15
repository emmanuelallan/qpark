<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/includes/navbar.jsp" />

<%-- main start --%>
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
                                href="#"
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
                    <tr>
                        <td>John Doe</td>
                        <td>
                            <a href="mailto:john@doe.com"> john@doe.com </a>
                        </td>
                        <td>
                            <a href="tel:+254700000000"> +254700000000 </a>
                        </td>
                        <td>1234567890</td>
                        <td>
                            <span class="text-xs">KDJ 457C, KAY 458D</span>
                        </td>
                        <td>
                            <button class="btn btn-sm btn-outline-dark">
                                <i class="bi bi-pencil"></i>
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

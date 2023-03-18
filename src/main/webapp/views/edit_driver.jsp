<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/views/includes/navbar.jsp" />

<%-- main start --%>
<!-- admin header start -->
<header>
    <div class="container-fluid max-w-screen-md">
        <div class="border-bottom pt-6">
            <div class="row align-items-center">
                <div class="col-sm col-12">
                    <h1 class="h2 ls-tight">Edit Driver</h1>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- admin header end -->

<c:if test="${driver != null}">
    <c:set var="id" value="${driver.id}" />
    <c:set var="name" value="${driver.name}" />
    <c:set var="email" value="${driver.email}" />
    <c:set var="phone" value="${driver.phone}" />
    <c:set var="drivingLicence" value="${driver.drivingLicence}" />
    <c:set var="otp" value="${driver.otp}" />
    <c:set var="avatar" value="${driver.avatar}" />
</c:if>

<main class="py-6 bg-surface-secondary">
    <div class="container-fluid max-w-screen-md vstack gap-6">
        <!-- add parking form -->
        <form class="card" action="${pageContext.request.contextPath}/drivers/update" method="post" enctype="multipart/form-data">
            <div class="card-body pb-0">
                <div class="mb-7">
                    <h4 class="mb-1">Driver Details</h4>
                    <p class="text-sm text-muted">
                        By filling your data you get a much better experience using
                        our website.
                    </p>
                </div>
                <div class="row g-5">
                    <input type="hidden" name="id" value="${id}" />
                    <div class="col-md-6">
                        <div>
                            <label class="form-label" for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="${name}" required />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label class="form-label" for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${email}" required />
                        </div>
                    </div>
                    <div class="col-6">
                        <div>
                            <label class="form-label" for="phone">Phone</label>
                            <input type="tel" class="form-control" name="phone" id="phone" value="${phone}" required />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label class="form-label" for="otp">One Time Password</label>
                            <input type="text" class="form-control" name="otp" id="otp" value="${otp}" required />
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div>
                            <label class="form-label" for="drivingLicence">Driving Licence</label>
                            <input type="number" class="form-control" id="drivingLicence" maxlength="10" minlength="10" name="drivingLicence" value="${drivingLicence}" required />
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
                                            for="file_upload"
                                            class="position-absolute w-full h-full top-0 start-0 cursor-pointer"
                                    ><input
                                            id="file_upload"
                                            name="file_upload"
                                            type="file"
                                            class="visually-hidden"
                                            value="${avatar}"
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
                    Update Driver
                </button>
            </div>
        </form>
        <!-- latest bookings end -->
    </div>
</main>
<%-- main end --%>

<jsp:include page="/views/includes/footer.jsp" />

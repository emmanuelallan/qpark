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
                <div class="col-sm col-12 d-flex align-items-center justify-content-between">
                    <a href="${pageContext.request.contextPath}/vehicles?driver=${driverId}" class="d-flex align-items-center text-decoration-none">
                        <i class="bi bi-arrow-left-short h4 mb-0 text-primary"></i>
                        <span class="h6 mb-0 ms-2 text-primary">Back to Vehicles</span>
                    </a>
                    <h1 class="h2 ls-tight">Edit Vehicle</h1>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- admin header end -->

<c:if test="${vehicle != null}">
    <c:set var="id" value="${vehicle.id}" />
    <c:set var="brand" value="${vehicle.brand}" />
    <c:set var="color" value="${vehicle.color}" />
    <c:set var="plate" value="${vehicle.plate}" />
    <c:set var="type" value="${vehicle.type}" />
    <c:set var="image" value="${vehicle.image}" />
</c:if>

<main class="py-6 bg-surface-secondary">
    <div class="container-fluid max-w-screen-md vstack gap-6">
        <!-- add parking form -->
        <form class="card" action="${pageContext.request.contextPath}/vehicles/update" method="post" enctype="multipart/form-data">
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
                    <input type="hidden" name="id" value="${id}" />
                    <div class="col-md-6">
                        <div>
                            <label class="form-label" for="brand">Brand</label>
                            <select class="form-select" name="brand" id="brand" required>
                                <option ${name == 'Audi' ? 'selected' : ''} value="Audi">Audi</option>
                                <option ${name == 'BMW' ? 'selected' : ''} value="BMW">BMW</option>
                                <option ${name == 'Chevrolet' ? 'selected' : ''} value="Chevrolet">Chevrolet</option>
                                <option ${name == 'Chevrolet' ? 'selected' : ''} value="Chevrolet">Chevrolet</option>
                                <option ${name == 'Honda' ? 'selected' : ''} value="Honda">Honda</option>
                                <option ${name == 'Hyundai' ? 'selected' : ''} value="Hyundai">Hyundai</option>
                                <option ${name == 'Jaguar' ? 'selected' : ''} value="Jaguar">Jaguar</option>
                                <option ${name == 'Jeep' ? 'selected' : ''} value="Jeep">Jeep</option>
                                <option ${name == 'Kia' ? 'selected' : ''} value="Kia">Kia</option>
                                <option ${name == 'Land Rover' ? 'selected' : ''} value="Land Rover">Land Rover</option>
                                <option ${name == 'Lexus' ? 'selected' : ''} value="Lexus">Lexus</option>
                                <option ${name == 'Mazda' ? 'selected' : ''} value="Mazda">Mazda</option>
                                <option ${name == 'Mercedes' ? 'selected' : ''} value="Mercedes">Mercedes</option>
                                <option ${name == 'Mitsubishi' ? 'selected' : ''} value="Mitsubishi">Mitsubishi</option>
                                <option ${name == 'Nissan' ? 'selected' : ''} value="Nissan">Nissan</option>
                                <option ${name == 'Peugeot' ? 'selected' : ''} value="Peugeot">Peugeot</option>
                                <option ${name == 'Porsche' ? 'selected' : ''} value="Porsche">Porsche</option>
                                <option ${name == 'Subaru' ? 'selected' : ''} value="Subaru">Subaru</option>
                                <option ${name == 'Toyota' ? 'selected' : ''} value="Toyota">Toyota</option>
                                <option ${name == 'Volkswagen' ? 'selected' : ''} value="Volkswagen">Volkswagen</option>
                                <option ${name == 'Volvo' ? 'selected' : ''} value="Volvo">Volvo</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label class="form-label" for="color">Color</label>
                            <input type="color" class="form-control" id="color" name="color" value="${color}" required />
                        </div>
                    </div>
                    <div class="col-6">
                        <div>
                            <label class="form-label" for="plate">Plate</label>
                            <input type="text" class="form-control" name="plate" id="plate" value="${plate}" required />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label class="form-label" for="type">Type</label>
                            <select class="form-select" name="type" id="type" required>
                                <option ${type == 'Sedan' ? 'selected' : ''} value="Sedan">Sedan</option>
                                <option ${type == 'Hatchback' ? 'selected' : ''} value="Hatchback">Hatchback</option>
                                <option ${type == 'Coupe' ? 'selected' : ''} value="Coupe">Coupe</option>
                                <option ${type == 'SUV' ? 'selected' : ''} value="SUV">SUV</option>
                                <option ${type == 'Van' ? 'selected' : ''} value="Van">Van</option>
                                <option ${type == 'Pickup' ? 'selected' : ''} value="Pickup">Pickup</option>
                                <option ${type == 'Track' ? 'selected' : ''} value="Track">Track</option>
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
                                            value="${image}"
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
                    Update Vehicle
                </button>
            </div>
        </form>
        <!-- latest bookings end -->
    </div>
</main>
<%-- main end --%>

<jsp:include page="/views/includes/footer.jsp" />

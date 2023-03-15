<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/includes/navbar.jsp" />

<%-- main start --%>
<!-- admin header start -->
<header>
    <div class="container-fluid max-w-screen-md">
        <div class="border-bottom pt-6">
            <div class="row align-items-center">
                <div class="col-sm col-12">
                    <h1 class="h2 ls-tight">Add Parking</h1>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- admin header end -->

<main class="py-6 bg-surface-secondary">
    <div class="container-fluid max-w-screen-md vstack gap-6">
        <!-- add parking form -->
        <form class="card" action="${pageContext.request.contextPath}/parking_area/add" method="post" enctype="multipart/form-data">
            <div class="card-body pb-0">
                <div class="mb-7">
                    <h4 class="mb-1">Parking Area Details</h4>
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
                            <label class="form-label" for="status">Status</label>
                            <select class="form-select" id="status" name="status" required>
                                <option selected="">Status</option>
                                <option value="Open">Open</option>
                                <option value="Closed">Closed</option>
                                <option value="Full">Full</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-12">
                        <div>
                            <label class="form-label" for="location">Location</label>
                            <input type="text" class="form-control" name="location" id="location" required />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div>
                            <label class="form-label" for="price">Price</label>
                            <input type="number" class="form-control" id="price" name="price" required />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div>
                            <label class="form-label" for="fine">Fine</label>
                            <input type="number" class="form-control" name="fine" id="fine" required />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div>
                            <label class="form-label" for="capacity">Capacity</label>
                            <input type="number" class="form-control" name="capacity" id="capacity" required />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label class="form-label" for="opening_time">Opening Time</label>
                            <input type="time" class="form-control" id="opening_time" name="opening_time" required />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label class="form-label" for="closing_time">Closing Time</label>
                            <input type="time" class="form-control" name="closing_time" id="closing_time" required />
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
                    Add Parking
                </button>
            </div>
        </form>
        <!-- latest bookings end -->
    </div>
</main>
<%-- main end --%>

<jsp:include page="/views/includes/footer.jsp" />

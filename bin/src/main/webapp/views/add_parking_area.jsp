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
        <div class="card">
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
                            <label class="form-label">Name</label>
                            <input type="text" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label class="form-label">Status</label>
                            <select class="form-select">
                                <option selected="">Status</option>
                                <option value="Open">Open</option>
                                <option value="Closed">Closed</option>
                                <option value="Full">Full</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-12">
                        <div>
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div>
                            <label class="form-label">Price</label>
                            <input type="number" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div>
                            <label class="form-label">Fine</label>
                            <input type="number" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div>
                            <label class="form-label">Capacity</label>
                            <input type="number" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label class="form-label">Opening Time</label>
                            <input type="time" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label class="form-label">Closing Time</label>
                            <input type="time" class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div>
                            <label class="form-label">Image</label>
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
                    Save
                </button>
            </div>
        </div>
        <!-- latest bookings end -->
    </div>
</main>
<%-- main end --%>

<jsp:include page="/views/includes/footer.jsp" />

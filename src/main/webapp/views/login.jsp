<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover" />
	<meta name="color-scheme" content="dark light" />
	<title>qPark | Parking made easy</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/utilities.css" />
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
</head>
<body>
<div class="px-5 py-5 p-lg-0 h-screen bg-surface-secondary d-flex flex-column justify-content-center">
	<div class="d-flex justify-content-center">
		<div class="col-12 col-md-9 col-lg-6 min-h-lg-screen d-flex flex-column justify-content-center py-lg-16 px-lg-20 position-relative">
			<div class="row">
				<div class="col-lg-10 col-md-9 col-xl-7 mx-auto">
					<div class="text-center mb-12">
						<h3 class="display-5">👋</h3>
						<h1 class="ls-tight font-bolder mt-6">Welcome back! Admin</h1>
						<p class="mt-2">Let's get started</p>
					</div>
					<c:if test="${not empty error}">
						<div class="alert alert-danger mb-3" role="alert">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
									<p>
										${error}
									</p>
								</div>
								<div class="flex-shrink-0 ms-3">
									<i class="bi bi-radioactive fs-2 text-danger"></i>
								</div>
							</div>
						</div>
					</c:if>
					<form action="${pageContext.request.contextPath}/admin/login" method="post">
						<div class="mb-5">
							<label class="form-label" for="email">Email address</label>
							<input
								type="email"
								class="form-control"
								id="email"
								name="email"
								placeholder="Your email address"
							/>
						</div>
						<div class="mb-5">
							<div class="d-flex align-items-center justify-content-between">
								<div>
									<label class="form-label" for="password">Password</label>
								</div>
							</div>
							<input
								type="password"
								class="form-control"
								id="password"
								name="password"
								placeholder="Password"
								autocomplete="current-password"
							/>
						</div>
						<div><button type="submit" class="btn btn-primary w-full">Sign in</button></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>
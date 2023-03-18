<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>QPark Admin Login</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+XzKiqJ5fYsaW6TfRnkt+Uxtkks2Ps7"
		crossorigin="anonymous">
	<style>
		body {
			background-color: #343a40;
			font-family: Arial, sans-serif;
			color: #f8f9fa;
		}
		
		.container {
			max-width: 600px;
			margin: 0 auto;
			padding-top: 50px;
			text-align: center;
		}
		
		h1 {
			font-size: 48px;
			margin-bottom: 50px;
		}
		
		form {
			background-color: #f8f9fa;
			border-radius: 10px;
			padding: 20px;
			box-shadow: 2px 2px 5px #aaaaaa;
		}
		
		label {
			font-size: 18px;
			display: block;
			margin-bottom: 10px;
			text-align: left;
			color: black;
		}
		
		input[type="email"], input[type="password"] {
			width: 100%;
			padding: 10px;
			border: none;
			border-radius: 5px;
			margin-bottom: 20px;
			font-size: 18px;
			background-color: #e9ecef;
			color: #343a40;
		}
		
		button[type="submit"] {
			background-color: #007bff;
			color: #f8f9fa;
			padding: 12px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			font-size: 18px;
			margin-top: 20px;
			width: 100%;
		}
		
		button[type="submit"]:hover {
			background-color: #0069d9;
		}
		
		.image-container {
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
			margin-bottom: 50px;
		}
		
		.image-container img {
			width: 150px;
			height: 150px;
			margin-right: 20px;
		}
		
		@media (max-width: 768px) {
			.container {
				padding: 10px;
			}
			
			h1 {
				font-size: 36px;
				margin-bottom: 30px;
			}
			
			input[type="email"], input[type="password"] {
				font-size: 16px;
			}
			
			button[type="submit"] {
				font-size: 16px;
			}
			
			.image-container {
				margin-bottom: 30px;
			}
			
			.image-container img {
				width: 100px;
				height: 100px;
				margin-right: 10px;
			}
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="image-container">
			<h1>QPark Admin Login</h1>
		</div>
	<form action="admin" method="post">
		<div class="form-group">
			<label for="email">Email:</label>
			<input type="email" id="email" name="email" required>
		</div>
		<div class="form-group">
			<label for="password">Password:</label>
			<input type="password" id="password" name="password" required>
		</div>
		<button type="submit">Login</button>
	</form>
	
	<% if (request.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-danger" role="alert">
        <%= request.getAttribute("errorMessage") %>
    </div>
<% } %>
	
</div>
</body>
</html>
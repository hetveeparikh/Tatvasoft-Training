<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>Page Unavailable</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/img-Homepage/favicon_img.png"
	type="image/x-icon">
</head>
<body>
	<div class="text-center mt-5 mb-5">
		<img src="<%=request.getContextPath()%>/resources/img/img-Homepage//favicon_img.png"
			class="white_logo_transparent_background" />
	</div>
	<h2 class="text-center text-danger mt-5 mb-3 container p-3">The page you are trying to access does not exist. Please check the URL and try again.</h2>
	<div class="text-center mt-5">
		<a class="text-dark font-weight-bold h3 text-center" href="homepage">Go to Homepage</a>
	</div>
	
</body>
</html>
<%@page import="in.co.ecommerce.entity.UserEntity"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shoppulse</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- <link href="/ONLINE-GARMENTS-DEAL/css/main.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" /> -->
<link href="/Ecommerce/resources/css/product.css" rel="stylesheet">

<style type="text/css">
a:hover {
	text-decoration: none;
}

.section-padding {
	padding: 14px 0;
}

.bottom {
	background-color: #0a1c2e;
}

.bottom .copyright {
	color: #e5e5e5;
	font-weight: 600;
}

.copyright a {
	color: #f2ff49;
	margin-left: 3px;
	padding-right: 3px;
}

.bottom p {
	margin-bottom: 0;
	line-height: 50px;
	font-size: 16px;
	font-weight: 400;
}

.copyright p span {
	color: #d1caca;
}

.bottom .copyright p, .bottom .copyright a:hover {
	color: #6c6d83;
}

.error {
	color: red;
}
</style>
</head>
<body>

<% UserEntity userbean=(UserEntity)session.getAttribute("userLogin");%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
		class="navbar-brand" href="/Ecommerce/welcome">E-commerce</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="/Ecommerce/welcome">Home
					<span class="sr-only">(current)</span>
			</a></li>

			
			<%if(userbean!=null){ %>
                 
            <%if(userbean.getRoleId()==1){ %>
			<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/user">Add Manager</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/user/search">Manager List</a></li>
					
				<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/prod">Add Product</a></li>
				<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/prod/search">Products</a></li>
				<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/bookProd/search">Book List</a></li>

			<%}else if(userbean.getRoleId()==2) {%>
				<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/prod">Add Product</a></li>
				<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/prod/search">Products</a></li>
				<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/bookProd/search">Book List</a></li>
				
				
			<%}else if(userbean.getRoleId()==3){ %>

			<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/prod/search">Products</a></li>
				
			<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/bookProd/search">Book List</a></li>

			<!-- <li class="nav-item"><a class="nav-link" href="#">Contact Us</a></li>
			<li class="nav-item"><a class="nav-link" href="#">About Us</a></li> -->
			<%} }else{%>
				<li class="nav-item"><a class="nav-link"
				href="/Ecommerce/prod/search">Products</a></li>
			<%}%>
		
		</ul>
		
	

		<form class="form-inline my-2 my-lg-0">

				<%if(userbean!=null){ %>
					<a class="nav-link" class="btn btn-outline-success my-2 my-sm-0"
						href="<c:url value = "/login"/>">Logout</a>
				<%}else{ %>
					<a class="nav-link" class="btn btn-outline-success my-2 my-sm-0"
						href="<c:url value = "/login"/>">Login</a>
				<%} %>
		</form>
	</div>
	</nav>
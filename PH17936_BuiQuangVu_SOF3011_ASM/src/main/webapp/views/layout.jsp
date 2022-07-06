<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>IT16310</title>
	<link rel="stylesheet" href="/PH17936_BuiQuangVu_SOF3011_ASM/css/bootstrap.min.css">
	<link rel="stylesheet" href="/PH17936_BuiQuangVu_SOF3011_ASM/css/mdb.min.css">
	<link rel="stylesheet" href="/PH17936_BuiQuangVu_SOF3011_ASM/icon/bootstrap-icons.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
</head>
<body>
	<header class="waves-effect sticky-top">
        <!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		    <!-- Container wrapper -->
		    <div class="container-fluid">
		        <!-- Toggle button -->
		        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
		            data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
		            aria-label="Toggle navigation">
		            <i class="fas fa-bars"></i>
		        </button>
		
		        <!-- Collapsible wrapper -->
		        <div class="collapse navbar-collapse" id="navbarSupportedContent">
		            <!-- Navbar brand -->
		            <c:url var="home" value="/home"></c:url>
		            <a class="navbar-brand mt-2 mt-lg-0" href="${ home }/index?index=1">
		                <img src="/PH17936_BuiQuangVu_SOF3011_ASM/images/logo.png" height="40" alt="FPT Logo" loading="lazy" />
		            </a>
		            <!-- Left links -->
		            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		                <li class="nav-item">
		                    <a class="nav-link fw-bold" href="#gioithieu">Giới thiệu</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link fw-bold" href="#lienhe">Liên hệ</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link fw-bold" href="#gopy">Góp ý</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link fw-bold" href="#hoidap">Hỏi đáp</a>
		                </li>
		            </ul>
		        </div>
		        <div class="d-flex align-items-center">
				    <c:if test="${ sessionScope.user != null }">
		            	<ul class="navbar-nav me-3">
					      <!-- Badge -->
					      <li class="nav-item">
					      	<c:url var="orderdetail" value="/orderdetail"></c:url>
					        <a class="nav-link" href="${ orderdetail }/index">
					          <span class="badge badge-pill bg-danger">${ sessionScope.mh }</span>
					          <span><i class="fas fa-shopping-cart"></i></span>
					        </a>
					      </li>
					    </ul>
		            </c:if>
				    <c:url var="manage" value="/manage"></c:url>
		            <c:if test="${ sessionScope.user == null }">
		            	<a href="${ manage }/loginG" class="btn btn-info btn-rounded fw-bold text me-3">Đăng Nhập</a>
		            	<a href="${ manage }/signupG" class="btn btn-info btn-rounded fw-bold text">Đăng Ký</a>
		            </c:if>
		            <c:if test="${ sessionScope.user != null }">
		            	<div class="dropdown">
				            <button class="btn btn-info btn-rounded dropdown-toggle" type="button" id="dropdownMenuButton"
				                data-mdb-toggle="dropdown" aria-expanded="false"><i class="fas fa-user"></i>
				                ${ sessionScope.user.hoTen }
				            </button>
				            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
				            	<c:if test="${ sessionScope.user.phanQuyen == 1 }">
				            		<c:url var="users" value="/users"></c:url>
				            		<li><a class="dropdown-item" href="${ users }/index">Quản trị</a></li>
				            	</c:if>
				                <li><a class="dropdown-item" href="#">Thông tin cá nhân</a></li>
				                <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
				                <li><a class="dropdown-item" href="${ manage }/logoutG">Đăng xuất</a></li>
				            </ul>
				        </div>
		            </c:if>
		        </div>
		        <!-- Right elements -->
		    </div>
		    <!-- Container wrapper -->
		</nav>
		<!-- Navbar -->
    </header>
    
    <div style="min-height: 528px;">
    	<jsp:include page="${ view }"></jsp:include>
    </div>
	
    <footer class="bg-light text-center text-white">
        <!-- Grid container -->
		<div class="container p-4 pb-0">
		    <!-- Section: Social media -->
		    <section class="mb-4">
		        <!-- Facebook -->
		        <a class="btn btn-primary btn-floating m-1" style="background-color: #3b5998;" href="#!" role="button"><i
		                class="fab fa-facebook-f"></i></a>
		
		        <!-- Twitter -->
		        <a class="btn btn-primary btn-floating m-1" style="background-color: #55acee;" href="#!" role="button"><i
		                class="fab fa-twitter"></i></a>
		
		        <!-- Google -->
		        <a class="btn btn-primary btn-floating m-1" style="background-color: #dd4b39;" href="#!" role="button"><i
		                class="fab fa-google"></i></a>
		
		        <!-- Instagram -->
		        <a class="btn btn-primary btn-floating m-1" style="background-color: #ac2bac;" href="#!" role="button"><i
		                class="fab fa-instagram"></i></a>
		
		        <!-- Linkedin -->
		        <a class="btn btn-primary btn-floating m-1" style="background-color: #0082ca;" href="#!" role="button"><i
		                class="fab fa-linkedin-in"></i></a>
		        <!-- Github -->
		        <a class="btn btn-primary btn-floating m-1" style="background-color: #333333;" href="#!" role="button"><i
		                class="fab fa-github"></i></a>
		    </section>
		    <!-- Section: Social media -->
		</div>
		<!-- Grid container -->
		
		<!-- Copyright -->
		<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
		    © 2020 Copyright:
		    <a class="text-white" href="#">Quang Vũ</a>
		</div>
		<!-- Copyright -->
    </footer>
	
	<script src="/PH17936_BuiQuangVu_SOF3011_ASM/js/mdb.min.js"></script>
	<script src="/PH17936_BuiQuangVu_SOF3011_ASM/js/jquery.min.js"></script>
	<script src="/PH17936_BuiQuangVu_SOF3011_ASM/js/popper.min.js"></script>
	<script src="/PH17936_BuiQuangVu_SOF3011_ASM/js/bootstrap.min.js"></script>
</body>
</html>
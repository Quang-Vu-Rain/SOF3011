<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<style>
body {
	background-image: url(/Test/images/pixel-art-1.gif);
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
}
</style>

<div class="container pt-2 pb-2">

	<div class="row hover-shadow" style="background-color: #EEEEEE">
		<div class="border border-1 ps-0 pe-0 col-8">
			<!-- Carousel wrapper -->
			<div id="carouselBasicExample" class="carousel slide carousel-fade"
				data-mdb-ride="carousel">
				<!-- Indicators -->
				<div class="carousel-indicators">
					<button type="button" data-mdb-target="#carouselBasicExample"
						data-mdb-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-mdb-target="#carouselBasicExample"
						data-mdb-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-mdb-target="#carouselBasicExample"
						data-mdb-slide-to="2" aria-label="Slide 3"></button>
				</div>

				<!-- Inner -->
				<div class="carousel-inner">
					<!-- Single item -->
					<div class="carousel-item active">
						<img
							src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%20(15).webp"
							class="d-block w-100" alt="Sunset Over the City" />
						<div class="carousel-caption d-none d-md-block">
							<h5>First slide label</h5>
							<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
						</div>
					</div>

					<!-- Single item -->
					<div class="carousel-item">
						<img
							src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%20(22).webp"
							class="d-block w-100" alt="Canyon at Nigh" />
						<div class="carousel-caption d-none d-md-block">
							<h5>Second slide label</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</div>

					<!-- Single item -->
					<div class="carousel-item">
						<img
							src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%20(23).webp"
							class="d-block w-100" alt="Cliff Above a Stormy Sea" />
						<div class="carousel-caption d-none d-md-block">
							<h5>Third slide label</h5>
							<p>Praesent commodo cursus magna, vel scelerisque nisl
								consectetur.</p>
						</div>
					</div>
				</div>
				<!-- Inner -->

				<!-- Controls -->
				<button class="carousel-control-prev" type="button"
					data-mdb-target="#carouselBasicExample" data-mdb-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-mdb-target="#carouselBasicExample" data-mdb-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<!-- Carousel wrapper -->
		</div>

		<div class="col-8"></div>

	</div>

	<div class="row hover-shadow mt-3">
		<div
			class="m-0 pt-2 bg-light border border-5 border-top-0 border-end-0 border-start-0 border-danger">
			<h4 class="fw-bold text-danger">Danh Mục Sản Phẩm</h4>
		</div>
		<div class="ms-0 row" style="background-color: #EEEEEE">

			<c:forEach items="${ ct }" var="ct">
				<div class="col-2 mt-2 mb-2 ms-2 row">
					<a href="/PH17936_BuiQuangVu_SOF3011_ASM/home/category?id=${ ct.id }" class="bg-light text-dark fs-6">
					<img alt="" src="/PH17936_BuiQuangVu_SOF3011_ASM/images/Ao.jpg" style="height: 70px; width: 70px">
					${ ct.ten }</a>
				</div>
			</c:forEach>

		</div>
	</div>

	<div class="row hover-shadow mt-3">
		<div
			class="m-0 pt-2 bg-light border border-5 border-top-0 border-end-0 border-start-0 border-danger">
			<h4 class="fw-bold text-danger">Tất Cả Sản Phẩm</h4>
		</div>
		<div class="ms-0 row" style="background-color: #EEEEEE">
			<c:forEach items="${ ds }" var="product">
				<div class="col-2 mb-4 mt-2">
					<div class="card rounded-0 border border-1">
						<img src="/PH17936_BuiQuangVu_SOF3011_ASM/images/${ product.anh }"
							class="card-img-top" alt="Fissure in Sandstone" style="height: 150px"/>
						<div class="card-body">
							<p class="card-title fs-5 fw-blod">${ product.ten }</p>
							<p class="card-text text-danger fs-5">${ product.gia }VNĐ</p>
							<a
								href="/PH17936_BuiQuangVu_SOF3011_ASM/home/detail?id=${ product.id }"
								class="btn btn-primary">Chi Tiết</a>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="col-12">
				<nav aria-label="...">
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link">Previous</a>
						</li>
						<c:forEach begin="1" end="${ sl }" var="i">
							<li class="page-item ${ i == in ? "
								active" : "" }" aria-current="page"><a class="page-link"
								href="/PH17936_BuiQuangVu_SOF3011_ASM/home/index?index=${ i }">${ i }
									<c:if test="${ i == in }">
										<span class="visually-hidden">(current)</span>
									</c:if>
							</a></li>
						</c:forEach>

						<li class="page-item disabled"><a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>

			</div>

		</div>

	</div>
</div>
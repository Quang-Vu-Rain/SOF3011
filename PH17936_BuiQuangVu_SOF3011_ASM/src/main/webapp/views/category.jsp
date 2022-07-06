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

	<div class="row hover-shadow mt-3">
		<div
			class="m-0 pt-2 bg-light border border-5 border-top-0 border-end-0 border-start-0 border-danger">
			<h4 class="fw-bold text-danger">Danh Mục: ${ tenDanhMuc }</h4>
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
								href="/PH17936_BuiQuangVu_SOF3011_ASM/home/category?index=${ i }&id=${ id }">${ i }
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
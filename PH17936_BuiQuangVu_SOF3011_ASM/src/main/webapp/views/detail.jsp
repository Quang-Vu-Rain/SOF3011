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

<div class="container pt-2">

	<div class="row mark rounded hover-shadow p-3 mb-3"
		style="background-color: white;">
		<div class="col-12 pb-4">
			<h5>>Sản Phẩm: ${ pro.ten }</h5>
		</div>
		<div class="col-5">
			<img alt="" src="/PH17936_BuiQuangVu_SOF3011_ASM/images/${ pro.anh }"
				style="height: 500px; width: 500px">
		</div>

		<div class="col-6 ms-5">
			<h5 class="fw-bold">${ pro.ten }</h5>
			<h5>${ pro.moTa }</h5>
			<h5 class="fw-bold">Loại: ${ pro.category.ten }</h5>
			<h5 class="fw-bold">Màu sắc: ${ pro.mauSac }</h5>
			<h5 class="fw-bold">Kích thước: ${ pro.kichThuoc }</h5>
			<h5 class="fw-bold">Còn lại: ${ pro.soLuong } (Sản phẩm)</h5>
			<h5 class="text-danger fw-bold">Giá: ${ pro.gia } VNĐ</h5>
			<c:url var="orderdetail" value="/orderdetail"></c:url>
			<a class="btn btn-primary fs-3 mt-3" style="background-color: #ed302f;"
				href="${ orderdetail }/order?id=${ pro.id }" role="button"> <i class="bi bi-basket3-fill"></i> Thêm vào giỏ hàng
			</a>
		</div>

		<div class="col-12 pb-5"></div>
	</div>

</div>
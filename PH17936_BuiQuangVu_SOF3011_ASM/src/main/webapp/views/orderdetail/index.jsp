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

<div class="ms-3 me-3 row rounded m-auto mt-3 mb-3">
	<div class="col-2 ms-0" style="background-color: black;">
		<div class="mt-4 text-center">
			<h2 class="text-light fw-bold">
				<i class="bi bi-kanban-fill"></i> Order <i class="bi bi-kanban"></i>
			</h2>
		</div>
		<div class="mt-5 ms-2 me-2 row">
			<c:url var="orderdetail" value="/orderdetail"></c:url>
			<a href="${ orderdetail }/index" class="fs-6 btn btn-light col-12 fw-bold"><i class="bi bi-basket3-fill"></i> Cart</a>
		</div>
		<div class="mt-2 ms-2 me-2 row mb-2">
			<c:url var="orderdetail" value="/orderdetail"></c:url>
			<a href="${ orderdetail }/history"
				class="fs-6 btn btn-light col-12 fw-bold"><i class="bi bi-hourglass-top"></i> History</a>
		</div>
		
	</div>

	<div class="col-10" style="background-color: white">

		<table class="table align-middle mb-5 bg-white mt-3">
			<thead class="table-dark">
				<tr>
					<th>Sản phẩm</th>
					<th>Loại</th>
					<th>Giá (/1)</th>
					<th>Số lượng</th>
					<th>Thành Tiền</th>
					<th>Hủy bỏ</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ ds }" var="od">
					<tr>
						<td>
							<div class="d-flex align-items-center">
								<img
									src="/PH17936_BuiQuangVu_SOF3011_ASM/images/${ od.product.anh }"
									alt="" style="width: 45px; height: 45px" class="rounded-circle" />
								<div class="ms-3">
									<p class="fw-bold mb-1">${ od.product.ten }</p>
								</div>
							</div>
						</td>
						<td>${ od.product.category.ten }</td>
						<td class="text-danger">${ od.product.gia }VNĐ</td>
						<td>
							<div class="d-flex">
								<c:url var="orderdetail" value="/orderdetail"></c:url>
								<div>
									<a class="btn btn-primary btn-floating"
										href="${ orderdetail }/dec?id=${ od.id }&in=${ od.soLuong }">
										<i class="bi bi-dash-lg fs-4"></i>
									</a>
								</div>
								<div class="ms-1 me-1">
									<input type="text" id="soLuong_${ od.id }" class="form-control"
										value="${ od.soLuong }" />
								</div>
								<div>
									<a class="btn btn-primary btn-floating"
										href="${ orderdetail }/inc?id=${ od.id }&in=${ od.soLuong }">
										<i class="bi bi-plus fs-4"></i>
									</a>
								</div>
							</div>
						</td>
						<td class="text-danger">${ od.soLuong * od.product.gia }VNĐ</td>
						<td><a class="btn btn-danger">Xóa</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="bg-danger text-light text-center m-1">
			<h2>Tổng Tiền: ${ tongTien } VNĐ</h2>
		</div>
		<div class="mt-3 d-flex justify-content-end">
			<div class="mt-2 mb-3">

				<!-- Button trigger modal -->
				<button type="button" class="btn btn-success"
					data-mdb-toggle="modal" data-mdb-target="#exampleModal1">Thanh
					Toán</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal1" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Thông Tin
									Đặt Hàng</h5>
								<button type="button" class="btn-close" data-mdb-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<form method="POST"
									action="/PH17936_BuiQuangVu_SOF3011_ASM/orderdetail/payment"
									name="frmLogin" id="frmLogin">
									<div class="row m-4">
										<div class="col-1 pt-2">
											<i class="fas fa-user prefix deep-orange-text"></i>
										</div>
										<div class="form-outline col-10 ms-3">
											<input type="text" id="diaChiNhanHang" name="diaChiNhanHang"
												class="form-control form-control-lg" /> <label
												class="form-label" for="diaChiNhanHang">Địa Chỉ Nhận
												Hàng</label>
										</div>
										<div class="col-1"></div>
									</div>

									<div class="row m-4">
										<div class="col-1 pt-2">
											<i class="fas fa-user prefix deep-orange-text"></i>
										</div>
										<div class="form-outline col-10 ms-3">
											<textarea id="ghiChu" name="ghiChu"
												class="form-control form-control-lg" rows="4"></textarea>
											<label class="form-label" for="ghiChu">Ghi Chú</label>
										</div>
										<div class="col-1"></div>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-danger"
											data-mdb-dismiss="modal">Hủy</button>
										<button type="submit" class="btn btn-success">Đặt
											Hàng</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
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

<div class="ms-3 me-3 row rounded m-auto mt-3 mb-3" style="height: 640px">
	<div class="col-2 ms-0" style="background-color: black;">
		<div class="mt-4 text-center">
			<h2 class="text-light fw-bold">
			<i class="bi bi-kanban-fill"></i>
			Manage
			<i class="bi bi-kanban"></i>
			</h2>
		</div>
		<div class="mt-5 ms-2 me-2 row">
			<c:url var="users" value="/users"></c:url>
			<a href="${ users }/index" class="fs-6 btn btn-light col-12 fw-bold"><i class="bi bi-person-video2"></i> Users</a>
		</div>
		<div class="mt-2 ms-2 me-2 row">
			<c:url var="categories" value="/categories"></c:url>
			<a href="${ categories }/index" class="fs-6 btn btn-light col-12 fw-bold"><i class="bi bi-tags-fill"></i> Categories</a>
		</div>
		<div class="mt-2 ms-2 me-2 row">
			<c:url var="products" value="/products"></c:url>
			<a href="${ products }/index" class="fs-6 btn btn-light col-12 fw-bold"><i class="bi bi-boxes"></i> Products</a>
		</div>
		<div class="mt-2 ms-2 me-2 row">
			<c:url var="om" value="/om"></c:url>
			<a href="${ om }/index" class="fs-6 btn btn-light col-12 fw-bold"><i class="bi bi-border-style"></i> Order</a>
		</div>
	</div>
	
	<div class="col-10" style="background-color: white" >
	<div style="height: 552px">
		<table class="table align-middle mb-5 bg-white mt-3" >
			<thead class="table-dark">
				<tr>
					<th>Người Đặt</th>
					<th>Ngày Đặt</th>
					<th>Địa Chỉ Nhận Hàng</th>
					<th>Ghi Chú</th>
					<th>Tổng Tiền</th>
					<th>Trạng Thái</th>
					<th>Xác Nhận</th>
					<th>Hủy Đơn</th>
					<th>Chi Tiết</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ ds }" var="od">
					<tr>
						<td>${ od.user.hoTen }</td>
						<td><fmt:formatDate value="${ od.ngayDat }"
								pattern="dd/MM/yyyy hh:mm:ss" /></td>
						<td>${ od.diaChiNhanHang }</td>
						<td>${ od.ghiChu }</td>
						<td class="text-danger">${ od.tongTien }VNĐ</td>
						<td><span class="badge badge-warning rounded-pill d-inline">Chờ
								xác nhận</span></td>
						<td><a class="btn btn-primary btn-floating m-1 fs-4"
							style="background-color: #00CC00;" href="#!" role="button"
							data-mdb-toggle="modal"
							data-mdb-target="#modal_confirm_${ od.id }"><i
								class="bi bi-check-lg"></i></a>

							<div class="modal fade" id="modal_confirm_${ od.id }"
								tabindex="-1" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Cảnh Báo</h5>
											<button type="button" class="btn-close"
												data-mdb-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Bạn chắc chắn xác nhận đơn đặt
											hàng này?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-danger"
												data-mdb-dismiss="modal">No</button>
											<a class="btn btn-success"
												href="/PH17936_BuiQuangVu_SOF3011_ASM/om/confirm?id=${ od.id }">Yes</a>
										</div>
									</div>
								</div>
							</div></td>

						<td><a class="btn btn-primary btn-floating m-1 fs-4"
							style="background-color: #dd4b39;" href="#!" role="button" data-mdb-toggle="modal"
							data-mdb-target="#modal_cancel_${ od.id }"><i
								class="bi bi-x-lg"></i></a>
								
								<div class="modal fade" id="modal_cancel_${ od.id }"
								tabindex="-1" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Cảnh Báo</h5>
											<button type="button" class="btn-close"
												data-mdb-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Bạn chắc chắn hủy đơn đặt
											hàng này?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-danger"
												data-mdb-dismiss="modal">No</button>
											<a class="btn btn-success"
												href="/PH17936_BuiQuangVu_SOF3011_ASM/om/cancel?id=${ od.id }">Yes</a>
										</div>
									</div>
								</div>
							</div>
								</td>

						<td><a class="btn btn-primary btn-floating m-1 fs-4"
							style="background-color: #333333;" href="#!" role="button"><i
								class="bi bi-ticket-detailed-fill"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		
		<div class="col-12">
				<nav aria-label="...">
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link">Previous</a>
						</li>
						<c:forEach begin="1" end="${ sl }" var="i">
							<li class="page-item ${ i == in ? "
								active" : "" }" aria-current="page"><a class="page-link"
								href="/PH17936_BuiQuangVu_SOF3011_ASM/om/index?index=${ i }">${ i }
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

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
		<div style="height: 552px">
		<table class="table align-middle mb-5 bg-white mt-3">
			<thead class="table-dark">
				<tr>
					<th>Ngày Đặt</th>
					<th>Địa Chỉ Nhận Hàng</th>
					<th>Ghi Chú</th>
					<th>Tổng Tiền</th>
					<th>Trạng Thái</th>
					<th>Thao Tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ ds }" var="od">
					<tr>
						<td><fmt:formatDate value="${ od.ngayDat }"
								pattern="dd/MM/yyyy hh:mm:ss" /></td>
						<td>${ od.diaChiNhanHang }</td>
						<td>${ od.ghiChu }</td>
						<td class="text-danger">${ od.tongTien }VNĐ</td>
						<td><c:choose>
								<c:when test="${ od.trangThai == 1 }">
									<span class="badge badge-warning rounded-pill d-inline">Chờ
										xác nhận</span>
								</c:when>
								<c:when test="${ od.trangThai == 2 }">
									<span class="badge badge-success rounded-pill d-inline">Thành
										công</span>
								</c:when>
								<c:when test="${ od.trangThai == 3 }">
									<span class="badge badge-danger rounded-pill d-inline">Bị
										Hủy Từ Phía Người Bán</span>
								</c:when>
								<c:when test="${ od.trangThai == 4 }">
									<span class="badge badge-danger rounded-pill d-inline">Bị
										Hủy Từ Phía Người Mua</span>
								</c:when>
								<c:otherwise> - </c:otherwise>
							</c:choose></td>
						<td><a class="btn btn-success">Chi Tiết</a></td>
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
								href="/PH17936_BuiQuangVu_SOF3011_ASM/orderdetail/history?index=${ i }">${ i }
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
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

<div class="container row mark rounded hover-shadow m-auto mt-5 mb-5"
	style="background-color: white">
	<div class="d-flex align-items-start">
	  <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	    <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">Home</button>
	    <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">Profile</button>
	    <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Messages</button>
	    <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">Settings</button>
	  </div>
	  <div class="tab-content" id="v-pills-tabContent">
	    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
	    
	    
	    <div class="mt-2 mb-3">
			<c:url var="users" value="/users"></c:url>
			<a href="${ users }/create" class="btn btn-primary">Thêm Mới</a>
		</div>
		<div class="border border-light m-auto mb-5">
			<c:if test="${ empty ds }">
				<p class="alert alert-warning">Không có dữ liệu</p>
			</c:if>
	
			<c:if test="${ !empty ds }">
				<table class="table table-bordered table-striped mb-0">
					<thead class="table-dark">
						<th>Họ Tên</th>
						<th>Giới Tính</th>
						<th>Địa Chỉ</th>
						<th>Email</th>
						<th>SĐT</th>
						<th>Quyền</th>
						<th colspan="2" class="text-center">Thao Tác</th>
					</thead>
					<tbody>
						<c:forEach items="${ ds }" var="user">
							<tr>
								<td>${ user.hoTen }</td>
								<td><c:choose>
										<c:when test="${ user.gioiTinh == 0 }">Nam</c:when>
										<c:when test="${ user.gioiTinh == 1 }">Nữ</c:when>
										<c:otherwise> - </c:otherwise>
									</c:choose></td>
								<td>${ user.diaChi }</td>
								<td>${ user.email }</td>
								<td>${ user.sdt }</td>
								<td><c:choose>
										<c:when test="${ user.phanQuyen == 0 }">User</c:when>
										<c:when test="${ user.phanQuyen == 1 }">Admin</c:when>
										<c:otherwise> - </c:otherwise>
									</c:choose></td>
								<td><a class="btn btn-primary"
									href="/PH17936_BuiQuangVu_Lab5_300322/users/edit?id=${ user.id }">Cập
										nhật</a></td>
								<td><a class="btn btn-danger"
									
									data-mdb-toggle="modal" data-mdb-target="#exampleModal">Xóa</a>
									<div class="modal fade" id="exampleModal" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Cảnh Báo</h5>
													<button type="button" class="btn-close"
														data-mdb-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">Bạn có chắc chắn muốn xóa User này?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-danger"
														data-mdb-dismiss="modal">No</button>
													<a class="btn btn-success"
									href="/PH17936_BuiQuangVu_Lab5_300322/users/delete?id=${ user.id }">Yes</a>
												</div>
											</div>
										</div>
									</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	    
	    
	    </div>
	    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">...</div>
	    <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">...</div>
	    <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">...</div>
	  </div>
	</div>
</div>

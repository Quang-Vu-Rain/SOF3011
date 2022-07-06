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

<div class="ms-3 me-3 row rounded m-auto mt-3 mb-3 font-geneva"
	style="height: 640px">
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
	
	<div class="col-10" style="background-color: white">

		<div class="mt-2 mb-3">

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-success" data-mdb-toggle="modal"
				data-mdb-target="#exampleModal1">Thêm mới</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal1" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Thêm mới User</h5>
							<button type="button" class="btn-close" data-mdb-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<form method="POST"
								action="/PH17936_BuiQuangVu_SOF3011_ASM/users/store"
								name="frmLogin" id="frmLogin">
								<div class="row m-4">
									<div class="col-1 pt-2">
										<i class="fas fa-user prefix deep-orange-text"></i>
									</div>
									<div class="form-outline col-10 ms-3">
										<input type="text" id="email" name="email"
											class="form-control form-control-lg" /> <label
											class="form-label" for="email">User</label>
									</div>
									<div class="col-1"></div>
									<div class="col-10 ms-2"></div>
								</div>

								<div class="row m-4">
									<div class="col-1 pt-2">
										<i class="fas fa-user prefix deep-orange-text"></i>
									</div>
									<div class="form-outline col-10 ms-3">
										<input type="password" id="password" name="password"
											class="form-control form-control-lg" /> <label
											class="form-label" for="password">Password</label>
									</div>
									<div class="col-1"></div>
									<div class="col-10 ms-2"></div>
								</div>

								<div class="row m-4">
									<div class="col-1 pt-2">
										<i class="fas fa-user prefix deep-orange-text"></i>
									</div>
									<div class="form-outline col-10 ms-3">
										<input type="text" id="sdt" name="sdt"
											class="form-control form-control-lg" /> <label
											class="form-label" for="sdt">Số Điện Thoại</label>
									</div>
									<div class="col-1"></div>
									<div class="col-10 ms-2"></div>
								</div>

								<div class="row m-4">
									<div class="col-1 pt-2">
										<i class="fas fa-user prefix deep-orange-text"></i>
									</div>
									<div class="form-outline col-10 ms-3">
										<input type="text" id="hoTen" name="hoTen"
											class="form-control form-control-lg" /> <label
											class="form-label" for="hoTen">Họ Tên</label>
									</div>
									<div class="col-1"></div>
									<div class="col-10 ms-2"></div>
								</div>

								<div class="row m-4">
									<div class="col-1">
										<i class="fas fa-user prefix deep-orange-text"></i>
									</div>
									<div class="form-check ms-3 col-3">
										<input class="form-check-input" type="radio" name="gioiTinh"
											id="gioiTinh" value="0" checked /> <label
											class="form-check-label" for="gioiTinh"> Nam </label>
									</div>
									<div class="form-check ms-3 col-3">
										<input class="form-check-input" type="radio" name="gioiTinh"
											id="gioiTinh" value="1" /> <label class="form-check-label"
											for="gioiTinh"> Nữ </label>
									</div>
								</div>

								<div class="row m-4">
									<div class="col-1 pt-2">
										<i class="fas fa-user prefix deep-orange-text"></i>
									</div>
									<div class="form-outline col-10 ms-3">
										<input type="text" id="diaChi" name="diaChi"
											class="form-control form-control-lg" /> <label
											class="form-label" for="diaChi">Địa Chỉ</label>
									</div>
									<div class="col-1"></div>
									<div class="col-10 ms-2"></div>
								</div>

								<div class="row m-4">
									<div class="col-1">
										<i class="fas fa-user prefix deep-orange-text"></i>
									</div>
									<div class="form-check ms-3 col-3">
										<input class="form-check-input" type="radio" name="phanQuyen"
											id="phanQuyen" value="0" checked /> <label
											class="form-check-label" for="phanQuyen"> User </label>
									</div>
									<div class="form-check ms-3 col-3">
										<input class="form-check-input" type="radio" name="phanQuyen"
											id="phanQuyen" value="1" /> <label class="form-check-label"
											for="phanQuyen"> Admin </label>
									</div>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-mdb-dismiss="modal">Hủy</button>
									<button type="submit" class="btn btn-success">Thêm</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>


		</div>
		<div class="border border-light m-auto mb-5" style="height: 460px">
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
								<td>

									<button type="button" class="btn btn-primary"
										data-mdb-toggle="modal"
										data-mdb-target="#modal_update_${ user.id }"><i class="bi bi-pencil-square"></i>
									</button> <!-- Modal -->
									<div class="modal fade" id="modal_update_${ user.id }"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Cập
														nhật User</h5>
													<button type="button" class="btn-close"
														data-mdb-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<form method="POST"
														action="/PH17936_BuiQuangVu_SOF3011_ASM/users/update?id=${ user.id }"
														name="frmLogin" id="frmLogin">
														<div class="row m-4">
															<div class="col-1 pt-2">
																<i class="fas fa-user prefix deep-orange-text"></i>
															</div>
															<div class="form-outline col-10 ms-3">
																<input type="text" id="email" name="email"
																	class="form-control form-control-lg"
																	value="${ user.email }" /> <label class="form-label"
																	for="email">User</label>
															</div>
															<div class="col-1"></div>
															<div class="col-10 ms-2"></div>
														</div>

														<div class="row m-4">
															<div class="col-1 pt-2">
																<i class="fas fa-user prefix deep-orange-text"></i>
															</div>
															<div class="form-outline col-10 ms-3">
																<input type="text" id="sdt" name="sdt"
																	class="form-control form-control-lg"
																	value="${ user.sdt }" /> <label class="form-label"
																	for="sdt">Số Điện Thoại</label>
															</div>
															<div class="col-1"></div>
															<div class="col-10 ms-2"></div>
														</div>

														<div class="row m-4">
															<div class="col-1 pt-2">
																<i class="fas fa-user prefix deep-orange-text"></i>
															</div>
															<div class="form-outline col-10 ms-3">
																<input type="text" id="hoTen" name="hoTen"
																	class="form-control form-control-lg"
																	value="${ user.hoTen }" /> <label class="form-label"
																	for="hoTen">Họ Tên</label>
															</div>
															<div class="col-1"></div>
															<div class="col-10 ms-2"></div>
														</div>

														<div class="row m-4">
															<div class="col-1">
																<i class="fas fa-user prefix deep-orange-text"></i>
															</div>
															<div class="form-check ms-3 col-3">
																<input class="form-check-input" type="radio"
																	name="gioiTinh" id="gioiTinh" value="0"
																	${ user.gioiTinh == 0 ? "checked" : "" } /> <label
																	class="form-check-label" for="gioiTinh"> Nam </label>
															</div>
															<div class="form-check ms-3 col-3">
																<input class="form-check-input" type="radio"
																	name="gioiTinh" id="gioiTinh" value="1"
																	${ user.gioiTinh == 1 ? "checked" : "" } /> <label
																	class="form-check-label" for="gioiTinh"> Nữ </label>
															</div>
														</div>

														<div class="row m-4">
															<div class="col-1 pt-2">
																<i class="fas fa-user prefix deep-orange-text"></i>
															</div>
															<div class="form-outline col-10 ms-3">
																<input type="text" id="diaChi" name="diaChi"
																	class="form-control form-control-lg"
																	value="${ user.diaChi }" /> <label class="form-label"
																	for="diaChi">Địa Chỉ</label>
															</div>
															<div class="col-1"></div>
															<div class="col-10 ms-2"></div>
														</div>

														<div class="row m-4">
															<div class="col-1">
																<i class="fas fa-user prefix deep-orange-text"></i>
															</div>
															<div class="form-check ms-3 col-3">
																<input class="form-check-input" type="radio"
																	name="phanQuyen" id="phanQuyen" value="0"
																	${ user.phanQuyen == 0 ? "checked" : "" } /> <label
																	class="form-check-label" for="gioiTinh"> User </label>
															</div>
															<div class="form-check ms-3 col-3">
																<input class="form-check-input" type="radio"
																	name="phanQuyen" id="phanQuyen" value="1"
																	${ user.phanQuyen == 1 ? "checked" : "" } /> <label
																	class="form-check-label" for="gioiTinh"> Admin
																</label>
															</div>
														</div>

														<div class="modal-footer">
															<button type="button" class="btn btn-danger"
																data-mdb-dismiss="modal">Hủy</button>
															<button type="submit" class="btn btn-success">Cập
																nhật</button>
														</div>
													</form>
												</div>

											</div>
										</div>
									</div>

								</td>
								<td><a class="btn btn-danger" data-mdb-toggle="modal"
									data-mdb-target="#modal_delete_${ user.id }"><i class="bi bi-trash2-fill"></i></a>
									<div class="modal fade" id="modal_delete_${ user.id }"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Cảnh
														Báo</h5>
													<button type="button" class="btn-close"
														data-mdb-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">Bạn có chắc chắn muốn xóa User
													này?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-danger"
														data-mdb-dismiss="modal">No</button>
													<a class="btn btn-success"
														href="/PH17936_BuiQuangVu_SOF3011_ASM/users/delete?id=${ user.id }">Yes</a>
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
	
		<div class="col-12">
				<nav aria-label="...">
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link">Previous</a>
						</li>
						<c:forEach begin="1" end="${ sl }" var="i">
							<li class="page-item ${ i == in ? "
								active" : "" }" aria-current="page"><a class="page-link"
								href="/PH17936_BuiQuangVu_SOF3011_ASM/users/index?index=${ i }">${ i }
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

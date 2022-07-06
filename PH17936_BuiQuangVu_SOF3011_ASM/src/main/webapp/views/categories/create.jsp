<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<div class="container">
	<div
		class="col-6 border border-light row mark rounded hover-shadow m-auto mt-5 mb-5"
		style="background-color: white">
		<div class="mt-3 fw-bold">
			<h2>Thêm Category</h2>
		</div>
		<hr>
		<form method="POST"
			action="/PH17936_BuiQuangVu_Lab5_300322/categories/store">
			<div class="mb-3">
				<label class="form-label fw-bold">Tên Category</label> <input
					type="text" name="ten" class="form-control">
			</div>

			<div class="mb-3">
				<select class="form-select" aria-label="Default select example"
					name="user_id">
					<c:forEach items="${ dsUser }" var="user">
						<option value="${ user.id }">${ user.hoTen }</option>
					</c:forEach>
				</select>
			</div>

			<div class="mb-5">
				<button type="submit" class="btn btn-primary fw-bold">Thêm</button>
			</div>
		</form>
	</div>
</div>
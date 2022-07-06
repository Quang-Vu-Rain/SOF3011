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

<div class="container" >
	<div class="col-6 border border-light row mark rounded hover-shadow m-auto mt-5 mb-5" style="background-color: white">
		<div class="mt-3 fw-bold">
			<h2>Sửa User</h2>
		</div>
		<hr>
		<form method="POST" action="/PH17936_BuiQuangVu_Lab5_300322/users/update?id=${ user.id }">
			<div class="mb-3">
				<label class="form-label fw-bold">Họ Tên</label>
				<input type="text" name="hoTen" class="form-control" value="${ user.hoTen }">
			</div>
			
			<div class="mb-3">
				<label class="form-label fw-bold">Giới Tính</label>
				<div>
					<input class="form-check-input" type="radio" name="gioiTinh" value="1" ${ user.gioiTinh == 1 ? "checked" : "" }>
					<label class="form-check-label fw-bold">Nam</label>
					<input class="form-check-input" type="radio" name="gioiTinh" value="0" ${ user.gioiTinh == 0 ? "checked" : "" }>
					<label class="form-check-label fw-bold">Nữ</label>
				</div>
			</div>
			
			<div class="mb-3">
				<label class="form-label fw-bold">Địa Chỉ</label>
				<input type="text" name="diaChi" class="form-control" value="${ user.diaChi }">
			</div>
			
			<div class="mb-3">
				<label class="form-label fw-bold">Email</label>
				<input type="email" name="email" class="form-control" value="${ user.email }">
			</div>
			
			<div class="mb-3">
				<label class="form-label fw-bold">SĐT</label>
				<input type="text" name="sdt" class="form-control" value="${ user.sdt }">
			</div>

			<div class="mb-5">
				<button type="submit" class="btn btn-primary fw-bold">Sửa</button>
			</div>
		</form>
	</div>
</div>
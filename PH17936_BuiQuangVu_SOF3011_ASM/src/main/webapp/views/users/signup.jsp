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
	<div class="col-lg-4 m-auto pt-5 pb-5">
        <form method="POST" action="/PH17936_BuiQuangVu_SOF3011_ASM/manage/signupP" class="mark rounded hover-shadow" style="background-color: white" name="frmLogin" id="frmLogin">
            <div class="fs-1 text fw-bold text-center bg-info text-white rounded">Đăng Ký</div>
            <div class="row m-4">
                <div class="col-1 pt-2"><i class="fas fa-user prefix deep-orange-text"></i></div>
                <div class="form-outline col-10 ms-3">
				  <input type="text" id="user" name="email" class="form-control form-control-lg" />
				  <label class="form-label" for="user">User</label>
				</div>
				<div class="col-1"></div>
                <div class="col-10 ms-2">
                </div>
            </div>

            <div class="row m-4">
                <div class="col-1 pt-2"><i class="fas fa-user prefix deep-orange-text"></i></div>
                <div class="form-outline col-10 ms-3">
				  <input type="password" id="password" name="password" class="form-control form-control-lg" />
				  <label class="form-label" for="password">Password</label>
				</div>
				<div class="col-1"></div>
                <div class="col-10 ms-2">

                </div>
            </div>
			
			<div class="row m-4">
                <div class="col-1 pt-2"><i class="fas fa-user prefix deep-orange-text"></i></div>
                <div class="form-outline col-10 ms-3">
				  <input type="text" id="sdt" name="sdt" class="form-control form-control-lg" />
				  <label class="form-label" for="sdt">Số Điện Thoại</label>
				</div>
				<div class="col-1"></div>
                <div class="col-10 ms-2">

                </div>
            </div>
			
			<div class="row m-4">
                <div class="col-1 pt-2"><i class="fas fa-user prefix deep-orange-text"></i></div>
                <div class="form-outline col-10 ms-3">
				  <input type="text" id="hoTen" name="hoTen" class="form-control form-control-lg" />
				  <label class="form-label" for="hoTen">Họ Tên</label>
				</div>
				<div class="col-1"></div>
                <div class="col-10 ms-2">

                </div>
            </div>
            
            <div class="row m-4">
                <div class="col-1 pt-2"><i class="fas fa-user prefix deep-orange-text"></i></div>
                <div class="form-check ms-3 col-4">
				  <input class="form-check-input" type="radio" name="gioiTinh" id="gioiTinh" value="0" checked/>
				  <label class="form-check-label" for="gioiTinh"> Nam </label>
				</div>
				<div class="form-check ms-3 col-4">
				  <input class="form-check-input" type="radio" name="gioiTinh" id="gioiTinh" value="1"/>
				  <label class="form-check-label" for="gioiTinh"> Nữ </label>
				</div>
            </div>
			
			<div class="row m-4">
                <div class="col-1 pt-2"><i class="fas fa-user prefix deep-orange-text"></i></div>
                <div class="form-outline col-10 ms-3">
				  <input type="text" id="diaChi" name="diaChi" class="form-control form-control-lg" />
				  <label class="form-label" for="diaChi">Địa Chỉ</label>
				</div>
				<div class="col-1"></div>
                <div class="col-10 ms-2">

                </div>
            </div>
			
			<div>
            	<button type="submit" class="fs-5 btn btn-info btn-block mb-4">Sign up</button>
            </div>
			
        </form>
    </div>
</div>
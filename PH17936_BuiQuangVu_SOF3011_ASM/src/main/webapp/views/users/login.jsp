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
        <form method="POST" action="/PH17936_BuiQuangVu_SOF3011_ASM/manage/loginP" class="mark rounded hover-shadow" 
        style="background-color: white" name="frmLogin" id="frmLogin">
            <div class="fs-1 text fw-bold text-center bg-info text-white rounded">Đăng nhập</div>
            <div class="row m-4">
                <div class="col-1 pt-2"><i class="fas fa-user prefix deep-orange-text"></i></div>
                <div class="form-outline col-10 ms-3">
				  <input type="text" id="user" name="email" class="form-control form-control-lg" value="${ user.email }"/>
				  <label class="form-label" for="user">User</label>
				</div>
				<div class="col-1"></div>
                <div class="col-10 ms-2">

                </div>
            </div>

            <div class="row m-4">
                <div class="col-1 pt-2"><i class="fas fa-user prefix deep-orange-text"></i></div>
                <div class="form-outline col-10 ms-3">
				  <input type="password" id="password" name="password" class="form-control form-control-lg" value="${ user.password }"/>
				  <label class="form-label" for="password">Password</label>
				</div>
				<div class="col-1"></div>
                <div class="col-10 ms-2">

                </div>
            </div>

            <div class="row mb-4">
                <div class="col d-flex justify-content-center">

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="form2Example34" checked />
                        <label class="form-check-label" for="form2Example34"> Remember me </label>
                    </div>
                </div>

                <div class="col">

                    <a href="#!">Forgot password?</a>
                </div>
            </div>

            <div>
            	<button type="submit" class="fs-5 btn btn-info btn-block mb-4">Sign in</button>
            </div>

            <div class="text-center mb-3">
				<c:url var="manage" value="/manage"></c:url>
                <p>Not a member? <a href="${ manage }/signupG">Register</a></p>
                <p>or sign up with:</p>
                <button type="button" class="btn btn-primary btn-floating mx-1" style="background-color: #3b5998;">
                    <i class="fab fa-facebook-f"></i>
                </button>

                <button type="button" class="btn btn-primary btn-floating mx-1" style="background-color: #dd4b39;">
                    <i class="fab fa-google"></i>
                </button>

                <button type="button" class="btn btn-primary btn-floating mx-1" style="background-color: #0082ca;">
                    <i class="fab fa-twitter"></i>
                </button>

                <button type="button" class="btn btn-primary btn-floating mx-1" style="background-color: #333333;">
                    <i class="fab fa-github"></i>
                </button>
            </div>
        </form>
    </div>
</div>
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import entities.User;
import utils.EncryptUtil;

@WebServlet({ "/manage/loginG", "/manage/signupG", "/manage/loginP", "/manage/logoutG", "/manage/signupP",
		"/manage/admin" })
public class Manage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

	public Manage() {
		super();
		this.userDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("loginG")) {
			this.loginG(request, response);
		} else if (uri.contains("signupG")) {
			this.signupG(request, response);
		} else if (uri.contains("logoutG")) {
			this.logoutG(request, response);
		} else if (uri.contains("admin")) {
			this.admin(request, response);
		} else {
			// 404
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("loginP")) {
			this.loginP(request, response);
		} else if (uri.contains("signupP")) {
			this.signupP(request, response);
		} else {
			// 404
		}
	}

	private void loginG(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("view", "/views/users/login.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void signupG(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("view", "/views/users/signup.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void signupP(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			String encrypted = EncryptUtil.encrypt(request.getParameter("password"));
			user.setPassword(encrypted);
			user.setPhanQuyen(0);
			user.setTrangThai(0);
			this.userDAO.create(user);
			System.out.println("Success");
//			session.setAttribute("message", "Thêm mới thành công!");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/manage/loginG");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Fail");
//			session.setAttribute("error", "Thêm mới thất bại!");
//			response.sendRedirect("/PH17936_BuiQuangVu_Lab5_300322/users/create");
		}
	}

	private void loginP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = request.getParameter("email"), pwd = request.getParameter("password");

		User user = this.userDAO.findByEmail(email);
		boolean check = EncryptUtil.check(pwd, user.getPassword());
		if (check == true) {
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/home/index?index=1");
			session.setAttribute("user", user);
			System.out.println("Success");
		} else {
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/manage/loginG");
			System.out.println("Fail");
		}
	}

	private void logoutG(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/home/index?index=1");
	}
	private void admin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("view", "/views/users/admin.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}
}

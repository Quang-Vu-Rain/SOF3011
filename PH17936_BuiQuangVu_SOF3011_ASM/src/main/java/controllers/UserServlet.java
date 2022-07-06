package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import entities.Product;
import entities.User;
import utils.EncryptUtil;

@WebServlet({ "/users/index", "/users/create", "/users/store", "/users/edit", "/users/update", "/users/delete",
		"/users/show", })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	public UserServlet() {
		super();
		this.userDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("create")) {
			this.create(request, response);
		} else if (uri.contains("edit")) {
			this.edit(request, response);
		} else if (uri.contains("show")) {
			this.show(request, response);
		} else if (uri.contains("delete")) {
			this.delete(request, response);
		} else {
			// 404
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("store")) {
			this.store(request, response);
		} else if (uri.contains("update")) {
			this.update(request, response);
		} else {
			// 404
		}
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> ds;
		int index = 1;
		if (request.getParameter("index") == null) {
			ds = userDAO.list(0);
		} else {
			index = Integer.parseInt(request.getParameter("index"));
			int start = (index - 1) * 6;
			ds = userDAO.list(start);
			System.out.println("Trang: " + start);
		}
		List<User> ds1 = userDAO.all();
		int sl;
		if (ds1.size() % 6 == 0) {
			sl = ds1.size() / 6;
		} else {
			sl = ds1.size() / 6 + 1;
		}
		request.setAttribute("ds", ds);
		request.setAttribute("sl", sl);
		request.setAttribute("in", index);
		request.setAttribute("view", "/views/users/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		System.out.println(idStr);
		try {
			int id = Integer.parseInt(idStr);
			User entity = this.userDAO.findById(id);
			this.userDAO.delete(entity);
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/users/index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/users/index");
		}
	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			String encrypted = EncryptUtil.encrypt(request.getParameter("password"));
			user.setPassword(encrypted);
			this.userDAO.create(user);
			System.out.println("Success");
			String uri = request.getRequestURI();
//			session.setAttribute("message", "Thêm mới thành công!");
			List<User> ds1 = userDAO.all();
			int sl;
			if (ds1.size() % 6 == 0) {
				sl = ds1.size() / 6;
			} else {
				sl = ds1.size() / 6 + 1;
			}
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/users/index?index=" + sl);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Fail");
//			session.setAttribute("error", "Thêm mới thất bại!");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/users/index");
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		try {
			int id = Integer.parseInt(idStr);
			User oldValue = this.userDAO.findById(id);
			User newValue = new User();
			BeanUtils.populate(newValue, request.getParameterMap());
			newValue.setPassword(oldValue.getPassword());
			this.userDAO.update(newValue);
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/users/index");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

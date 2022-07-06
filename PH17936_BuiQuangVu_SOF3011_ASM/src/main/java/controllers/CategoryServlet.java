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

import dao.CategoryDAO;
import dao.UserDAO;
import entities.Category;
import entities.User;
import utils.EncryptUtil;

@WebServlet({ "/categories/index", "/categories/create", "/categories/store", "/categories/edit", "/categories/update",
		"/categories/delete", "/categories/show", })
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO cateDAO;
	public CategoryServlet() {
		super();
		this.cateDAO = new CategoryDAO();
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
		List<Category> ds;
		int index = 1;
		if (request.getParameter("index") == null) {
			ds = cateDAO.list1(0);
		} else {
			index = Integer.parseInt(request.getParameter("index"));
			int start = (index - 1) * 6;
			ds = cateDAO.list1(start);
			System.out.println("Trang: " + start);
		}
		List<Category> ds1 = cateDAO.all();
		int sl;
		if (ds1.size() % 6 == 0) {
			sl = ds1.size() / 6;
		} else {
			sl = ds1.size() / 6 + 1;
		}
		request.setAttribute("ds", ds);
		request.setAttribute("sl", sl);
		request.setAttribute("in", index);
		request.setAttribute("view", "/views/categories/index.jsp");
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
		try {
			int id = Integer.parseInt(idStr);
			Category cate = this.cateDAO.findById(id);
			this.cateDAO.delete(cate);
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/categories/index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/categories/index");
		}
	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			Category cate = new Category();
			BeanUtils.populate(cate, request.getParameterMap());
			User u = (User) session.getAttribute("user");
			cate.setUser(u);
			cate.setTrangThai(0);
			this.cateDAO.create(cate);
			System.out.println("Success");
			String uri = request.getRequestURI();
//			session.setAttribute("message", "Thêm mới thành công!");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/categories/index");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Fail");
//			session.setAttribute("error", "Thêm mới thất bại!");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/categories/index");
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String idStr = request.getParameter("id");
		int cateId = Integer.parseInt(request.getParameter("id"));
		Category cate1 = cateDAO.findById(cateId);
		try {
			Category cate = new Category();
			BeanUtils.populate(cate, request.getParameterMap());
			cate.setUser(cate1.getUser());
			cate.setTrangThai(cate1.getTrangThai());
			this.cateDAO.update(cate);
			System.out.println("Success");
//			session.setAttribute("message", "Thêm mới thành công!");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/categories/index");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Fail");
//			session.setAttribute("error", "Thêm mới thất bại!");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/categories/index");
		}
	}
}

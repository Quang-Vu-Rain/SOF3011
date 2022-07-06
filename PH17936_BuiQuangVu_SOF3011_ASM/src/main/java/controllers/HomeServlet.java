package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderKhDAO;
import dao.CategoryDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import entities.Category;
import entities.OrderDetail;
import entities.OrderKh;
import entities.Product;
import entities.User;

@WebServlet({ "/home/index", "/home/detail", "/home/category" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO proDAO;
	private OrderDetailDAO orderdetailDAO;
	private OrderKhDAO orderDAO;
	private CategoryDAO ctDAO;

	public HomeServlet() {
		super();
		this.proDAO = new ProductDAO();
		this.orderdetailDAO = new OrderDetailDAO();
		this.orderDAO = new OrderKhDAO();
		this.ctDAO = new CategoryDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("detail")) {
			this.detail(request, response);
		} else if (uri.contains("category")) {
			this.category(request, response);
		} else {
			// 404
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		
//		List<Product> ds1 = proDAO.all();
//		int sl;
//		if (ds1.size() % 10 == 0) {
//			sl = ds.size() / 10;
//		} else {
//			sl = ds.size() / 10 + 1;
//		}
//		
//		request.setAttribute("sl", sl);
//		request.setAttribute("ds", ds);
//		request.setAttribute("view", "/views/home.jsp");
//		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int mh = 0;
		if (session.getAttribute("user") != null) {
			User u = (User) session.getAttribute("user");
			System.out.println(orderDAO.findByUserID(u.getId()));
			if (orderDAO.findByUserID(u.getId()) == null) {
				try {
					OrderKh orderkh = new OrderKh();
					orderkh.setUser(u);
					orderkh.setTrangThai(0);
					this.orderDAO.create(orderkh);
					System.out.println("Success");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Fail");
				}
			}
			if (orderdetailDAO.findByOrderID(orderDAO.findByUserID(u.getId()).getId()) != null) {
				System.out.println(orderDAO.findByUserID(u.getId()));
				List<OrderDetail> list_orderdetail = orderdetailDAO
						.findByOrderID(orderDAO.findByUserID(u.getId()).getId());
				System.out.println("Số món hàng: " + list_orderdetail.size());
				mh = list_orderdetail.size();
			}
		} else {

		}
		List<Category> ct;
		List<Product> ds;
		int index = 1;
		int ctindex = 1;
		System.out.println(request.getParameter("index"));
		if (request.getParameter("index") == null) {
			ds = proDAO.list(0);
		} else {
			index = Integer.parseInt(request.getParameter("index"));
			int start = (index - 1) * 18;
			ds = proDAO.list(start);
			System.out.println("Trang: " + start);
		}

		if (request.getParameter("ctindex") == null) {
			ct = ctDAO.list(0);
		} else {
			ctindex = Integer.parseInt(request.getParameter("ctindex"));
			int start = (ctindex - 1) * 12;
			ct = ctDAO.list(start);
		}

		List<Product> ds1 = proDAO.all();
		int sl;
		if (ds1.size() % 18 == 0) {
			sl = ds1.size() / 18;
		} else {
			sl = ds1.size() / 18 + 1;
		}
		session.setAttribute("mh", mh);
		request.setAttribute("in", index);
		request.setAttribute("sl", sl);
		request.setAttribute("ds", ds);
		request.setAttribute("ct", ct);
		request.setAttribute("view", "/views/home.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void category(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int mh = 0;
		if (session.getAttribute("user") != null) {
			User u = (User) session.getAttribute("user");
			System.out.println(orderDAO.findByUserID(u.getId()));
			if (orderDAO.findByUserID(u.getId()) == null) {
				try {
					OrderKh orderkh = new OrderKh();
					orderkh.setUser(u);
					orderkh.setTrangThai(0);
					this.orderDAO.create(orderkh);
					System.out.println("Success");
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Fail");
				}
			}
			if (orderdetailDAO.findByOrderID(orderDAO.findByUserID(u.getId()).getId()) != null) {
				System.out.println(orderDAO.findByUserID(u.getId()));
				List<OrderDetail> list_orderdetail = orderdetailDAO
						.findByOrderID(orderDAO.findByUserID(u.getId()).getId());
				System.out.println("Số món hàng: " + list_orderdetail.size());
				mh = list_orderdetail.size();
			}
		} else {

		}
		List<Product> ds;
		int index = 1;
		int idCate = Integer.parseInt(request.getParameter("id"));
		Category category = ctDAO.findById(idCate);
		System.out.println(idCate);
		if (request.getParameter("index") == null) {
			ds = proDAO.listCategory(0, idCate);
		} else {
			index = Integer.parseInt(request.getParameter("index"));
			int start = (index - 1) * 18;
			ds = proDAO.listCategory(start, idCate);
			System.out.println("Trang: " + start);
		}

		List<Product> ds1 = proDAO.listCategoryAll(idCate);
		int sl;
		if (ds1.size() % 18 == 0) {
			sl = ds1.size() / 18;
		} else {
			sl = ds1.size() / 18 + 1;
		}
		session.setAttribute("mh", mh);
		request.setAttribute("in", index);
		request.setAttribute("sl", sl);
		request.setAttribute("ds", ds);
		request.setAttribute("id", idCate);
		request.setAttribute("tenDanhMuc", category.getTen());
		request.setAttribute("view", "/views/category.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product pro = proDAO.findById(Integer.valueOf(request.getParameter("id")));
		request.setAttribute("pro", pro);
		request.setAttribute("view", "/views/detail.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}
}

package controllers;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import dao.OrderDetailDAO;
import dao.OrderKhDAO;
import dao.ProductDAO;
import dao.UserDAO;
import entities.OrderDetail;
import entities.OrderKh;
import entities.Product;
import entities.User;

@WebServlet({ "/orderdetail/index", "/orderdetail/inc", "/orderdetail/dec", "/orderdetail/payment",
		"/orderdetail/history", "/orderdetail/order" })
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDetailDAO orderdetailDAO;
	private UserDAO userDAO;
	private OrderKhDAO orderDAO;
	private ProductDAO proDAO;

	public OrderDetailServlet() {
		super();
		this.orderdetailDAO = new OrderDetailDAO();
		this.userDAO = new UserDAO();
		this.orderDAO = new OrderKhDAO();
		this.proDAO = new ProductDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("dec")) {
			this.dec(request, response);
		} else if (uri.contains("inc")) {
			this.inc(request, response);
		} else if (uri.contains("history")) {
			this.history(request, response);
		} else if (uri.contains("order")) {
			this.order(request, response);
		} else {
			// 404
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("payment")) {
			this.payment(request, response);
		} else {
			// 404
		}
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		List<OrderDetail> ds = orderdetailDAO.listDetail(u.getId());
		int tongTien = 0;
		for (OrderDetail od : ds) {
			tongTien = tongTien + od.getSoLuong() * od.getProduct().getGia();
		}
		request.setAttribute("ds", ds);
		request.setAttribute("tongTien", tongTien);
		request.setAttribute("view", "/views/orderdetail/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void inc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDetail od = orderdetailDAO.findById(Integer.valueOf(request.getParameter("id")));
		int soLuong = Integer.valueOf(request.getParameter("in"));
		try {
			soLuong = soLuong + 1;
			System.out.print(soLuong);
			od.setSoLuong(soLuong);
			orderdetailDAO.update(od);
			System.out.println("Success");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/orderdetail/index");
		} catch (Exception e) {
			System.out.println("Fail");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/orderdetail/index");
		}
	}

	private void dec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDetail od = orderdetailDAO.findById(Integer.valueOf(request.getParameter("id")));
		int soLuong = Integer.valueOf(request.getParameter("in"));
		try {
			soLuong = soLuong - 1;
			System.out.print(soLuong);
			od.setSoLuong(soLuong);
			orderdetailDAO.update(od);
			System.out.println("Success");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/orderdetail/index");
		} catch (Exception e) {
			System.out.println("Fail");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/orderdetail/index");
		}
	}

	private void history(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		List<OrderKh> ds;
		int index = 1;
		if (request.getParameter("index") == null) {
			ds = orderDAO.findByUserIDAll(0, u.getId());
		} else {
			index = Integer.parseInt(request.getParameter("index"));
			int start = (index - 1) * 6;
			ds = orderDAO.findByUserIDAll(start, u.getId());
			System.out.println("Trang: " + start);
		}
		List<OrderKh> ds1 = orderDAO.findByUserIDAll1(u.getId());
		int sl;
		if (ds1.size() % 6 == 0) {
			sl = ds1.size() / 6;
		} else {
			sl = ds1.size() / 6 + 1;
		}
		request.setAttribute("ds", ds);
		request.setAttribute("sl", sl);
		request.setAttribute("in", index);
		request.setAttribute("view", "/views/orderdetail/history.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void payment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		OrderKh odnew = orderDAO.findByUserID(u.getId());
		try {
			BeanUtils.populate(odnew, request.getParameterMap());
//			OrderKh od = new OrderKh();
//			od.setNgayDat(new Date());
//			System.out.print(od.getNgayDat());
			odnew.setNgayDat(new Date());
			odnew.setTrangThai(1);
			List<OrderDetail> ds = orderdetailDAO.listDetail(u.getId());
			int tongTien = 0;
			for (OrderDetail od : ds) {
				tongTien = tongTien + od.getSoLuong() * od.getProduct().getGia();
			}
			odnew.setTongTien(tongTien);
			orderDAO.update(odnew);
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
			System.out.println("Success");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/orderdetail/history");
		} catch (Exception e) {
			System.out.println("Fail");
			e.printStackTrace();
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/orderdetail/index");
		}
	}

	private void order(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		OrderKh od = orderDAO.findByUserID(u.getId());
		Product pro = proDAO.findById(Integer.valueOf(request.getParameter("id")));
		try {
			OrderDetail odt = new OrderDetail();
			odt.setOrderKh(od);
			odt.setProduct(pro);
			odt.setSoLuong(1);
			odt.setTrangThai(0);
			orderdetailDAO.create(odt);
			System.out.println("Success");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/orderdetail/index");
		} catch (Exception e) {
			System.out.println("Fail");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/orderdetail/index");
		}
	}
}

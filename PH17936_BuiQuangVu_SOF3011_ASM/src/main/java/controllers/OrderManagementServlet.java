package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDetailDAO;
import dao.OrderKhDAO;
import entities.OrderDetail;
import entities.OrderKh;
import entities.User;

@WebServlet({ "/om/index", "/om/confirm", "/om/cancel" })
public class OrderManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDetailDAO orderdetailDAO;
	private OrderKhDAO orderDAO;

	public OrderManagementServlet() {
		super();
		this.orderdetailDAO = new OrderDetailDAO();
		this.orderDAO = new OrderKhDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("index")) {
			this.index(request, response);
		} else if (uri.contains("cancel")) {
			this.cancel(request, response);
		} else if (uri.contains("confirm")) {
			this.confirm(request, response);
		} else {
			// 404
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<OrderKh> ds;
		int index = 1;
		if (request.getParameter("index") == null) {
			ds = orderDAO.list(0);
		} else {
			index = Integer.parseInt(request.getParameter("index"));
			int start = (index - 1) * 6;
			ds = orderDAO.list(start);
			System.out.println("Trang: " + start);
		}
		List<OrderKh> ds1 = orderDAO.all();
		int sl;
		if (ds1.size() % 6 == 0) {
			sl = ds1.size() / 6;
		} else {
			sl = ds1.size() / 6 + 1;
		}
		request.setAttribute("ds", ds);
		request.setAttribute("sl", sl);
		request.setAttribute("in", index);
		request.setAttribute("view", "/views/ordermanagement/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void confirm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int idOd = Integer.parseInt(request.getParameter("id"));
			OrderKh od = orderDAO.findById(idOd);
			od.setTrangThai(2);
			orderDAO.update(od);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<OrderKh> ds = orderDAO.allOrderList();
		request.setAttribute("ds", ds);
		request.setAttribute("view", "/views/ordermanagement/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void cancel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int idOd = Integer.parseInt(request.getParameter("id"));
			OrderKh od = orderDAO.findById(idOd);
			od.setTrangThai(3);
			orderDAO.update(od);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<OrderKh> ds = orderDAO.allOrderList();
		request.setAttribute("ds", ds);
		request.setAttribute("view", "/views/ordermanagement/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}
}

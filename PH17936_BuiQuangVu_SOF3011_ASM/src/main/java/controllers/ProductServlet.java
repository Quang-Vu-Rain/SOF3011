package controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import dao.CategoryDAO;
import dao.ProductDAO;
import entities.Category;
import entities.Product;
import entities.User;
import utils.EncryptUtil;

@MultipartConfig
@WebServlet({ "/products/index", "/products/create", "/products/store", "/products/edit", "/products/update",
		"/products/delete", "/products/show", })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO proDAO;
	private CategoryDAO cateDAO;

	public ProductServlet() {
		super();
		this.proDAO = new ProductDAO();
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
		List<Product> ds;
		int index = 1;
		if (request.getParameter("index") == null) {
			ds = proDAO.list1(0);
		} else {
			index = Integer.parseInt(request.getParameter("index"));
			int start = (index - 1) * 6;
			ds = proDAO.list1(start);
			System.out.println("Trang: " + start);
		}
		List<Product> ds1 = proDAO.all();
		int sl;
		if (ds1.size() % 6 == 0) {
			sl = ds1.size() / 6;
		} else {
			sl = ds1.size() / 6 + 1;
		}
		request.setAttribute("ds", ds);
		request.setAttribute("sl", sl);
		request.setAttribute("in", index);
		List<Category> dsCate = cateDAO.all();
		request.setAttribute("dsCate", dsCate);
		request.setAttribute("view", "/views/products/index.jsp");
		request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	private void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int cateID = Integer.parseInt(request.getParameter("categories_id"));
		Category cate = this.cateDAO.findById(cateID);
		try {
			Product pro = new Product();
			BeanUtils.populate(pro, request.getParameterMap());

			String uploadFolder = request.getServletContext().getRealPath("/images");
			Path uploadPath = Paths.get(uploadFolder);
			if (!Files.exists(uploadPath)) {
				Files.createDirectory(uploadPath);
			}
			Part imagePart = request.getPart("image");
			String imageFilename = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
			System.out.println("Fail");
			imagePart.write(Paths.get(uploadPath.toString(), imageFilename).toString());
			System.out.println(uploadFolder);
//			Part part = request.getPart("image");
//			String realPath = request.getServletContext().getRealPath("/images");
//			String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
//			part.write(realPath + "/" + filename); 
//			System.out.println(realPath + "/" + filename);
			pro.setCategory(cate);
			pro.setAnh(imageFilename);
			this.proDAO.create(pro);
			System.out.println("Success");
//			session.setAttribute("message", "Thêm mới thành công!");
			List<Product> ds1 = proDAO.all();
			int sl;
			if (ds1.size() % 6 == 0) {
				sl = ds1.size() / 6;
			} else {
				sl = ds1.size() / 6 + 1;
			}
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/products/index?index=" + sl);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Fail");
//			session.setAttribute("error", "Thêm mới thất bại!");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/products/index");
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String idStr = request.getParameter("id");
		int cateID = Integer.parseInt(request.getParameter("categories_id"));
		Category cate = this.cateDAO.findById(cateID);
		Product old = this.proDAO.findById(Integer.valueOf(request.getParameter("id")));
		try {
			Product pro = new Product();
			BeanUtils.populate(pro, request.getParameterMap());
			pro.setCategory(cate);
			String uploadFolder = request.getServletContext().getRealPath("/images");
			Path uploadPath = Paths.get(uploadFolder);
			if (!Files.exists(uploadPath)) {
				Files.createDirectory(uploadPath);
			}
			Part imagePart = request.getPart("image");
			String imageFilename = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
			System.out.println(imageFilename.isEmpty());

			if (imageFilename.isEmpty()) {
				pro.setAnh(old.getAnh());
			} else {
				imagePart.write(Paths.get(uploadPath.toString(), imageFilename).toString());
				pro.setAnh(imageFilename);
			}
			this.proDAO.update(pro);
			System.out.println("Success");
			session.setAttribute("message", "Thêm mới thành công!");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/products/index");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Fail");
			session.setAttribute("error", "Thêm mới thất bại!");
			response.sendRedirect("/PH17936_BuiQuangVu_SOF3011_ASM/products/index");
		}
	}
}

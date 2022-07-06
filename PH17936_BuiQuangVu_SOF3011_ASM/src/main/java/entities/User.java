package entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the users database table.
 * 
 */
@Entity
@Table(name="users")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String diaChi;

	private String email;

	private int gioiTinh;

	private String hoTen;

	private String password;

	private int phanQuyen;

	private String sdt;

	private int trangThai;

	//bi-directional many-to-one association to Category
	@OneToMany(mappedBy="user")
	private List<Category> categories;

	//bi-directional many-to-one association to OrderKh
	@OneToMany(mappedBy="user")
	private List<OrderKh> orderKhs;

	public User() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDiaChi() {
		return this.diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGioiTinh() {
		return this.gioiTinh;
	}

	public void setGioiTinh(int gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getHoTen() {
		return this.hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPhanQuyen() {
		return this.phanQuyen;
	}

	public void setPhanQuyen(int phanQuyen) {
		this.phanQuyen = phanQuyen;
	}

	public String getSdt() {
		return this.sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public int getTrangThai() {
		return this.trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	public List<Category> getCategories() {
		return this.categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Category addCategory(Category category) {
		getCategories().add(category);
		category.setUser(this);

		return category;
	}

	public Category removeCategory(Category category) {
		getCategories().remove(category);
		category.setUser(null);

		return category;
	}

	public List<OrderKh> getOrderKhs() {
		return this.orderKhs;
	}

	public void setOrderKhs(List<OrderKh> orderKhs) {
		this.orderKhs = orderKhs;
	}

	public OrderKh addOrderKh(OrderKh orderKh) {
		getOrderKhs().add(orderKh);
		orderKh.setUser(this);

		return orderKh;
	}

	public OrderKh removeOrderKh(OrderKh orderKh) {
		getOrderKhs().remove(orderKh);
		orderKh.setUser(null);

		return orderKh;
	}

}
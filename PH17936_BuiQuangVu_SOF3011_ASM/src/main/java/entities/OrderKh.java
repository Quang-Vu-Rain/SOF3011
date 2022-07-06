package entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the order_kh database table.
 * 
 */
@Entity
@Table(name="order_kh")
@NamedQuery(name="OrderKh.findAll", query="SELECT o FROM OrderKh o")
public class OrderKh implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String diaChiNhanHang;

	private String ghiChu;

	@Temporal(TemporalType.TIMESTAMP)
	private Date ngayDat;

	private int tongTien;

	private int trangThai;

	//bi-directional many-to-one association to OrderDetail
	@OneToMany(mappedBy="orderKh")
	private List<OrderDetail> orderDetails;

	//bi-directional many-to-one association to User
	@ManyToOne
	private User user;

	public OrderKh() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDiaChiNhanHang() {
		return this.diaChiNhanHang;
	}

	public void setDiaChiNhanHang(String diaChiNhanHang) {
		this.diaChiNhanHang = diaChiNhanHang;
	}

	public String getGhiChu() {
		return this.ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public Date getNgayDat() {
		return this.ngayDat;
	}

	public void setNgayDat(Date ngayDat) {
		this.ngayDat = ngayDat;
	}

	public int getTongTien() {
		return this.tongTien;
	}

	public void setTongTien(int tongTien) {
		this.tongTien = tongTien;
	}

	public int getTrangThai() {
		return this.trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	public List<OrderDetail> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public OrderDetail addOrderDetail(OrderDetail orderDetail) {
		getOrderDetails().add(orderDetail);
		orderDetail.setOrderKh(this);

		return orderDetail;
	}

	public OrderDetail removeOrderDetail(OrderDetail orderDetail) {
		getOrderDetails().remove(orderDetail);
		orderDetail.setOrderKh(null);

		return orderDetail;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
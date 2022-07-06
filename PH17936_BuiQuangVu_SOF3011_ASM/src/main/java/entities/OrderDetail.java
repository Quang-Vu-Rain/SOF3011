package entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the order_details database table.
 * 
 */
@Entity
@Table(name="order_details")
@NamedQuery(name="OrderDetail.findAll", query="SELECT o FROM OrderDetail o")
public class OrderDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private int soLuong;

	private int trangThai;

	//bi-directional many-to-one association to OrderKh
	@ManyToOne
	@JoinColumn(name="order_id")
	private OrderKh orderKh;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="producrs_id")
	private Product product;

	public OrderDetail() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSoLuong() {
		return this.soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getTrangThai() {
		return this.trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	public OrderKh getOrderKh() {
		return this.orderKh;
	}

	public void setOrderKh(OrderKh orderKh) {
		this.orderKh = orderKh;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
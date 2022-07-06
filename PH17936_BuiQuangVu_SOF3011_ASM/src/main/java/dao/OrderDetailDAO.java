package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.OrderDetail;
import utils.JpaUtil;

public class OrderDetailDAO {
	private EntityManager em;

	public OrderDetailDAO() {
		this.em = JpaUtil.getEntityManager();
	}

	public List<OrderDetail> all() {
		String jpql = "SELECT obj FROM OrderDetail obj";
		TypedQuery<OrderDetail> query = this.em.createQuery(jpql, OrderDetail.class);
		List<OrderDetail> result = query.getResultList();
		return result;
	}

	public OrderDetail create(OrderDetail OrderDetail) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.persist(OrderDetail);
			this.em.getTransaction().commit();
			return OrderDetail;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public OrderDetail findById(int id) {
		return this.em.find(OrderDetail.class, id);
	}

	public OrderDetail delete(OrderDetail OrderDetail) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.remove(OrderDetail);
			this.em.getTransaction().commit();
			return OrderDetail;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public OrderDetail update(OrderDetail OrderDetail) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.merge(OrderDetail);
			this.em.getTransaction().commit();
			return OrderDetail;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	
	public List<OrderDetail> findByOrderID(int id) {
		try {
			String jpql = "SELECT obj FROM OrderDetail obj " + "WHERE obj.orderKh.id = :id ";
			TypedQuery<OrderDetail> query = this.em.createQuery(jpql, OrderDetail.class);
			query.setParameter("id", id);
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<OrderDetail> listDetail(int id) {
		try {
			String jpql = "SELECT obj FROM OrderDetail obj " + "WHERE obj.orderKh.user.id = :id AND obj.orderKh.trangThai = 0";
			TypedQuery<OrderDetail> query = this.em.createQuery(jpql, OrderDetail.class);
			query.setParameter("id", id);
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}
}

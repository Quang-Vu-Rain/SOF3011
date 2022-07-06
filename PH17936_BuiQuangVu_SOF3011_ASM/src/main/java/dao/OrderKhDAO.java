package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.OrderKh;
import utils.JpaUtil;

public class OrderKhDAO {
	private EntityManager em;

	public OrderKhDAO() {
		this.em = JpaUtil.getEntityManager();
	}

	public List<OrderKh> all() {
		String jpql = "SELECT obj FROM OrderKh obj";
		TypedQuery<OrderKh> query = this.em.createQuery(jpql, OrderKh.class);
		List<OrderKh> result = query.getResultList();
		return result;
	}
	
	public List<OrderKh> list(int start) {
		String jpql = "SELECT obj FROM OrderKh obj WHERE obj.trangThai = 1";
		TypedQuery<OrderKh> query = this.em.createQuery(jpql, OrderKh.class);
		List<OrderKh> result = query.setFirstResult(start).setMaxResults(6).getResultList();
		return result;
	}

	public OrderKh create(OrderKh Order) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.persist(Order);
			this.em.getTransaction().commit();
			return Order;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public OrderKh findById(int id) {
		return this.em.find(OrderKh.class, id);
	}

	public OrderKh delete(OrderKh Order) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.remove(Order);
			this.em.getTransaction().commit();
			return Order;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public OrderKh update(OrderKh Order) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.merge(Order);
			this.em.getTransaction().commit();
			return Order;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public OrderKh findByUserID(int id) {
		try {
			String jpql = "SELECT obj FROM OrderKh obj WHERE obj.user.id = :id AND obj.trangThai = 0";
			TypedQuery<OrderKh> query = this.em.createQuery(jpql, OrderKh.class);
			query.setParameter("id", id);
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public List<OrderKh> findByUserIDAll(int start, int id) {
		try {
			String jpql = "SELECT obj FROM OrderKh obj WHERE obj.user.id = :id AND obj.trangThai != 0";
			TypedQuery<OrderKh> query = this.em.createQuery(jpql, OrderKh.class);
			query.setParameter("id", id);
			return query.setFirstResult(start).setMaxResults(6).getResultList();
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<OrderKh> findByUserIDAll1(int id) {
		try {
			String jpql = "SELECT obj FROM OrderKh obj WHERE obj.user.id = :id AND obj.trangThai != 0";
			TypedQuery<OrderKh> query = this.em.createQuery(jpql, OrderKh.class);
			query.setParameter("id", id);
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<OrderKh> allOrderList() {
		String jpql = "SELECT obj FROM OrderKh obj WHERE obj.trangThai = 1";
		TypedQuery<OrderKh> query = this.em.createQuery(jpql, OrderKh.class);
		List<OrderKh> result = query.getResultList();
		return result;
	}
}

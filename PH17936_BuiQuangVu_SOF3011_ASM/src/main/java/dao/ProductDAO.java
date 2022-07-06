package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Product;
import utils.JpaUtil;

public class ProductDAO {
	private EntityManager em;

	public ProductDAO() {
		this.em = JpaUtil.getEntityManager();
	}

	public List<Product> list(int start) {
		String jpql = "SELECT obj FROM Product obj";
		TypedQuery<Product> query = this.em.createQuery(jpql, Product.class);
		List<Product> result = query.setFirstResult(start).setMaxResults(18).getResultList();
		return result;
	}
	
	public List<Product> list1(int start) {
		String jpql = "SELECT obj FROM Product obj";
		TypedQuery<Product> query = this.em.createQuery(jpql, Product.class);
		List<Product> result = query.setFirstResult(start).setMaxResults(6).getResultList();
		return result;
	}

	public List<Product> listCategory(int start, int id) {
		String jpql = "SELECT obj FROM Product obj WHERE obj.category.id = :id";
		TypedQuery<Product> query = this.em.createQuery(jpql, Product.class);
		query.setParameter("id", id);
		return query.setFirstResult(start).setMaxResults(18).getResultList();
	}

	public List<Product> listCategoryAll(int id) {
		String jpql = "SELECT obj FROM Product obj WHERE obj.category.id = :id";
		TypedQuery<Product> query = this.em.createQuery(jpql, Product.class);
		query.setParameter("id", id);
		return query.getResultList();
	}

	public List<Product> all() {
		String jpql = "SELECT obj FROM Product obj";
		TypedQuery<Product> query = this.em.createQuery(jpql, Product.class);
		List<Product> result = query.getResultList();
		return result;
	}

	public Product create(Product pro) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.persist(pro);
			this.em.getTransaction().commit();
//			this.em.flush();
			return pro;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public Product findById(int id) {
		return this.em.find(Product.class, id);
	}

	public Product delete(Product pro) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.remove(pro);
			this.em.getTransaction().commit();
			return pro;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public Product update(Product pro) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.merge(pro);
			this.em.getTransaction().commit();
			return pro;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
}

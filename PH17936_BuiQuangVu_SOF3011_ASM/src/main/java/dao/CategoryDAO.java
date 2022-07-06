package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Category;
import entities.Product;
import utils.JpaUtil;

public class CategoryDAO {
	private EntityManager em;

	public CategoryDAO() {
		this.em = JpaUtil.getEntityManager();
	}

	public Category create(Category cate) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.persist(cate);
			this.em.getTransaction().commit();
			return cate;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public List<Category> all() {
		String jpql = "SELECT obj FROM Category obj";
		TypedQuery<Category> query = this.em.createQuery(jpql, Category.class);
		List<Category> result = query.getResultList();
		return result;
	}
	
	public List<Category> list(int start) {
		String jpql = "SELECT obj FROM Category obj";
		TypedQuery<Category> query = this.em.createQuery(jpql, Category.class);
		List<Category> result = query.setFirstResult(start).setMaxResults(12).getResultList();
		return result;
	}
	
	public List<Category> list1(int start) {
		String jpql = "SELECT obj FROM Category obj";
		TypedQuery<Category> query = this.em.createQuery(jpql, Category.class);
		List<Category> result = query.setFirstResult(start).setMaxResults(6).getResultList();
		return result;
	}

	public Category findById(int id) {
		return this.em.find(Category.class, id);
	}

	public Category delete(Category cate) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.remove(cate);
			this.em.getTransaction().commit();
			return cate;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public Category update(Category cate) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.merge(cate);
			this.em.getTransaction().commit();
			return cate;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
}

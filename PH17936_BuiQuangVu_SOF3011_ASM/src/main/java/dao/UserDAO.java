package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.User;
import utils.JpaUtil;

public class UserDAO {
	private EntityManager em;

	public UserDAO() {
		this.em = JpaUtil.getEntityManager();
	}

	public List<User> all() {
		String jpql = "SELECT obj FROM User obj";
		TypedQuery<User> query = this.em.createQuery(jpql, User.class);
		List<User> result = query.getResultList();
		return result;
	}
	
	public List<User> list(int start) {
		String jpql = "SELECT obj FROM User obj";
		TypedQuery<User> query = this.em.createQuery(jpql, User.class);
		List<User> result = query.setFirstResult(start).setMaxResults(6).getResultList();
		return result;
	}

	public User create(User user) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.persist(user);
			this.em.getTransaction().commit();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public User findById(int id) {
		return this.em.find(User.class, id);
	}

	public User delete(User user) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.remove(user);
			this.em.getTransaction().commit();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public User update(User user) throws Exception {
		try {
			this.em.getTransaction().begin();
			this.em.merge(user);
			this.em.getTransaction().commit();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}

	public User findByEmail(String email) {
		String jpql = "SELECT obj FROM User obj " + "WHERE obj.email = :email";
		TypedQuery<User> query = this.em.createQuery(jpql, User.class);
		query.setParameter("email", email);
		return query.getSingleResult();
	}
}

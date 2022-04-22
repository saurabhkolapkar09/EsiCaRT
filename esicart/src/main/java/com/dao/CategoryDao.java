package com.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.entities.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public int saveCategory(Category cat) {

		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();

		int catId = (Integer) session.save(cat);

		tx.commit();
		session.close();
		return catId;
	}
	
    public List<Category> getCategories() {
        Session s = this.factory.openSession();
        Query q = s.createQuery("from Category");
        List<Category> list = q.list();
        return list;
    }

}

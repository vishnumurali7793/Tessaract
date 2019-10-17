package org.tesseract.persistance;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.tesseract.entities.LoginBean;

public class LoginHibernateDao implements LoginDao {

	SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	Session session = sessionFactory.openSession();

	public boolean authenticateUser(LoginBean loginBean) {
		session.beginTransaction();
		try {
			Query query = session
					.createQuery("from LoginBean bean where bean.userName=:userName " + "and bean.password=:password")
					.setParameter("userName", loginBean.getUserName())
					.setParameter("password", loginBean.getPassword());
			if ((Boolean) query.uniqueResult()) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

}

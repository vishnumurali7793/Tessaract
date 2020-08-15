package org.tesseract.persistance;

import java.util.Collection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.tesseract.entities.StockBean;

public class DashBoardHibernateDao {
	Session session;
	SessionFactory sessionFactory;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Collection<Object> getSalesDetails(String type) {
		Query query = null;
		StringBuilder queryBuilder = new StringBuilder("SELECT COUNT(sb.salesid), SUM(sa.netamount) "
				+ "FROM tesseract.salesBase sb JOIN tesseract.salesamount sa ON sb.salesid = sa.salesid");
		session = getInstance();
		try {
			if (type.equals("TODAY")) {
				queryBuilder.append(" WHERE sb.invoice_date = DATE(NOW())");
				query = session.createSQLQuery(queryBuilder.toString());
			} else if (type.equals("TOTAL")) {
				query = session.createSQLQuery(queryBuilder.toString());
			}
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			closeInstance();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<StockBean> getCurrentStockDetails() {
		session = getInstance();
		try {
			return session.createQuery("FROM StockBean").list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			closeInstance();
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public Collection<Object> getDailyRateList(){
		session = getInstance();
		try {
			return session.createQuery("SELECT CONCAT(categoryId.categoryName, ' ', caratId.caratName), " +
									   "amount, CONCAT(categoryId.categoryCode, '_', caratId.caratCode) FROM " +
									   "RateBean WHERE addedOn = DATE(NOW())").list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			closeInstance();
		}
	}
	
	@SuppressWarnings("unchecked")
	public Collection<Object> getCategoryWiseSalesCountAndAmount(String categoryCode, String month) {
		session = getInstance();
		String queryString = "SELECT COUNT(sb.salesid), SUM(sm.netamount), c.category_code FROM tesseract.salesBase sb "
							+ "JOIN tesseract.sales_details sd ON sb.salesid = sd.salesid "
							+ "JOIN tesseract.product p ON sd.productId = p.product_id JOIN "
							+ "tesseract.category c ON p.category = c.category_id "
							+ "JOIN tesseract.salesamount sm ON sb.salesid = sm.salesid WHERE "
							+ "MONTH(sb.invoice_date)=:month AND c.category_code=:categoryCode";
		try {
			return session.createSQLQuery(queryString).setParameter("month", month)
					.setParameter("categoryCode", categoryCode).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			closeInstance();
		}
	}
	
	@SuppressWarnings("unchecked")
	public Collection<Object> getAllSalesDataDateWise(String fetchType) {
		session = getInstance();
		String queryString = null;
		if (fetchType.equals("ST")) {
			queryString = "SELECT DATE(invoice_date), COUNT(salesid) FROM tesseract.salesBase GROUP BY invoice_date ORDER BY DATE(invoice_date)";
		} else if (fetchType.equals("PSD")) {
			queryString = "SELECT DATE(sb.invoice_date), SUM(sam.netamount) FROM tesseract.salesBase sb JOIN " +
						  "tesseract.salesamount sam ON sb.salesid = sam.salesid GROUP BY sb.invoice_date ORDER BY DATE(sb.invoice_date)";
		}
		try {
			return session.createSQLQuery(queryString).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			closeInstance();
		}
	}
	
	@SuppressWarnings("unchecked")
	public Collection<Object> getAllPurchaseDataDateWise() {
		session = getInstance();
		String queryString = "SELECT DATE(pb.invoice_date), SUM(pam.netamount) FROM tesseract.purchaseBase pb JOIN " +
							 "tesseract.purchaseamount pam ON pb.purchase_id = pam.purchase_amount_id " +
							 "GROUP BY pb.invoice_date ORDER BY DATE(pb.invoice_date)";
		try {
			return session.createSQLQuery(queryString).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	
	
	
/*********************************ADD YOUR CODES ABOVE THIS LINE*********************************/
	
	public Session getInstance() {
		sessionFactory = new Configuration().configure().buildSessionFactory();
		return sessionFactory.openSession();
	}

	public void closeInstance() {
		session.close();
		sessionFactory.close();
	}

}

package org.tesseract.action;

import org.tesseract.entities.LoginBean;
import org.tesseract.persistance.LoginHibernateDao;
import org.tesseract.service.LoginService;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	LoginBean loginBean;
	
	LoginHibernateDao loginHibernateDao = new LoginHibernateDao();

	boolean flag = false;

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String authenticateUser() {
		if (loginBean.getUserName() != null && loginBean.getPassword() != null) {
			flag = loginHibernateDao.authenticateUser(loginBean);
			if (flag) {
				return SUCCESS;
			}
		}
		return INPUT;
	}

	public LoginBean getLoginBean() {
		return loginBean;
	}

	public void setLoginBean(LoginBean loginBean) {
		this.loginBean = loginBean;
	}

}

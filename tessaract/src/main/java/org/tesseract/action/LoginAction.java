package org.tesseract.action;

import org.tesseract.entities.LoginBean;
import org.tesseract.service.LoginService;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	LoginBean loginBean;
	LoginService loginService;

	boolean flag;

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String authenticateUser() {
		if (loginBean.getUserName() != null && loginBean.getPassword() != null) {
			flag = loginService.authenticateUser(loginBean);
			return SUCCESS;
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

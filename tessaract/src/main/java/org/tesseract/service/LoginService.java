package org.tesseract.service;

import org.tesseract.entities.LoginBean;

public interface LoginService {

	boolean authenticateUser(LoginBean loginBean);

}

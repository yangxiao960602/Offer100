package cn.edu.hust.service;

import java.sql.SQLException;

import cn.edu.hust.dao.EnterpriseDao;
import cn.edu.hust.domain.Enterprise;
import cn.edu.hust.domain.User;

public class EpService {

	public boolean regist(Enterprise user) {

		EnterpriseDao dao = new EnterpriseDao();
		int row = 0;
		try {
			row = dao.regist(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return row>0?true:false;
	}

	//激活
	public void active(String activeCode) {
		EnterpriseDao dao = new EnterpriseDao();
		try {
			dao.active(activeCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//校验用户名是否存在
	public boolean checkUsername(String username) {
		EnterpriseDao dao = new EnterpriseDao();
		Long isExist = 0L;
		try {
			isExist = dao.checkUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isExist>0?true:false;
	}

	//用户登录的方法
	public Enterprise login(String username, String password) throws SQLException {
		EnterpriseDao dao = new EnterpriseDao();
		return dao.login(username,password);
	}

}

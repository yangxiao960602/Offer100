package cn.edu.hust.service;

import java.sql.SQLException;

import cn.edu.hust.dao.JRManageDao;
import cn.edu.hust.dao.UserDao;
import cn.edu.hust.domain.JobInfo;

public class JRService {

	public boolean postJob(int en_id, JobInfo jobInfo) {
		// TODO Auto-generated method stub
		/*UserDao dao = new UserDao();
		int row = 0;
		try {
			row = dao.regist(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return row>0?true:false;*/
		
		JRManageDao dao = new JRManageDao();
		int row = 0;
		row = dao.postJob(en_id, jobInfo);
		return row>0?true:false;
	}

}

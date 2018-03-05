package cn.edu.hust.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.edu.hust.domain.Enterprise;
import cn.edu.hust.domain.User;
import cn.edu.hust.utils.DataSourceUtils;

public class EnterpriseDao {
	public int regist(Enterprise user) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		/*
		insert into enterprise(en_name, en_city, en_username, en_password, en_email, 
				en_statu, en_code, en_registerdata, ep_lastdate) VALUES('baidu', '北京', 'u3', '123456', '4343',
				0, 'adfhioahgpaiohg', '2018-03-31', '2018-03-31')
		*/
		String sql = "insert into enterprise(en_name, en_city, en_username, en_password, en_email, "
				+ "en_statu, en_code, en_registerdata, ep_lastdate) "
				+ "values(?,?,?,?,?,?,?,?,?)";
		int update = runner.update(sql, user.getEn_name(), user.getEn_city(),user.getEn_username(), 
				user.getEn_password(), user.getEn_email(), user.getEn_statu(),
				user.getEn_code(), user.getEn_registerdata(), user.getEp_lastdate());
		return update;
		
		
	}

	//激活
	public void active(String activeCode) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update enterprise set en_statu=? where en_code=?";
		runner.update(sql, 1,activeCode);
	}

	//校验用户名是否存在
	public Long checkUsername(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from enterprise where en_username=?";
		Long query = (Long) runner.query(sql, new ScalarHandler(), username);
		return query;
	}

	//用户登录的方法
	public Enterprise login(String username, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from enterprise where en_username=? and en_password=?";
		return runner.query(sql, new BeanHandler<Enterprise>(Enterprise.class), username,password);
	}
}

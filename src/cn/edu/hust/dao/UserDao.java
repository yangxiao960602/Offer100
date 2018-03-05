package cn.edu.hust.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.edu.hust.domain.User;
import cn.edu.hust.utils.DataSourceUtils;

public class UserDao {

	public int regist(User user) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into user values(?,?,?,?,?,?,?,?,?)";
		int update = runner.update(sql, null,user.getUser_name(),
				user.getUser_password(), user.getUser_email(), null,
				user.getUser_statu(), user.getUser_code(), user.getUser_registerdata(),
				user.getUser_lastdate());
		return update;
	}

	//激活
	public void active(String activeCode) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update user set user_statu=? where user_code=?";
		runner.update(sql, 1,activeCode);
	}

	//校验用户名是否存在
	public Long checkUsername(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from user where user_name=?";
		Long query = (Long) runner.query(sql, new ScalarHandler(), username);
		return query;
	}

	//用户登录的方法
	public User login(String username, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where user_name=? and user_password=?";
		return runner.query(sql, new BeanHandler<User>(User.class), username,password);
	}

	
}

package cn.edu.hust.domain;

import java.util.Date;

public class User {
	private int user_id;	//用户id
	private String user_name;	//用户名
	private String user_password;	//密码
	private String user_email;	//用户邮箱
	private String user_photo;	//用户头像
	private int user_statu;	//用户当前状态
	private String user_code;	//激活码
	private Date user_registerdata;	//注册日期
	private Date user_lastdate;	//最近登录时间
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_photo() {
		return user_photo;
	}
	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}
	public int getUser_statu() {
		return user_statu;
	}
	public void setUser_statu(int user_statu) {
		this.user_statu = user_statu;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}
	public Date getUser_registerdata() {
		return user_registerdata;
	}
	public void setUser_registerdata(Date user_registerdata) {
		this.user_registerdata = user_registerdata;
	}
	public Date getUser_lastdate() {
		return user_lastdate;
	}
	public void setUser_lastdate(Date user_lastdate) {
		this.user_lastdate = user_lastdate;
	}
}

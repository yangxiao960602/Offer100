package cn.edu.hust.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import cn.edu.hust.domain.User;
import cn.edu.hust.service.UserService;
import cn.edu.hust.utils.CommonsUtils;
import cn.edu.hust.utils.MailUtils;

/**
 * Servlet implementation class URegisterServlet
 */
public class URegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public URegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		//获得表单数据
		Map<String, String[]> properties = request.getParameterMap();
		
		User user = new User();
		try {
			//自己指定一个类型转换器（将String转成Date）
			ConvertUtils.register(new Converter() {
				@Override
				public Object convert(Class clazz, Object value) {
					//将string转成date
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					Date parse = null;
					try {
						parse = format.parse(value.toString());
					} catch (ParseException e) {
						e.printStackTrace();
					}
					return parse;
				}
			}, Date.class);
			//映射封装
			BeanUtils.populate(user, properties);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//private String uid;
		//user.setUser_id(CommonsUtils.getUUID());
		
		//private int state;//是否激活
		user.setUser_statu(0);
		//private String code;//激活码
		String activeCode = CommonsUtils.getUUID();
		user.setUser_code(activeCode);
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String now = sdf.format(d);
		
		try {
			Date nowDate = sdf.parse(now);
			user.setUser_registerdata(nowDate);
			user.setUser_lastdate(nowDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//将user传递给service层
		UserService service = new UserService();
		boolean isRegisterSuccess = service.regist(user);
		
		//是否注册成功
		if(isRegisterSuccess){
			//发送激活邮件
			String emailMsg = "恭喜您注册成功，请点击下面的连接进行激活账户"
					+ "<a href='http://localhost:8080/Offer100/active?activeCode="+activeCode+"'>"
					+ "http://localhost:8080/Offer100/active?activeCode="+activeCode+"&usertype="+0+"</a>";
			try {
				MailUtils.sendMail(user.getUser_email(), emailMsg);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			
			//跳转到注册成功页面
			response.sendRedirect(request.getContextPath()+"/registerSuccess.jsp");
		}else{
			//跳转到失败的提示页面
			response.sendRedirect(request.getContextPath()+"/registerFail.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package cn.edu.hust.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import cn.edu.hust.domain.Enterprise;
import cn.edu.hust.domain.User;
import cn.edu.hust.service.EpService;
import cn.edu.hust.service.UserService;
import cn.edu.hust.servlet.BaseServlet;

/**
 * Servlet implementation class URegisterServlet
 */
/*public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    *//**
     * @see HttpServlet#HttpServlet()
     *//*
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	*//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}*/





public class LoginServlet extends BaseServlet {
	
	//用户注销
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		
		//从session中将user删除
		session.removeAttribute("user");
		session.removeAttribute("enterprise");
		
		/*//将存储在客户端的cookie删除掉
		Cookie cookie_username = new Cookie("cookie_username","");
		cookie_username.setMaxAge(0);
		//创建存储密码的cookie
		Cookie cookie_password = new Cookie("cookie_password","");
		cookie_password.setMaxAge(0);

		response.addCookie(cookie_username);
		response.addCookie(cookie_password);*/
		
		
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		
	}	

	//用户登录
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		//获得输入的用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String usertype = request.getParameter("usertype");

		if ("user".equals(usertype)) {
			//普通用户
			//将用户名和密码传递给service层
			UserService service = new UserService();
			User user = null;
			try {
				user = service.login(username,password);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			//判断用户是否登录成功 user是否是null
			if(user!=null){
				//登录成功
				//***************判断用户是否勾选了自动登录*****************
				/*String autoLogin = request.getParameter("autoLogin");
				if("autoLogin".equals(autoLogin)){
					//要自动登录
					//创建存储用户名的cookie
					Cookie cookie_username = new Cookie("cookie_username",user.getUser_name());
					cookie_username.setMaxAge(10*60);
					//创建存储密码的cookie
					Cookie cookie_password = new Cookie("cookie_password",user.getUser_password());
					cookie_password.setMaxAge(10*60);

					response.addCookie(cookie_username);
					response.addCookie(cookie_password);

				}*/

				//***************************************************
				//将user对象存到session中
				session.setAttribute("user", user);

				//重定向到首页
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}else{
			     
				request.setAttribute("loginError", "用户名或密码错误");
				response.setCharacterEncoding("UTF-8");
				
				
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				
			}
			
		} else if ("enterprise".equals(usertype)) {
			
			//企业用户
			//将用户名和密码传递给service层
			EpService service = new EpService();
			Enterprise enterprise = null;
			try {
				enterprise = service.login(username,password);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			//判断用户是否登录成功 user是否是null
			if(enterprise!=null){
				//登录成功
				//***************判断用户是否勾选了自动登录*****************
				/*String autoLogin = request.getParameter("autoLogin");
				if("autoLogin".equals(autoLogin)){
					//要自动登录
					//创建存储用户名的cookie
					Cookie cookie_username = new Cookie("cookie_username",user.getUser_name());
					cookie_username.setMaxAge(10*60);
					//创建存储密码的cookie
					Cookie cookie_password = new Cookie("cookie_password",user.getUser_password());
					cookie_password.setMaxAge(10*60);

					response.addCookie(cookie_username);
					response.addCookie(cookie_password);

				}*/

				//***************************************************
				//将user对象存到session中
				session.setAttribute("enterprise", enterprise);

				//重定向到首页
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}else{
			     
				request.setAttribute("loginError", "用户名或密码错误");
				response.setCharacterEncoding("UTF-8");
				
				
				request.getRequestDispatcher("/login.jsp").forward(request, response);
				
			}
			
		} else {
			request.setAttribute("loginError", "用户名或密码错误");
			response.setCharacterEncoding("UTF-8");
			
			
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			
			
		}
		
	}
}
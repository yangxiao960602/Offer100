package cn.edu.hust.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.hust.service.EpService;
import cn.edu.hust.service.UserService;

/**
 * Servlet implementation class ActiveServlet
 */
public class ActiveServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//获得激活码
		String activeCode = request.getParameter("activeCode");
		String userType = request.getParameter("usertype");
		if (userType.equals("1")) {
			EpService service = new EpService();
			service.active(activeCode);
			
			//跳转到登录页面
			response.sendRedirect(request.getContextPath()+"/userLogin.jsp");
			
		} else {
			UserService service = new UserService();
			service.active(activeCode);
			
			//跳转到登录页面
			response.sendRedirect(request.getContextPath()+"/userLogin.jsp");
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

package cn.edu.hust.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import cn.edu.hust.domain.Enterprise;
import cn.edu.hust.domain.JobInfo;
import cn.edu.hust.service.EpService;
import cn.edu.hust.service.JRService;
import cn.edu.hust.utils.CommonsUtils;

/**
 * Servlet implementation class JobServlet
 */
public class JobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JobServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");

		request.setCharacterEncoding("UTF-8");
		// 获得表单数据
		Map<String, String[]> properties = request.getParameterMap();

		JobInfo jobInfo = new JobInfo();
		try {
			// 自己指定一个类型转换器（将String转成Date）
			ConvertUtils.register(new Converter() {
				@Override
				public Object convert(Class clazz, Object value) {
					// 将string转成date
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

			// 自己指定一个类型转换器（将String转成int）
			ConvertUtils.register(new Converter() {
				@Override
				public Object convert(Class clazz, Object value) {
					// 将string转成date
					int parse = 0;
					parse = Integer.parseInt(value.toString());
					return parse;
				}
			}, int.class);
			// 映射封装
			BeanUtils.populate(jobInfo, properties);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		// 手动添加招聘人数
		/*String num = request.getParameter("jobinfo_num");
		int jobinfo_num;
		try {
			jobinfo_num = Integer.parseInt(num);
			jobInfo.setJobinfo_num(jobinfo_num);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
			
		// 手动添加职位发布时间
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String now = sdf.format(d);

		try {
			Date nowDate = sdf.parse(now);
			jobInfo.setJobinfo_time(nowDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// get公司名
		HttpSession session = request.getSession();
		Enterprise enterprise = (Enterprise) session.getAttribute("enterprise");
		
		//TODO 验证登录的逻辑应当是在进入发布职位页面之前
		// 判断当前是否已经登录
		if (enterprise == null) {
			response.getWriter().write("当前未登录系统,请以企业用户身份登录后重新发布!");
//			response.getWriter().print("<script> alert(\"当前未登录系统,请以企业用户身份登录后重新发布!\"); </script>");
			response.setHeader("refresh", "3;url=" + request.getContextPath() + "/jobRelease.jsp");  
			return;
		}
		jobInfo.setEn_name(enterprise.getEn_name());
		int en_id = enterprise.getEn_id();

		// 将jobInfo传递给service层
		JRService jrService = new JRService();
		boolean isPostSuccess = jrService.postJob(en_id, jobInfo);
			
		if (isPostSuccess) {
			//TODO 跳转到哪儿???
			//TODO 企业名称还未添加
			response.getWriter().write("发布职位成功！3秒后跳转到主页");  
	        //设置3秒钟跳转  
	        response.setHeader("refresh", "3;url=" + request.getContextPath() + "/index.jsp");  
			
			//response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else {
			response.getWriter().print("<script> alert(\"发布职位失败!\"); </script>");
			response.sendRedirect(request.getContextPath() + "/jobRelease.jsp");
		}

		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

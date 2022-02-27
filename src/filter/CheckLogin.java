package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.bean.UserInfo;

/**
 * 登录信息检查Filter
 * @author Jiuyu
 *
 */
@WebFilter("/index.jsp")
public class CheckLogin implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)resp;
		HttpSession session=request.getSession();
		UserInfo userInfo=(UserInfo)session.getAttribute("userInfo");
		if(userInfo==null) {
			response.sendRedirect("login.jsp");//重定向到登陆页面
		}else {
			chain.doFilter(request, response);//放行
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}

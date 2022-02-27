package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import db.bean.UserInfo;
import service.UserServiceI;
import utils.ResultMap;

/**
 * 用户控制器
 * @author Jiuyu
 *
 */
@Controller
public class UserController {
	@Autowired
	private ResultMap<?> resultMap;
	@Autowired
	private UserServiceI userServiceI;
	
	@RequestMapping("login")
	@ResponseBody
	public ResultMap<?> login(String username,String password,String captcha,HttpServletRequest request) {
		try {
			HttpSession session=request.getSession();
			String captchaString=(String)session.getAttribute("captcha");
			UserInfo userInfo=userServiceI.login(username, password,captcha,captchaString);//调用逻辑层登录功能UserService的login方法
			session.setAttribute("userInfo", userInfo);//将用户信息设置到session中
			resultMap.setStatus(true);
		} catch (Exception e) {
			resultMap.setStatus(false);
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
	
}

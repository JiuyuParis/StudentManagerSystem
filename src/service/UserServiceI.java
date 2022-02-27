package service;

import db.bean.UserInfo;

/**
 * 用户事务管理接口
 * @author Jiuyu
 *
 */
public interface UserServiceI {
	
	/**
	 * 验证用户登录
	 * @param userName 用户名
	 * @param passWord 密码
	 * @param captcha 用户输入的验证码
	 * @param captchaString 验证码
	 * @return 用户信息
	 */
	public UserInfo login(String userName,String passWord,String captcha,String captchaString);
}

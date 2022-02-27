package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import db.bean.UserInfo;
import db.dao.UserDao;

/**
 * 逻辑层用户管理接口实现类
 * @author Jiuyu
 *
 */
@Service
public class UserServiceImpl implements UserServiceI {
	@Autowired
	private UserDao userDao;
	@Override
	public UserInfo login(String userName, String passWord,String captcha,String captchaString) {
		if("".equals(captcha)) {
			throw  new RuntimeException("请输入验证码！");
		}
		if(!captchaString.equalsIgnoreCase(captcha)) {
			throw new RuntimeException("输入的验证码有误！");
		}
		UserInfo userInfo=new UserInfo();
		userInfo.setUid(userName);
		userInfo.setPassword(passWord);
		UserInfo user=userDao.login(userInfo);
		if(user==null) {
			throw new RuntimeException("输入的用户名或密码有误！");
		}
		return user;
	}
	

}

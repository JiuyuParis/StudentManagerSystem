package db.dao;

import org.springframework.stereotype.Repository;

import db.bean.UserInfo;

/**
 * 验证用户登录Dao
 * @author Jiuyu
 *
 */
@Repository//建立UserDao接口动态代理实例
public interface UserDao {
	public UserInfo login(UserInfo userInfo);
}

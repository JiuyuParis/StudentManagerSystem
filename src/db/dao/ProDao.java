package db.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import db.bean.Profession;

/**
 * 关于专业处理的dao层
 * @author Jiuyu
 *
 */
@Repository
public interface ProDao {
	/**
	 * 查询专业信息
	 * @return 专业列表
	 */
	public List<Profession> selectAllPro();
	
	/**
	 * 删除专业信息
	 * @param pid 专业pid
	 * @return 受影响的行
	 */
	public int deleteProById(String pid);
	
	/**
	 * 添加专业信息
	 * @param profession 专业信息类对象
	 * @return 受影响的行
	 */
	public int insertPro(Profession profession);
	
	/**
	 * 修改专业信息
	 * @param profession 专业信息类对象
	 * @return 受影响的行
	 */
	public int updatePro(Profession profession);
}

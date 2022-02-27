package db.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import db.bean.Classt;

/**
 * 班级处理的dao层
 * @author Jiuyu
 *
 */
@Repository
public interface ClasstDao {
	/**
	 * 查询班级信息
	 * @return 班级列表
	 */
	public List<Classt> selectAllClasst();
	
	/**
	 * 删除班级信息
	 * @param clid 班级clid
	 * @return 受影响的行
	 */
	public int deleteClasstByClid(String clid);
	
	/**
	 * 添加班级信息
	 * @param classt
	 * @return
	 */
	public int insertClasst(Classt classt);
	
	/**
	 * 更新班级表
	 * @param classt 班级表对象
	 * @return 受影响的行
	 */
	public int updateClasst(Classt classt);
}

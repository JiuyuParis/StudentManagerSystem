package db.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import db.bean.Grade;

/**
 * 年级处理的dao层
 * @author Jiuyu
 *
 */
@Repository
public interface GradeDao {
	/**
	 * 查询年级信息
	 * @return 专业列表
	 */
	public List<Grade> selectAllGrade();
	
	/**
	 * 删除年级信息
	 * @param gid 年级gid
	 * @return 受影响的行
	 */
	public int deleteGradeByGid(String gid);
	
	/**
	 * 添加年级信息
	 * @param grade 年级实体类
	 * @return 受影响的行
	 */
	public int insertGrade(Grade grade);
	
	/**
	 * 修改年级信息
	 * @param grade 年级实体类
	 * @return 受影响的行
	 */
	public int updateGrade(Grade grade);
}

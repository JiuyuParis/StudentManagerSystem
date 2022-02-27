package service;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import db.bean.Grade;

/**
 * 年级管理接口
 * @author Jiuyu
 *
 */
public interface GradeServiceI {
	/**
	 * 查询所有年级
	 * @return 专业列表
	 */
	public List<Grade> selectAllGrade();
	
	/**
	 * 删除年级信息
	 * @param gid 年级的gid
	 * @return 受影响的行
	 */
	public int deleteGradeByGid(String gid);
	
	/**
	 * 添加年级信息
	 * @param grade 年级名称
	 * @return 受影响的行
	 */
	public int insertGrade(String grade);
	
	/**
	 * 修改年级信息
	 * @param classStr 年级信息json字符串格式
	 * @return 受影响的行
	 */
	public int updateGrade(String classStr) throws JsonParseException, JsonMappingException, IOException;
}

package service;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import db.bean.Classt;

/**
 * 班级管理接口
 * @author Jiuyu
 *
 */
public interface ClasstServiceI {
	/**
	 * 查询所有班级
	 * @return 班级列表
	 */
	public List<Classt> selectAllClasst();
	
	/**
	 * 删除班级信息
	 * @param clid 班级的clid
	 * @return 受影响的行
	 */
	public int deleteClasstByClid(String clid);
	
	/**
	 * 添加班级信息
	 * @param classN 班号
	 * @param classType 班型
	 * @return 受影响的行
	 */
	public int insertClasst(String classN,String classType);
	
	/**
	 * 更新班级表
	 * @param classt 班级表对象
	 * @return 受影响的行
	 */
	public int updateClasst(String classtStr) throws JsonParseException, JsonMappingException, IOException;
}

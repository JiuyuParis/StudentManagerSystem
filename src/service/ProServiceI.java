package service;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import db.bean.Profession;

/**
 * 专业管理接口
 * @author Jiuyu
 *
 */
public interface ProServiceI {
	/**
	 * 查询所有专业
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
	 * @param pName 专业名称
	 * @return 受影响的行
	 */
	public int insertPro(String pName);
	
	/**
	 * 修改专业信息
	 * @param proStr 专业信息json字符串格式
	 * @return 受影响的行
	 */
	public int updatePro(String proStr) throws JsonParseException, JsonMappingException, IOException;
}

package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import db.bean.Classt;
import service.ClasstServiceI;
import utils.ResultMap;

/**
 * 班级控制器
 * @author Jiuyu
 *
 */
@Controller
public class ClasstController {
	@Autowired
	private ResultMap<Classt> resultMap;//返回结果map
	@Autowired
	private ClasstServiceI classServiceI;//逻辑层年级管理接口
	
	/**
	 * 分页查询班级信息
	 * @param page 页号
	 * @param limit 每页条数
	 * @return 查询结果map
	 */
	@RequestMapping("selectAllClasst.do")
	@ResponseBody
	public ResultMap<Classt> selectAllClasst(int page,int limit) {
		try {
			PageHelper.startPage(page, limit);//开启分页查询
			List<Classt> classts=classServiceI.selectAllClasst();
			PageInfo<Classt> pageInfo=new PageInfo<Classt>(classts);//制作分页效果，利用page,limit制作页面数据
			classts=pageInfo.getList();//获得该页当前列表
			resultMap.setTotal(pageInfo.getTotal());//返回数据库信息列表总条数
			resultMap.setList(classts);
		} catch (Exception e) {
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 删除班级信息
	 * @param clid 班级id
	 * @return
	 */
	@RequestMapping("deleteClasstByClid.do")
	@ResponseBody
	public ResultMap<?> deleteClasstByClid(String clid) {
		try {
			classServiceI.deleteClasstByClid(clid);
			resultMap.setStatus(true);
		} catch (Exception e) {
			resultMap.setStatus(false);
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 插入班级信息
	 * @param classN 班号
	 * @param classType 班型
	 * @return
	 */
	@RequestMapping("insertClasst.do")
	@ResponseBody
	public ResultMap<?> insertClasst(String classN,String classType) {
		try {
			classServiceI.insertClasst(classN, classType);
			resultMap.setStatus(true);
		} catch (Exception e) {
			resultMap.setStatus(false);
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 修改班级信息
	 * @param proStr json格式的班级信息
	 * @return 结果map
	 */
	@RequestMapping("updateClasst.do")
	@ResponseBody
	public ResultMap<?> updateClasst(String classtStr) {
		try {
			classServiceI.updateClasst(classtStr);
			resultMap.setStatus(true);
		} catch (Exception e) {
			resultMap.setStatus(false);
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
}

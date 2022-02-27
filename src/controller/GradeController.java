package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import db.bean.Grade;
import service.GradeServiceI;
import utils.ResultMap;

/**
 * 年级控制器
 * @author Jiuyu
 *
 */
@Controller
public class GradeController {
	@Autowired
	private ResultMap<Grade> resultMap;//返回结果map
	@Autowired
	private GradeServiceI gradeServiceI;//逻辑层年级管理接口
	
	/**
	 * 分页查询年级信息
	 * @param page 页号
	 * @param limit 每页条数
	 * @return 查询结果map
	 */
	@RequestMapping("selectAllGrade.do")
	@ResponseBody
	public ResultMap<Grade> SelectAllGrade(int page,int limit) {
		try {
			PageHelper.startPage(page, limit);//开启分页查询
			List<Grade> grades=gradeServiceI.selectAllGrade();
			PageInfo<Grade> pageInfo=new PageInfo<Grade>(grades);//制作分页效果，利用page,limit制作页面数据
			grades=pageInfo.getList();//获得该页当前列表
			resultMap.setTotal(pageInfo.getTotal());//返回数据库信息列表总条数
			resultMap.setList(grades);
		} catch (Exception e) {
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 删除年级信息
	 * @param gid 年级gid
	 * @return
	 */
	@RequestMapping("deleteGradeByPid.do")
	@ResponseBody
	public ResultMap<?> deleteProById(String gid) {
		try {
			gradeServiceI.deleteGradeByGid(gid);
			resultMap.setStatus(true);
		} catch (Exception e) {
			resultMap.setStatus(false);
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 添加年级信息
	 * @param grade 年级名称
	 * @return 结果map
	 */
	@RequestMapping("insertGrade.do")
	@ResponseBody
	public ResultMap<?> insertGrade(String grade) {
		try {
			gradeServiceI.insertGrade(grade);
			resultMap.setStatus(true);
		} catch (Exception e) {
			resultMap.setStatus(false);
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
	
	@RequestMapping("updateGrade.do")
	@ResponseBody
	public ResultMap<?> updateClass(String gradeStr) {
		try {
			gradeServiceI.updateGrade(gradeStr);
			resultMap.setStatus(true);
		} catch (Exception e) {
			resultMap.setStatus(false);
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
}

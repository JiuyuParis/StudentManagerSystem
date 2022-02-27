package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import db.bean.Profession;
import service.ProServiceI;
import utils.ResultMap;

/**
 * 专业控制器
 * @author Jiuyu
 *
 */
@Controller
public class ProController {
	@Autowired
	private ResultMap<Profession> resultMap;
	@Autowired
	private ProServiceI proServiceI;
	
	/**
	 * 分页查询专业信息
	 * @param page 页号
	 * @param limit 每页条数
	 * @return 查询结果map
	 */
	@RequestMapping("selectAllPro.do")
	@ResponseBody
	public ResultMap<Profession> SelectAllPro(int page,int limit) {
		try {
			PageHelper.startPage(page, limit);//开启分页查询
			List<Profession> professions=proServiceI.selectAllPro();
			PageInfo<Profession> pageInfo=new PageInfo<Profession>(professions);//制作分页效果，利用page,limit制作页面数据
			professions=pageInfo.getList();//获得该页当前列表
			resultMap.setTotal(pageInfo.getTotal());//返回数据库信息列表总条数
			resultMap.setList(professions);
		} catch (Exception e) {
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 删除专业信息
	 * @param pid 专业pid
	 * @return 结果map
	 */
	@RequestMapping("deleteProById.do")
	@ResponseBody
	public ResultMap<?> deleteProById(String pid) {
		try {
			proServiceI.deleteProById(pid);
			resultMap.setStatus(true);
		} catch (Exception e) {
			resultMap.setStatus(false);
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 插入专业信息
	 * @param pName 专业名称
	 * @return 结果map
	 */
	@RequestMapping("insertPro.do")
	@ResponseBody
	public ResultMap<?> insertPro(String pName) {
		try {
			proServiceI.insertPro(pName);
			resultMap.setStatus(true);
		} catch (Exception e) {
			resultMap.setStatus(false);
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
	
	/**
	 * 修改专业信息
	 * @param proStr json格式的专业信息
	 * @return 结果map
	 */
	@RequestMapping("updatePro.do")
	@ResponseBody
	public ResultMap<?> updatePro(String proStr) {
		try {
			proServiceI.updatePro(proStr);
			resultMap.setStatus(true);
		} catch (Exception e) {
			resultMap.setStatus(false);
			resultMap.setMessage(e.getMessage());
		}
		return resultMap;
	}
}

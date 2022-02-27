package service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import db.bean.Classt;
import db.dao.ClasstDao;

/**
 *  班级管理接口实现类
 * @author Jiuyu
 *
 */
@Service
public class ClasstServiceImpl implements ClasstServiceI {
	@Autowired
	private ClasstDao classtDao;
	
	@Override
	public List<Classt> selectAllClasst() {
		return classtDao.selectAllClasst();
	}
	
	@Override
	public int deleteClasstByClid(String clid) {
		if("".equals(clid)) {
			throw new RuntimeException("未选中任何行！");
		}
		int i=classtDao.deleteClasstByClid(clid);//删除班级信息
		if(i!=1) {
			throw new RuntimeException("系统错误，你删除的信息可能不正确，请联系管理员！");
		}
		return i;
	}

	@Override
	public int insertClasst(String classN,String classType) {
		if("".equals(classN)) {
			throw new RuntimeException("请输入班号！");
		}
		if("".equals(classType)) {
			throw new RuntimeException("请输入班型！");
		}
		int classNInt=Integer.parseInt(classN);//将字符串类型数据转换成整数
		String clid=UUID.randomUUID().toString();//生成唯一的id，不可能重复
		Classt classt=new Classt();//创建班级实例
		classt.setClid(clid);
		classt.setClassN(classNInt);
		classt.setClassNum(0);//班级人数默认为零
		classt.setClassType(classType);
		int i=classtDao.insertClasst(classt);//插入数据
		if(i!=1) {
			throw new RuntimeException("系统错误，你插入的信息可能不正确，请联系管理员！");
		}
		return i;
	}
	
	@Override
	public int updateClasst(String classtStr) throws JsonParseException, JsonMappingException, IOException {
		//springMvc框架转换json格式数据时，可以使用两种方式
		//1、com.albaba.fastjson.jar   	 Object obj = JSONObject.parseObject(要转换成对象的json字符串, 对象的类名.class);
		//2、com.fasterxml.jackson.jar
		Classt classt=new ObjectMapper().readValue(classtStr, Classt.class);//将json字符串格式数据转换成Profession类对象
		int i=classtDao.updateClasst(classt);
		if(i!=1) {
			throw new RuntimeException("系统错误，你插入的信息可能不正确，请联系管理员！");
		}
		return i;
	}
}

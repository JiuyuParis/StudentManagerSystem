package service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import db.bean.Grade;
import db.dao.GradeDao;

@Service
public class GradeServiceImpl implements GradeServiceI {
	@Autowired
	private GradeDao gradeDao;
	
	@Override
	public List<Grade> selectAllGrade() {
		return gradeDao.selectAllGrade();
	}
	
	@Override
	public int deleteGradeByGid(String gid) {
		if("".equals(gid)) {
			throw new RuntimeException("未选中任何行！");
		}
		int i=gradeDao.deleteGradeByGid(gid);//删除年级信息
		if(i!=1) {
			throw new RuntimeException("系统错误，你删除的信息可能不正确，请联系管理员！");
		}
		return i;
	}
	
	@Override
	public int insertGrade(String grade) {
		if("".equals(grade)) {
			throw new RuntimeException("未选中任何行！");
		}
		int gradeInt=Integer.parseInt(grade);//将字符串类型数据转换成整数
		String gid=UUID.randomUUID().toString();//生成唯一的id，不可能重复
		Grade gradeInstance=new Grade();
		gradeInstance.setGid(gid);
		gradeInstance.setGrade(gradeInt);
		gradeInstance.setStuCount(0);//学生人数默认为0
		int i=gradeDao.insertGrade(gradeInstance);//插入数据
		if(i!=1) {
			throw new RuntimeException("系统错误，你插入的信息可能不正确，请联系管理员！");
		}
		return i;
	}
	
	@Override
	public int updateGrade(String gradeStr) throws JsonParseException, JsonMappingException, IOException {
		//springMvc框架转换json格式数据时，可以使用两种方式
		//1、com.albaba.fastjson.jar   	 Object obj = JSONObject.parseObject(要转换成对象的json字符串, 对象的类名.class);
		//2、com.fasterxml.jackson.jar
		Grade grade=new ObjectMapper().readValue(gradeStr, Grade.class);//将json字符串格式数据转换成Profession类对象
		int i=gradeDao.updateGrade(grade);
		if(i!=1) {
			throw new RuntimeException("系统错误，你插入的信息可能不正确，请联系管理员！");
		}
		return i;
	}
}

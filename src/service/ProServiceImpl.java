package service;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import db.bean.Profession;
import db.dao.ProDao;

@Service
public class ProServiceImpl implements ProServiceI {
	@Autowired
	private ProDao proDao;
	
	@Override
	public List<Profession> selectAllPro() {
		return proDao.selectAllPro();
	}
	
	@Override
	public int deleteProById(String pid) {
		if("".equals(pid)) {
			throw new RuntimeException("未选中任何行！");
		}
		int i=proDao.deleteProById(pid);//删除专业信息
		if(i!=1) {
			throw new RuntimeException("系统错误，你删除的信息可能不正确，请联系管理员！");
		}
		return i;
	}
	
	@Override
	public int insertPro(String pName) {
		if("".equals(pName)) {
			throw new RuntimeException("请输入专业名称！");
		}
		String pid=UUID.randomUUID().toString();//生成唯一的id，不可能重复
		int count=0;//专业人数默认为零
		Date createtime=new Date(new java.util.Date().getTime());
		Profession profession=new Profession();//创建专业类对象
		profession.setPid(pid);
		profession.setCount(count);
		profession.setpName(pName);
		profession.setCreatetime(createtime);
		int i=proDao.insertPro(profession);//添加专业信息
		if(i!=1) {
			throw new RuntimeException("系统错误，你插入的信息可能不正确，请联系管理员！");
		}
		return i;
	}
	
	@Override
	public int updatePro(String proStr) throws JsonParseException, JsonMappingException, IOException {
		//springMvc框架转换json格式数据时，可以使用两种方式
		//1、com.albaba.fastjson.jar   	 Object obj = JSONObject.parseObject(要转换成对象的json字符串, 对象的类名.class);
		//2、com.fasterxml.jackson.jar
		Profession profession=new ObjectMapper().readValue(proStr, Profession.class);//将json字符串格式数据转换成Profession类对象
		int i=proDao.updatePro(profession);
		if(i!=1) {
			throw new RuntimeException("系统错误，你插入的信息可能不正确，请联系管理员！");
		}
		return i;
	}

}

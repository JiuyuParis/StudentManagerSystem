package utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
/**
 * 登陆返回结果类
 * @author Jiuyu
 *
 */
@Component("resultMap")
public class ResultMap<T> {
	private boolean status;
	private String message;
	private long total;//查询返回数据总条数
	private Object object;//每条数据
	private List<T> list=new ArrayList<T>();//数据列表
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long l) {
		this.total = l;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}


}

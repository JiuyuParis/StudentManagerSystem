package db.bean;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 专业信息实体类
 * @author Jiuyu
 *
 */
public class Profession {
	private String pid;
	private String pName;
	private int count;
	@JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
	private Date createtime;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
}

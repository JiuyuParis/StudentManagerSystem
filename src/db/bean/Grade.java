package db.bean;

/**
 * 年级实体类
 * @author Jiuyu
 *
 */
public class Grade {
	private String gid;
	private int grade;
	private int stuCount;
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getStuCount() {
		return stuCount;
	}
	public void setStuCount(int stuCount) {
		this.stuCount = stuCount;
	}
	
}

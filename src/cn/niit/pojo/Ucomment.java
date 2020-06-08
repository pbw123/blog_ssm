package cn.niit.pojo;

import java.sql.Timestamp;
/**
 * 此实体类对应于ucomment视图，方便进行查询
 * @author star
 *
 */
public class Ucomment {
	private int aid;//文章主键
	private int cid;//评论主键
	private String ccontent;//评论内容
	private String userName;//评论用户
	private String title;//评论的文章标题
	private Timestamp publishTime;//评论发布时间
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Timestamp getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}
	
	

}

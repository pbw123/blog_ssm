package cn.niit.pojo;

import java.sql.Timestamp;
/**
 * ��ʵ�����Ӧ��ucomment��ͼ��������в�ѯ
 * @author star
 *
 */
public class Ucomment {
	private int aid;//��������
	private int cid;//��������
	private String ccontent;//��������
	private String userName;//�����û�
	private String title;//���۵����±���
	private Timestamp publishTime;//���۷���ʱ��
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

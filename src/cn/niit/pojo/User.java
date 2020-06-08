package cn.niit.pojo;

import java.util.List;

public class User {
	private int id;
	private String email;
	private String userName;
	private int isApplied;
	private int isDelete;
	private int isProfile;
	private List<Article>articles;
	private String password;
	
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Article> getArticles() {
		return articles;
	}
	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
		@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", userName=" + userName + ", isApplied=" + isApplied
				+ ", isDelete=" + isDelete + ", isProfile=" + isProfile + ", articles=" + articles + "]";
	}
		public int getIsProfile() {
		return isProfile;
	}
	public void setIsProfile(int isProfile) {
		this.isProfile = isProfile;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public int getIsApplied() {
		return isApplied;
	}
	public void setIsApplied(int isApplied) {
		this.isApplied = isApplied;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

}

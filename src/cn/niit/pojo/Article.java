package cn.niit.pojo;

import java.sql.Timestamp;
import java.util.List;

public class Article {
	private int id;
	private String title;
	private int userId;
	private int sysCategoryId;
	private int categoryId;
	private String content;
	private String summary;
	private Timestamp publishTime;
	private int isTop;
	private int isDelete;
	private int count;
	private String userName = "";// 以下三个属性用户多表查询
	private String categoryName = "";
	private String scName = "";
	private User user;
	private List<Com> coms;
	private SysCategory sCategory;
	private Category category;
    private List<Article> article;
	
	
	public List<Article> getArticle() {
		return article;
	}
	public void setArticle(List<Article> article) {
		this.article = article;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", userId=" + userId + ", sysCategoryId=" + sysCategoryId
				+ ", categoryId=" + categoryId + ", content=" + content + ", summary=" + summary + ", publishTime="
				+ publishTime + ", isTop=" + isTop + ", isDelete=" + isDelete + ", count=" + count + ", userName="
				+ userName + ", categoryName=" + categoryName + ", scName=" + scName + ", user=" + user + ", coms="
				+ coms + ", sCategory=" + sCategory + ", category=" + category + "]";
	}
	public List<Com> getComs() {
		return coms;
	}
	public void setComs(List<Com> coms) {
		this.coms = coms;
	}
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public SysCategory getsCategory() {
		return sCategory;
	}

	public void setsCategory(SysCategory sCategory) {
		this.sCategory = sCategory;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSysCategoryId() {
		return sysCategoryId;
	}

	public void setSysCategoryId(int sysCategoryId) {
		this.sysCategoryId = sysCategoryId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Timestamp getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Timestamp publishTime) {
		this.publishTime = publishTime;
	}

	public int getIsTop() {
		return isTop;
	}

	public void setIsTop(int isTop) {
		this.isTop = isTop;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getScName() {
		return scName;
	}

	public void setScName(String scName) {
		this.scName = scName;
	}

}

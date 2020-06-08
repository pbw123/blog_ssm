package cn.niit.pojo;


public class BlogInfo {
	private int id;
	private int userId;
	private String blogName;
	private String description;
	private String annoucement;
	private User user;
	@Override
	public String toString() {
		return "BlogInfo [id=" + id + ", userId=" + userId + ", blogName=" + blogName + ", description=" + description
				+ ", annoucement=" + annoucement + ", user=" + user + "]";
	}
	
		public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getBlogName() {
		return blogName;
	}
	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAnnoucement() {
		return annoucement;
	}
	public void setAnnoucement(String annoucement) {
		this.annoucement = annoucement;
	}
	
	
	
	
}

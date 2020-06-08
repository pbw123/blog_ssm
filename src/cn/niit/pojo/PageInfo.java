package cn.niit.pojo;

import java.util.List;

public class PageInfo {
private int pageStart;


private int pageNum=1;
private int total;
private int pageSize;
private List lists;

public PageInfo(String pageNum, int total) {
	if (null != pageNum) {
		this.pageNum = Integer.parseInt(pageNum);    //初始化当前页数
	}	
	this.total = total;							//初始化总行数		
	this.pageSize=5;//设置每页显示的记录数
	this.pageStart=pageSize*(this.pageNum-1);
	//计算总页数
	this.total = (this.total / this.pageSize) + ((this.total % this.pageSize) > 0 ? 1 : 0);
}
public int getPageStart() {
	return pageStart;
}
public void setPageStart(int pageStart) {
	this.pageStart = pageStart;
}
public List getLists() {
	return lists;
}
public void setLists(List lists) {
	this.lists = lists;
}
public int getPageNum() {
	return pageNum;
}
public void setPageNum(int pageNum) {
	this.pageNum = pageNum;
}
public int getTotal() {
	return total;
}
public void setTotal(int total) {
	this.total = total;
}
public int getPageSize() {
	return pageSize;
}

public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
}

}

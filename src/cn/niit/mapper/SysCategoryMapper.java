package cn.niit.mapper;

import java.util.List;


import cn.niit.pojo.Article;
import cn.niit.pojo.PageInfo;
import cn.niit.pojo.SysCategory;

public interface SysCategoryMapper {
	//网站分类
	List<SysCategory> getAllSysCategory();
	//<!-- 活跃博主 -->
	List<Article> getActiveUser(int num);
//	前十文章
	List<Article>topTenArticle();
//	文章总数
	int ArticleCount();
//	分页
	List<Article>page(PageInfo pageInfo);
//	
	int addCount(Integer count,Integer id);
	
	
	List<Article> search(String value);
	
}

package cn.niit.mapper;

import cn.niit.pojo.BlogInfo;

public interface UpdBlogInfo {

	BlogInfo selBlogInfo(Integer userId);

	int insBlog(BlogInfo blogInfo);
	
	int updBlog(BlogInfo blogInfos);
}

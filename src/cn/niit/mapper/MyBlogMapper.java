package cn.niit.mapper;

import cn.niit.pojo.BlogInfo;
import cn.niit.pojo.User;

public interface MyBlogMapper {
	BlogInfo getMyBlog(User user);
}

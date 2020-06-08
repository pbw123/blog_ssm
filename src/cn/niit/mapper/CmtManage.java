package cn.niit.mapper;

import java.util.List;

import cn.niit.pojo.Article;
import cn.niit.pojo.Com;
import cn.niit.pojo.User;

public interface CmtManage {

	List<Article> selArtCmtMng(User user);
	
	int delComment(int cmtId);
	
	int addComment(int userId,int articalId,String content);
	
/*	List<Com> selCmt(Integer userId);
*/}

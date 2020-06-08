package cn.niit.service;

import java.util.List;

import cn.niit.pojo.Article;
import cn.niit.pojo.BlogInfo;
import cn.niit.pojo.Category;
import cn.niit.pojo.Com;
import cn.niit.pojo.Counter;
import cn.niit.pojo.PageInfo;
import cn.niit.pojo.Profile;
import cn.niit.pojo.SysCategory;
import cn.niit.pojo.User;

public interface SysCategoryService {
	List<SysCategory> getAllSysCategory();
	
	List<Article> getActiveUser(int num);
	
	List<Article>topTenArticle();
	
	PageInfo pageControl(String pageNum);
	
	
//	������ҳ
	Article ArticleComment(Integer tid);
	int addCount(Integer count,Integer id);
	BlogInfo getMyBlog(User user);
	
//	��¼
	User getLogin(User user);
	
//	ע��
	User selRegister(User user);
	User selByEmail(User user);
	int  insRegister(User user);

//	���¹���
	List<Article> selManage(Integer id);
	int removeArticle(Integer artId);
    Article selArticleInfo(Integer artId);
    int updArt(String title,String summary,String content,Integer categoryId,
    		Integer sysCategoryId,Integer id);

//	�������
	List<Category> selCategory(Integer userId);
	int insCategory(Integer id,String name);
	int deleteCategory(int id);
	int updCategory(String categoryName,Integer cgId);
	Category selCg(Integer cgId);
	 int updCateArticles(Integer categoryId,Integer userId);

	

//	���۹���
	List<Article> selArtCmtMng(User user);
	int delComment(int cmtId);
	int addComment(int userId,int articalId,String content);
	List<Com> selCmt(Integer userId);


//	���¸�������
	int updProfile(Profile profile);
// ��������
	int updPassword(String newPwd,Integer userId);
//	��ѯ����
	User selOldPwd(String password,Integer userId);
//	
	Profile readOneProfile(Integer userId);


//	���²�����Ϣ
	BlogInfo selBlogInfo(Integer userId);
	
	int insBlog(BlogInfo blogInfo);
	
	int updBlog(BlogInfo blogInfos);
	int insArticle(Article article);

	
	List<Category> selArtCategory(Integer id);

	List<Article> search(String value);
	
	int applyBlog(String blogName,Integer userId,String description,String annoucement);

	int updIsApply(Integer userId);

	//ͳ����վ���ʴ���
	int setCountNum(Integer num);
	Counter getCountNum() ;

}

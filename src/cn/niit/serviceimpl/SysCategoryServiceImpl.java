package cn.niit.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.niit.mapper.AddArticle;
import cn.niit.mapper.ApplyMapper;
import cn.niit.mapper.ArticleMapper;
import cn.niit.mapper.CategoryManage;
import cn.niit.mapper.Cmt;
import cn.niit.mapper.CmtManage;
import cn.niit.mapper.CountMappeor;
import cn.niit.mapper.LoginMapper;
import cn.niit.mapper.ManageMapper;
import cn.niit.mapper.MyBlogMapper;
import cn.niit.mapper.ProFileMapper;
import cn.niit.mapper.Register;
import cn.niit.mapper.SysCategoryMapper;
import cn.niit.mapper.UpdBlogInfo;
import cn.niit.pojo.Article;
import cn.niit.pojo.BlogInfo;
import cn.niit.pojo.Category;
import cn.niit.pojo.Com;
import cn.niit.pojo.Counter;
import cn.niit.pojo.PageInfo;
import cn.niit.pojo.Profile;
import cn.niit.pojo.SysCategory;
import cn.niit.pojo.User;
import cn.niit.service.SysCategoryService;

@Service
public class SysCategoryServiceImpl implements SysCategoryService {
	@Autowired
	private SysCategoryMapper sysCategoryMapper;
	@Autowired
	private ArticleMapper articleMapper;
	@Autowired
	private MyBlogMapper myBlogMapper;
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private Register register;
	@Autowired
	private ManageMapper manageMapper;
	@Autowired
	private CategoryManage categoryManage;
    @Autowired
    private CmtManage cmtManage;
	@Autowired
	private ProFileMapper proFileMapper;
	@Autowired
	private UpdBlogInfo blogInfo;
	@Autowired
	private AddArticle addArticle;
	@Autowired
	private Cmt cmt;
	@Autowired 
	private ApplyMapper applyMapper;
	@Autowired
	private CountMappeor countMappeor;
	
	@Override
	public List<SysCategory> getAllSysCategory() {
		return sysCategoryMapper.getAllSysCategory();
	}

	@Override
	public List<Article> getActiveUser(int num) {
		return sysCategoryMapper.getActiveUser(num);
	}

	@Override
	public List<Article> topTenArticle() {
		return sysCategoryMapper.topTenArticle();
	}
	@Override
	public int addCount(Integer count, Integer id) {
		return sysCategoryMapper.addCount(count,id);
	}
	@Override
	public List<Article> search(String value) {
		return sysCategoryMapper.search(value);
	}
	
	
	

	@Override
	public PageInfo pageControl(String pageNum) {
		int articleCount = sysCategoryMapper.ArticleCount();
		PageInfo pageInfo = new PageInfo(pageNum, articleCount);
		List<Article> page = sysCategoryMapper.page(pageInfo);
		pageInfo.setLists(page);
		return pageInfo;
	}

	
//	分割线=================文章管理
	
	@Override
	public Article ArticleComment(Integer artId) {
		return articleMapper.ArticleComment(artId);
	}
	@Override
	public int removeArticle(Integer artId) {
		return articleMapper.removeArticle(artId);
	}
	@Override
	public Article selArticleInfo(Integer artId) {
		return articleMapper.selArticleInfo(artId);
	}

@Override
public int updArt(String title, String summary, String content, Integer categoryId, Integer sysCategoryId, Integer id) {
	return articleMapper.updArt(title, summary, content, categoryId, sysCategoryId, id);
}
	
	
	
//	分割线=================

@Override
public BlogInfo getMyBlog(User user) {
	return 	myBlogMapper.getMyBlog(user);
}


//	分割线=================登录


@Override
public User getLogin(User user ) {
	return loginMapper.getLogin(user);
	
}


//分割线=================注册


@Override
public User selRegister(User user) {
	return register.selRegister(user);
}

@Override
public int insRegister(User user) {
	return 	register.insRegister(user);
}

@Override
public User selByEmail(User user) {
	return 	register.selByEmail(user);

}


//分割线=================注册


@Override
public List<Article> selManage(Integer id) {
	return manageMapper.selManage(id);
}


//分割线=================分类管理


@Override
public List<Category> selCategory(Integer userId) {
	return 	 categoryManage.selCategory(userId);
}
@Override
public int insCategory(Integer id,String name) {
	return categoryManage.insCategory(id,name);
}
@Override
public int deleteCategory(int id) {
	return categoryManage.deleteCategory(id);
}
@Override
public int updCategory(String categoryName, Integer cgId) {
	return categoryManage.updCategory(categoryName,cgId);
}

@Override
public Category selCg(Integer cgId) {
	return  categoryManage.selCg(cgId);
}
@Override
public int updCateArticles(Integer categoryId,Integer userId) {
	return categoryManage.updCateArticles(categoryId,userId);
}


//分割线=================评论管理


@Override
public List<Article> selArtCmtMng(User user) {
	return cmtManage.selArtCmtMng(user); 
}
@Override
public int delComment(int cmtId) {
	return cmtManage.delComment(cmtId);
}
@Override
public int addComment(int userId, int articalId, String content) {
	return cmtManage.addComment(userId,articalId,content);
}
/*
@Override
public List<Com> selCmt(Integer userId) {
	return cmtManage.selCmt(userId);
}*/
@Override
public List<Com> selCmt(Integer userId) {
	return cmt.selCmt(userId);
}



//分割线=================个人简介


@Override
public int updProfile(Profile profile) {
	return proFileMapper.updProfile(profile);
}

@Override
public int updPassword(String newPwd,Integer userId) {
	return 	proFileMapper.updPassword(newPwd,userId);
}

@Override
public User selOldPwd(String password,Integer userId) {
	return proFileMapper.selOldPwd(password,userId);
}
@Override
public Profile readOneProfile(Integer userId) {
	return proFileMapper.readOneProfile(userId);
}


//分割线=================修改博客信息


@Override
public BlogInfo selBlogInfo(Integer userId) {
	return blogInfo.selBlogInfo(userId);
}

@Override
public int insBlog(BlogInfo blogInfos) {
	return blogInfo.insBlog(blogInfos);
}

@Override
public int updBlog(BlogInfo blogInfos) {
	return blogInfo.updBlog(blogInfos);
}

@Override
public int insArticle(Article article) {
	return addArticle.insArticle(article);
}

@Override
public List<Category> selArtCategory(Integer id) {
	return 	 addArticle.selArtCategory(id);
}



@Override
public int applyBlog(String blogName, Integer userId, String description, String annoucement) {
	return 	applyMapper.applyBlog(blogName, userId, description, annoucement);
}

@Override
public int updIsApply(Integer userId) {
	return applyMapper.updIsApply(userId);
}

@Override
public int setCountNum(Integer num) {
	return countMappeor.setCountNum(num);
}

@Override
public Counter getCountNum() {
	return countMappeor.getCountNum();
}










	
	
}

package cn.niit.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

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

@Controller
public class SysCategoryController {
	@Autowired
	private SysCategoryService SysCategoryServiceImpl;
	 @Autowired
	    private HttpServletRequest request; //�Զ�ע��request
	 
//	 ��ҳ
     @RequestMapping("/SysCategoryList")
	public String SysCategoryList(Model model,@RequestParam(defaultValue="1")String pageNum) {
    	 List<SysCategory> allSysCategory = SysCategoryServiceImpl.getAllSysCategory();
    	 model.addAttribute("allSysCategory", allSysCategory);
    	 
    	 List<Article> activeUser = SysCategoryServiceImpl.getActiveUser(2);
    	 model.addAttribute("activeUser", activeUser);
    	 
    	 List<Article> topTenArticle = SysCategoryServiceImpl.topTenArticle();
    	 model.addAttribute("topTenArticle", topTenArticle);
    	 
    	    PageInfo pageInfo = SysCategoryServiceImpl.pageControl(pageNum);
    	 model.addAttribute("pageInfo", pageInfo);
    	 
    	 Counter countNum = SysCategoryServiceImpl.getCountNum();
    	 Integer count = countNum.getCount();
    	 ++count;
    	 System.out.println(count);
    	 request.getSession().setAttribute("num", count);
    	 SysCategoryServiceImpl.setCountNum(count);
    	 
		return "Index";
	}
     
//     ���¼�����
     @RequestMapping(value="ArtCom",method= {RequestMethod.POST,RequestMethod.GET})
     public String ArtCom(Model model,Integer artId){
    	 Article artCom = SysCategoryServiceImpl.ArticleComment(artId);
    	 Integer count = artCom.getCount();
    	 count++;
    	 SysCategoryServiceImpl.addCount(count, artId);
    	 artCom.setCount(count);
    	 model.addAttribute("artCom", artCom);
    	 return "Post";
     }
//   �������
    @RequestMapping(value="addCom",method= {RequestMethod.POST,RequestMethod.GET})
    private String addCom(Integer userId,Integer artId,String comment_content) {
   	 if (userId==null) {
   		 request.setAttribute("info", "���ȵ�¼");
   		 return "Login";
	}
   	 SysCategoryServiceImpl.addComment(userId, artId, comment_content);
   	 request.setAttribute("succMsg", "���۳ɹ�");
   	 return "forward:ArtCom";
    }
    //��ѯ�������۹�����ѯ�����˺����±���
    @RequestMapping("selAllCmt")
    private String selAllCmt(Integer userId) {
   	 
   	 List<Com> selCmt = SysCategoryServiceImpl.selCmt(userId);
   	 request.setAttribute("selCmt", selCmt);
   	 return "CommentManage";
//   	 return "test";
    }
//  ���۹���
  @RequestMapping(value="artCmtMng")
  public String artCmtMng(Model model,Integer userId){
 	 
 	 User user=new User();
 	 user.setId(userId);
 	 List<Article> articles = SysCategoryServiceImpl.selArtCmtMng(user);
 	 model.addAttribute("articles",articles);
// 	 return "test";
 	 return "CommentManage";
  }
//  ɾ������
  @RequestMapping("deleteComment")
  private String deleteComment(int cmtId,Integer userId) {
 	 
 	 SysCategoryServiceImpl.delComment(cmtId);
 	 request.setAttribute("succDeleMsg", "ɾ�����۳ɹ�");
 	 return "forward:artCmtMng";
  }
    
  
//     �ҵĲ���
     @RequestMapping(value="myBlogController",method= {RequestMethod.GET,RequestMethod.POST})
     public String myBlogController(Model model,int userId) {
    	 User user=new User();
    	 user.setId(userId);
    	 BlogInfo blogInfo=SysCategoryServiceImpl.getMyBlog(user);
    	 model.addAttribute("blogInfo", blogInfo);
    	 return "MyBlogIndex";
     }
     
//     ��¼
     @RequestMapping(value = "login", method = {RequestMethod.POST,RequestMethod.GET},params = { "username","password" })
     public String login(HttpSession session,Model model,@RequestParam("username")String userName,@RequestParam("password")String password) {
    	 User u =new User();
    	 u.setUserName(userName);
    	 u.setPassword(password);
    	 User user = SysCategoryServiceImpl.getLogin(u);
    	 if (user==null) {
			request.setAttribute("msg", "�û���û��ע��");
			return "Login";
		}else {
			if (user.getIsDelete()==1) {
				request.setAttribute("userIsDeleMsg", "�û��ѱ�����");
				return "Login";
			}else {
				session.setAttribute("user", user);
			}
		}
    	 return "forward:SysCategoryList";
     }
//     ��¼���
     @RequestMapping("entryLogin")
     private String entryLogin() {
    	 return "Login";
     }
     
     
//     �ǳ�
     @RequestMapping("logout")
     private String logout() {
    	 HttpSession session=request.getSession();
    	session.removeAttribute("user");
    	 return "forward:SysCategoryList";
     }
//     ע�����
     @RequestMapping("entryRegister")
     public String entryRegister() {
		return "Register";
     }
     
     
     //ע��
     @RequestMapping(value = "register", method = {RequestMethod.POST,RequestMethod.GET},params = { "username","password","email" })
     public String Register(@RequestParam("username")String userName,@RequestParam("password")String password,@RequestParam("email")String email) {
    	User user=new User();
    	user.setUserName(userName);
    	user.setPassword(password);
    	user.setEmail(email);
    	 User user2 = SysCategoryServiceImpl.selRegister(user);
    	 User user3 = SysCategoryServiceImpl.selByEmail(user);
    	 
    	 if (user2==null&&user3==null) {
    		 int insRegister = SysCategoryServiceImpl.insRegister(user);
    		 if (insRegister>0) {
				request.setAttribute("suc", "ע��ɹ�");
			}else {
				request.setAttribute("error", "ע��ʧ�ܣ�����������");
			}
		}else {
			request.setAttribute("exitError", "�û����������Ѿ���ʹ��");
		}
//    	 return "test";
    	 return "Register";
     }
//     ���Ĺ���
     @RequestMapping(value="manage")
     public String manage(Model model,Integer userId) {
    	 List<Article> selManage = SysCategoryServiceImpl.selManage(userId);
    	 model.addAttribute("selManage", selManage);
//    	 return "test";
    	 return "ArticleManage";
     }
//     ɾ������
     @RequestMapping("removeArt")
     private String removeArt(Integer artId,Integer userId) {
    	 SysCategoryServiceImpl.removeArticle(artId);
    	 request.setAttribute("deleSuccMsg", "ɾ�����³ɹ�");
    	 return "forward:manage";
     }
     
//     �������
     @RequestMapping(value="categoryManage")
     public String categoryManage(Model model,Integer userId,String categoryName){
    	 List<Category> categorys = SysCategoryServiceImpl.selCategory(userId);
    	 model.addAttribute("categorys",categorys);
//    	 return "test";
    	 return "CategoryManage";
     }
//     �½��������
     @RequestMapping("AddCategory")
     private String AddCategory() {
    	 return "AddCategory";
     }
//     ɾ������
     @RequestMapping(value="delCategory",method=RequestMethod.GET)
     private String delCategory(int cgId) {
    	 SysCategoryServiceImpl.deleteCategory(cgId);
    	 request.setAttribute("succDeleMsg", "ɾ������ɹ�");
    	 return "forward:categoryManage";
     }
     
//   ��Ӹ��˷���
   @RequestMapping(value = "createCategory", method = {RequestMethod.POST,RequestMethod.GET})
   private String createCategory(int userId,String categoryName) {
   	SysCategoryServiceImpl.insCategory(userId,categoryName);
   	request.setAttribute("succAddMsg", "�½�����ɹ�");
   	return "forward:categoryManage";
   }
//   �޸ķ���
   @RequestMapping(value = "updCategory", method = {RequestMethod.POST,RequestMethod.GET})
   private String updCategory(Integer cgId,String category_name) {
   	SysCategoryServiceImpl.updCategory(category_name, cgId);
   	request.setAttribute("succAddMsg", "�޸������ɹ�");
   	return "forward:categoryManage";
   }
//    ��ȡһ������ 
   @RequestMapping(value = "selCategory", method = {RequestMethod.POST,RequestMethod.GET})
   private String selCategory(Integer cgId) {
   	Category selCg = SysCategoryServiceImpl.selCg(cgId);
   	request.setAttribute("cg", selCg);
   	return "EditCategory";
   }
     

     
//     �޸ĸ�������
     @RequestMapping(value="updProfile",method= {RequestMethod.POST,RequestMethod.GET})
     public String 	updProfile(Integer userId,String firstName,String lastName,String telephone,String gender) {
    	 int gen=0;
    	 Profile profile=new Profile();
    	 profile.setUserId(userId);
    	 profile.setFirstName(firstName);
    	 profile.setLastName(lastName);
    	 profile.setGender(gen);
    	 profile.setTelephone(telephone);
    	SysCategoryServiceImpl.updProfile(profile);
    	request.setAttribute("succUpdateMsg", "�޸ĳɹ�");
    	 return "forward:Profile";
     }
//     ��ȡһ���˵���Ϣ������/// �༭������Ϣ���
     @RequestMapping("Profile")
     public String Profile(Integer userId) {
    	Profile profile= SysCategoryServiceImpl.readOneProfile(userId);
    	request.setAttribute("profile", profile);
    	 return "Profile";
     }

//     �޸�����
    @RequestMapping(value="updPassword",method= {RequestMethod.POST,RequestMethod.GET},params= {"userId","old_pwd","new_pwd"})
     public String updPassword(Integer userId,String old_pwd,String new_pwd) {
    	
    	User selOldPwd = SysCategoryServiceImpl.selOldPwd(old_pwd,userId);
    	if (selOldPwd!=null) {
			User user=new User();
	    	user.setPassword(new_pwd);
	    	int updPassword = SysCategoryServiceImpl.updPassword(new_pwd,userId);

	    	if (updPassword>0) {
	    		request.setAttribute("suc", "�޸�����ɹ�,�����µ�¼");
	    		 HttpSession session=request.getSession();
	    	    	session.removeAttribute("user");
	    	    	return "Login";
			}
		}else {
			request.setAttribute("errorMsg", "�������������������");
		}
    	 return "Profile";
     }
    
//    ���Ĳ�����Ϣ
    @RequestMapping(value="updBlog",method= {RequestMethod.POST,RequestMethod.GET},params= {"userId","blogName","description","annoucement"})
    private String updBlog(String userId,String blogName,String description,String annoucement) {
    	
    	int parseInt = Integer.parseInt(userId);
    	BlogInfo selBlogInfo = SysCategoryServiceImpl.selBlogInfo(parseInt);
    	request.setAttribute("selBlogInfo", selBlogInfo);
    	
    	BlogInfo blogInfo=new BlogInfo();
		blogInfo.setAnnoucement(annoucement);
		blogInfo.setBlogName(blogName);
		blogInfo.setDescription(description);
		blogInfo.setUserId(parseInt);
		 int updBlog = SysCategoryServiceImpl.updBlog(blogInfo);
		if (updBlog>0) {
			BlogInfo selBlogInfo2 = SysCategoryServiceImpl.selBlogInfo(parseInt);
			request.setAttribute("suc", "���²��ͳɹ�");
			request.setAttribute("selBlogInfo", selBlogInfo2);
		}
    	return "BlogInfo";
    }
    
    @RequestMapping("selBlog")
    private String selBlog(Integer userId) {
		BlogInfo selBlogInfo2 = SysCategoryServiceImpl.selBlogInfo(userId);
		request.setAttribute("selBlogInfo", selBlogInfo2);

    	return "BlogInfo";
    }
    
//�½�����
    @RequestMapping(value="addArt",method= {RequestMethod.POST,RequestMethod.GET})
    private String addArt(Integer artId,String title,Integer userId,String content,String summary,@RequestParam(defaultValue="1")Integer sysCategoryId,@RequestParam(defaultValue="1")Integer category) {
    	if (artId!=null) {
    		SysCategoryServiceImpl.updArt(title, summary, content, category, sysCategoryId, artId);
    		return"forward:ArtCom";
		}else {
			Article article=new Article();
	    	article.setTitle(title);
	    	article.setUserId(userId);
	    	article.setContent(content);
	    	article.setSummary(summary);
	    	article.setSysCategoryId(sysCategoryId);
	    	article.setCategoryId(category);
	    	SysCategoryServiceImpl.insArticle(article);
	    	SysCategoryServiceImpl.updCateArticles(category,userId);
		}
    	
    	return "forward:myBlogController";
    }
//    �½����µ�������
    @RequestMapping("createArt")
    private String createArt(Integer userId,Integer artId) {

    	List<SysCategory> allSysCategory = SysCategoryServiceImpl.getAllSysCategory();
    	request.setAttribute("allSC", allSysCategory);
    	
    	List<Category> selArtCategory = SysCategoryServiceImpl.selArtCategory(userId);
    	request.setAttribute("selAC", selArtCategory);
    	if (artId!=null) {
    		Article selArticleInfo = SysCategoryServiceImpl.selArticleInfo(artId);
        	request.setAttribute("selArticleInfo", selArticleInfo);
        	request.setAttribute("artId", artId);
		}
    	
    	return "AddArtical";
    }
    
//    ����
    @RequestMapping(value="seachArt",method= {RequestMethod.POST,RequestMethod.GET})
    private String seachArt(String value) {
    	List<Article> articles = SysCategoryServiceImpl.search(value);
    	request.setAttribute("articles", articles);
    	request.setAttribute("value", value);
    	return "SearchResult";
    }
   
    @RequestMapping(value="applyMyBlog",method= {RequestMethod.POST,RequestMethod.GET} )
    private String applyMyBlog(String blog_name,Integer userId,String description,String annoucement) {
    	
    	 SysCategoryServiceImpl.applyBlog(blog_name, userId, description, annoucement);
    	 SysCategoryServiceImpl.updIsApply(userId);
    	return "forward:myBlogController";
    }
    
    
    @RequestMapping("springUpload")
    public String  springUpload(HttpServletRequest request) throws IllegalStateException, IOException
    {
         long  startTime=System.currentTimeMillis();
         //����ǰ�����ĳ�ʼ����  CommonsMutipartResolver ���ಿ�ֽ�������
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //���form���Ƿ���enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request))
        {
            //��request��ɶಿ��request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
           //��ȡmultiRequest �����е��ļ���
            Iterator iter=multiRequest.getFileNames();
             
            while(iter.hasNext())
            {
                //һ�α��������ļ�
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    String path="D:/springUpload"+file.getOriginalFilename();
                    //�ϴ�
                    file.transferTo(new File(path));
                }
                 
            }
           
        }
        long  endTime=System.currentTimeMillis();
        System.out.println("������������ʱ�䣺"+String.valueOf(endTime-startTime)+"ms");
    return "/success"; 
    }
    
    
    
    
}

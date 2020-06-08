package cn.niit.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.niit.pojo.Boy;
import cn.niit.pojo.Girl;
import cn.niit.service.GirlService;
import cn.niit.serviceimpl.GirlServiceImpl;

@Controller
public class FileUploadController {
	 @RequestMapping(value="/{formName}")
	    public String loginForm(@PathVariable String formName){

	        return formName;

	    }

	    @RequestMapping(value="/gotoAction",method=RequestMethod.POST)
	    public String upload(@RequestParam("file") MultipartFile file,
	            HttpServletRequest request){

	        if (!file.isEmpty()) {

	            String contextPath = request.getContextPath();//"/SpringMvcFileUpload"
	            String servletPath = request.getServletPath();//"/gotoAction"
	            String scheme = request.getScheme();//"http"
	       

	            String storePath= "D:\\project\\SpringMvcFileUpload\\WebRoot\\images";//存放我们上传的文件路径

	            //获得上传文件的名字
	            String fileName = file.getOriginalFilename();
	          //加载上传的文件
	            File filepath = new File(storePath, fileName);
	          //查看目录是否存在，如何不存在就创建这个目录
	            if (!filepath.getParentFile().exists()) {

	                filepath.getParentFile().mkdirs();//如果目录不存在，创建目录

	            }

	            try {
	            	//保存文件
	                file.transferTo(new File(storePath+File.separator+fileName));//把文件写入目标文件地址

	            } catch (Exception e) {

	                e.printStackTrace();

	                return "error";

	            }

	            return "success";//返回到成功页面

	        }else {

	            return "error";//返回到失败的页面
	        }

	    }
	    
	    
	    @RequestMapping(value="/register",method=RequestMethod.POST)
	    public String reg(@ModelAttribute Boy boy,HttpServletRequest request,Map<String,Object> map){

	        final String wrong="error";

	        final String good="success";

	        MultipartFile headimage = boy.getHeadimage();

	        boolean empty = headimage.isEmpty();

	        if (!empty) {

	            String realPath = request.getServletContext().getRealPath("/images");

	            String uploadPath="D:\\userUploadFile\\Files";

	            String headimageName = headimage.getOriginalFilename();

	            File imageFile = new File(uploadPath,headimageName);

	            
	            try {

	                headimage.transferTo(new File(uploadPath+File.separator+headimageName));

	            } catch (Exception e) {

	                e.printStackTrace();

	                return wrong;

	            }
	            map.put("boy", boy);

	            return "userinfo";

	        }else {
	            return wrong;
	        }
	    }
	    
	    
	    @RequestMapping(value="/download",method=RequestMethod.GET) //匹配的是href中的download请求
	    public ResponseEntity<byte[]> download(HttpServletRequest request,@RequestParam("filename") String filename,
	            Model model) throws IOException{
	        
	        String downloadFilePath="D:\\userUploadFile\\Files";//从我们的上传文件夹中去取
	        
	        File file = new File(downloadFilePath+File.separator+filename);//新建一个文件
	        
	        HttpHeaders headers = new HttpHeaders();//http头信息
	        
	        String downloadFileName = new String(filename.getBytes("UTF-8"),"iso-8859-1");//设置编码
	        
	        headers.setContentDispositionFormData("attachment", downloadFileName);
	        
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        
	        //MediaType:互联网媒介类型  contentType：具体请求中的媒体类型信息
	        
	        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers,HttpStatus.CREATED);
	        
	    }
	    
	    @Autowired
	     private  GirlService girlServiceImpl;	
		
		@RequestMapping(value="/up",method=RequestMethod.POST)
		public String upload(Girl girl,HttpServletRequest request,Model model) throws Exception{
		  //保存数据库的路径
		  String sqlPath = null; 
		  //定义文件保存的本地路径
//	      String localPath="D:\\File\\";
		  String localPath="D:\\javaEE\\workspace2\\blog4\\WebContent\\img\\";
	      //定义 文件名
	      String filename=null;  
	      if(!girl.getFile().isEmpty()){  
	          //生成uuid作为文件名称  
	          String uuid = UUID.randomUUID().toString().replaceAll("-","");  
	          //获得文件类型（可以判断如果不是图片，禁止上传）  
	          String contentType=girl.getFile().getContentType();  
	          //获得文件后缀名 
	          String suffixName=contentType.substring(contentType.indexOf("/")+1);
	          //得到 文件名
	          filename=uuid+"."+suffixName; 
	          //文件保存路径
	          girl.getFile().transferTo(new File(localPath+filename));  
	      }
	      //把图片的相对路径保存至数据库
	      sqlPath = "/img/"+filename;
	      System.out.println(sqlPath);
	      girl.setImage(sqlPath);
	      girlServiceImpl.addGirl(girl);
	      
	      model.addAttribute("girl", girl);
		  return "/blog4/MyJsp.jsp";
		}
}

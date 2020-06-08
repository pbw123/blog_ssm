package cn.niit.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.niit.pojo.Girl;
import cn.niit.serviceimpl.GirlServiceImpl;

@Controller
public class GirlController {
 
	@Autowired
       GirlServiceImpl girlServiceImpl;	
	
	@RequestMapping(value="/up1",method=RequestMethod.POST)
	public String upload(Girl girl,HttpServletRequest request,Model model) throws Exception{
	  //保存数据库的路径
	  String sqlPath = null; 
	  //定义文件保存的本地路径
      String localPath="D:\\File\\";
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
      sqlPath = "/images/"+filename;
      System.out.println(sqlPath);
      girl.setImage(sqlPath);
      girlServiceImpl.addGirl(girl);
      model.addAttribute("girl", girl);
	  return "MyJsp";
	}
}

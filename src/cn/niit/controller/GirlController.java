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
	  //�������ݿ��·��
	  String sqlPath = null; 
	  //�����ļ�����ı���·��
      String localPath="D:\\File\\";
      //���� �ļ���
      String filename=null;  
      if(!girl.getFile().isEmpty()){  
          //����uuid��Ϊ�ļ�����  
          String uuid = UUID.randomUUID().toString().replaceAll("-","");  
          //����ļ����ͣ������ж��������ͼƬ����ֹ�ϴ���  
          String contentType=girl.getFile().getContentType();  
          //����ļ���׺�� 
          String suffixName=contentType.substring(contentType.indexOf("/")+1);
          //�õ� �ļ���
          filename=uuid+"."+suffixName; 
          //�ļ�����·��
          girl.getFile().transferTo(new File(localPath+filename));  
      }
      //��ͼƬ�����·�����������ݿ�
      sqlPath = "/images/"+filename;
      System.out.println(sqlPath);
      girl.setImage(sqlPath);
      girlServiceImpl.addGirl(girl);
      model.addAttribute("girl", girl);
	  return "MyJsp";
	}
}

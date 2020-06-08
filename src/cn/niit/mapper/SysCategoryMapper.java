package cn.niit.mapper;

import java.util.List;


import cn.niit.pojo.Article;
import cn.niit.pojo.PageInfo;
import cn.niit.pojo.SysCategory;

public interface SysCategoryMapper {
	//��վ����
	List<SysCategory> getAllSysCategory();
	//<!-- ��Ծ���� -->
	List<Article> getActiveUser(int num);
//	ǰʮ����
	List<Article>topTenArticle();
//	��������
	int ArticleCount();
//	��ҳ
	List<Article>page(PageInfo pageInfo);
//	
	int addCount(Integer count,Integer id);
	
	
	List<Article> search(String value);
	
}

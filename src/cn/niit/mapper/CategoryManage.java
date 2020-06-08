package cn.niit.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Update;

import cn.niit.pojo.Category;

public interface CategoryManage {
	
	List<Category> selCategory(Integer userId);

	int insCategory(Integer id,String name);
	
	int deleteCategory(int id);
	
	int updCategory(String categoryName,Integer cgId);
	
	Category selCg(Integer cgId);
	
	@Update("UPDATE category SET articles="
			+ "(SELECT COUNT(*) FROM article WHERE categoryId=#{0})"
			+ " WHERE id=#{0} AND userId=#{1}")
	 int updCateArticles(Integer categoryId,Integer userId);
}

package cn.niit.mapper;

import java.util.List;

import cn.niit.pojo.Article;
import cn.niit.pojo.Category;

public interface AddArticle {
	int insArticle(Article article);
	
	List<Category> selArtCategory(Integer id);
}

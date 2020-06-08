package cn.niit.mapper;


import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.niit.pojo.Article;

public interface ArticleMapper {
	
	Article ArticleComment(Integer tid);
	
    @Update("update article set isDelete=1 where id=#{0}")
	int removeArticle(Integer artId);
    
    @Select("select * from article where id=#{0}")
    Article selArticleInfo(Integer artId);
    
    @Update("UPDATE article SET title=#{0},summary=#{1},"
    		+ "content=#{2},categoryId=#{3},sysCategoryId=#{4} WHERE id=#{5}")
    int updArt(String title,String summary,String content,Integer categoryId,
    		Integer sysCategoryId,Integer id);
}

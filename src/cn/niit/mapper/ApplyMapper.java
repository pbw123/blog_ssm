package cn.niit.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

public interface ApplyMapper {
        
	@Insert("INSERT INTO blog_info (blogName,userId,description ,annoucement)"
			+ " VALUES(#{0},#{1},#{2},#{3})  ")
	int applyBlog(String blogName,Integer userId,String description,String annoucement);
	
	@Update("UPDATE USER SET isApplied=1 WHERE id=#{0}")
	int updIsApply(Integer userId);
	
	
}

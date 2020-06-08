package cn.niit.mapper;

import org.apache.ibatis.annotations.Insert;

import cn.niit.pojo.Girl;

public interface GirlMapper {

	
	@Insert("insert into girl(image) values(#{image})")
	int addGirl(Girl girl);
}

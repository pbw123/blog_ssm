package cn.niit.mapper;

import org.apache.ibatis.annotations.Select;

import cn.niit.pojo.Profile;
import cn.niit.pojo.User;

public interface ProFileMapper {
	
	int updProfile(Profile profile);
	
	int updPassword(String newPwd,Integer userId);

	User selOldPwd(String password,Integer id);
	
	@Select("select * from profile where userId=#{0}")
	Profile readOneProfile(Integer userId);
}

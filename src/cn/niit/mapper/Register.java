package cn.niit.mapper;

import cn.niit.pojo.User;

public interface Register {
	
	User selRegister(User user);
	
	User selByEmail(User user);

	int  insRegister(User user);
	
	
}

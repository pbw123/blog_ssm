package cn.niit.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.niit.pojo.Counter;

public interface CountMappeor {
	
	@Select("select * from counter where id=1")
	Counter getCountNum() ;
	
	@Update("update counter set count=#{0} where id=1")
	int setCountNum(Integer num);

}

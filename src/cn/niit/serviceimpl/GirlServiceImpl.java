package cn.niit.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.niit.mapper.GirlMapper;
import cn.niit.pojo.Girl;
import cn.niit.service.GirlService;
@Service
public class GirlServiceImpl implements GirlService{
    @Autowired
    private GirlMapper girlMapper;
	
	
	@Override
	public int addGirl(Girl girl) {
		return girlMapper.addGirl(girl);
	}

}

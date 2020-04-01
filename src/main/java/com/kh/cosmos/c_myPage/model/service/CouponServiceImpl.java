package com.kh.cosmos.c_myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.c_myPage.model.dao.CouponDAO;

@Service("cService")
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

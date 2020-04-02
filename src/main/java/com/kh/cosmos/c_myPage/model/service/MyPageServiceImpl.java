package com.kh.cosmos.c_myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.c_myPage.model.dao.MyPageDAO;

@Service("mpService")
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO mpDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

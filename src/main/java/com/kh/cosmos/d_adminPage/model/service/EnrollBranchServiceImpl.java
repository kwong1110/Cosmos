package com.kh.cosmos.d_adminPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.d_adminPage.model.dao.EnrollBranchDAO;

@Service("ebService")
public class EnrollBranchServiceImpl implements EnrollBranchService{

	@Autowired
	private EnrollBranchDAO ebDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

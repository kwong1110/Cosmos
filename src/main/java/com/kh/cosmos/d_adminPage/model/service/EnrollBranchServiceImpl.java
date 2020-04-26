package com.kh.cosmos.d_adminPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.d_adminPage.model.dao.EnrollBranchDAO;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Service("ebService")
public class EnrollBranchServiceImpl implements EnrollBranchService{

	@Autowired
	private EnrollBranchDAO ebDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 지점명 중복 확인
	@Override
	public int checkNameDup(String masterName) {
		return ebDAO.chekNameDup(sqlSession, masterName);
	}

	@Override
	public int insertMaster(ViewBranch vr) {
	
		return ebDAO.insertMaster(sqlSession, vr);
	}
	
	
}

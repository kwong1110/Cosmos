package com.kh.cosmos.d_adminPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.d_adminPage.model.dao.EnrollBranchDAO;
import com.kh.cosmos.d_adminPage.model.vo.Master;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

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

	
	// 지점등록
	@Override
	public int insertMaster(Master m) {
		System.out.println(m);
		return ebDAO.insertMaster(sqlSession, m);
	}

	@Override
	public int insertBranch(ViewBranch vr) {
		// TODO Auto-generated method stub
	
		return ebDAO.insertBranch(sqlSession, vr);
	}

	@Override
	public int insertMember(Member me) {
		// TODO Auto-generated method stub
		return ebDAO.insertMember(sqlSession, me);
	}
	
	// 지점개수조회 오류남
		@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return ebDAO.getListCount(sqlSession);
	}


		


	

	
}

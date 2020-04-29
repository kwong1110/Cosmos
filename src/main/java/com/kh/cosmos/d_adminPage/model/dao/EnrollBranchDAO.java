package com.kh.cosmos.d_adminPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.d_adminPage.model.vo.Master;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Repository("ebDAO")
public class EnrollBranchDAO {
	
	
	// 지점명 중복확인
	public int chekNameDup(SqlSessionTemplate sqlSession, String masterName) {
	
		return sqlSession.selectOne("viewBranchMapper.checkNameDup",masterName);
	}

	public int insertMaster(SqlSessionTemplate sqlSession, Master m) {
		
		return sqlSession.insert("viewBranchMapper.insertMaster", m);
	}

	public int insertBranch(SqlSessionTemplate sqlSession, ViewBranch vr) {
		
		return sqlSession.insert("viewBranchMapper.insertBranch", vr);
		
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member me) {
		
		return sqlSession.insert("viewBranchMapper.insertMember", me);
	
	}


}

package com.kh.cosmos.d_adminPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("ebDAO")
public class EnrollBranchDAO {
	
	
	// 지점명 중복확인
	public int chekNameDup(SqlSessionTemplate sqlSession, String masterName) {
	
		return sqlSession.selectOne("viewBranchMapper.checkNameDup",masterName);
	}


}

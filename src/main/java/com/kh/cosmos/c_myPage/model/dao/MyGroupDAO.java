package com.kh.cosmos.c_myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("mgDAO")
public class MyGroupDAO {

	public int getMemberListCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("myPageMapper.getMemberMyGroupCount", id);
	}

	public int getBossListCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("myPageMapper.getBossMyGroupCount", id);
	}

}

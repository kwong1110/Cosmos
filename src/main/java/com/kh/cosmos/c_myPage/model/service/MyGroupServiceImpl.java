package com.kh.cosmos.c_myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.c_myPage.model.dao.MyGroupDAO;

@Service("mgService")
public class MyGroupServiceImpl implements MyGroupService {

	@Autowired
	private MyGroupDAO mgDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getMemberListCount(String id) {
		return mgDAO.getMemberListCount(sqlSession, id);
	}

	@Override
	public int getBossListCount(String id) {
		return mgDAO.getBossListCount(sqlSession, id);
	}
}

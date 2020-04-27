package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.c_myPage.model.dao.MyPageDAO;

@Service("mpService")
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO mpDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Preview> getStudyList(String loginUserId) {
		return mpDAO.getStudyList(sqlSession, loginUserId);
	}

	/*@Override
	public ArrayList<Preview> getStudyList(String userId) {
		return mpDAO.getStudyList(sqlSession, userId);
	}*/

}

package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.c_myPage.model.dao.LectureHistoryDAO;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Service("lhService")
public class LectureHistoryServiceImpl implements LectureHistoryService {

	@Autowired
	private LectureHistoryDAO lhDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Lecture> selectList(PageInfo pi, String loginUserId) {
		return lhDAO.selectList(sqlSession, loginUserId, pi);
	}

	@Override
	public int getListCount(String loginUserId) {
		return lhDAO.getListCount(sqlSession, loginUserId);
	}

}

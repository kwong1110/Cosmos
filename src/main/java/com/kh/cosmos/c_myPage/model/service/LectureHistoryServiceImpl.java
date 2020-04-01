package com.kh.cosmos.c_myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.c_myPage.model.dao.LectureHistoryDAO;

@Service("lhService")
public class LectureHistoryServiceImpl implements LectureHistoryService {

	@Autowired
	private LectureHistoryDAO lhDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}

package com.kh.cosmos.c_myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.c_myPage.model.dao.SeatHistoryDAO;

@Service("shService")
public class SeatHistoryServiceImpl implements SeatHistoryService {

	@Autowired
	private SeatHistoryDAO shDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}

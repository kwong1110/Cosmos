package com.kh.cosmos.d_adminPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.d_adminPage.model.dao.LectureManageDAO;

@Service("lmService")
public class LectureManageServiceImpl implements LectureManageService{

	@Autowired
	private LectureManageDAO lmDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

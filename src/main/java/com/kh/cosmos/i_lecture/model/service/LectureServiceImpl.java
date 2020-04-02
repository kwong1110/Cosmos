package com.kh.cosmos.i_lecture.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.i_lecture.model.dao.LectureDAO;

@Service("lService")
public class LectureServiceImpl implements LectureService {

	@Autowired
	private LectureDAO lDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

package com.kh.cosmos.d_adminPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.d_adminPage.model.dao.SeatManageDAO;

@Service("smService")
public class SeatManageServiceImpl implements SeatManageService{

	@Autowired
	private SeatManageDAO smDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

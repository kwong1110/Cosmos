package com.kh.cosmos.d_adminPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.d_adminPage.model.dao.ReportDAO;

@Service("rService")
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDAO rDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

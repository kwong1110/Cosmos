package com.kh.cosmos.d_adminPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.d_adminPage.model.dao.ReportDAO;
import com.kh.cosmos.d_adminPage.model.vo.Report;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Service("rService")
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDAO rDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int reportInsert(Report rp) {
	
		return rDAO.insertReport(sqlSession, rp);
	}

	@Override
	public int getListCount() {
		
		return rDAO.selectCount(sqlSession);
	}

	@Override
	public ArrayList<Report> reportList(PageInfo pi) {
	
		return rDAO.selectList(sqlSession, pi);
	}


}

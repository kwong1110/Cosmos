package com.kh.cosmos.d_adminPage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.d_adminPage.model.vo.Report;

@Repository("rDAO")
public class ReportDAO {

	public int insertReport(SqlSessionTemplate sqlSession, Report rp) {
		
		return sqlSession.insert("reportMapper.insertReport", rp);
	}

	public int selectCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("reportMapper.getListCount");
	}

	public ArrayList<Report> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
	
		return (ArrayList)sqlSession.selectList("reportMapper.selectList");
	}

}

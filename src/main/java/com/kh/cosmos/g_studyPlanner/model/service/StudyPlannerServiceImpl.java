package com.kh.cosmos.g_studyPlanner.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.b_member.model.service.MemberService;
import com.kh.cosmos.g_studyPlanner.model.dao.StudyPlannerDAO;
import com.kh.cosmos.g_studyPlanner.model.vo.StudyPlanner;

@Service("spService")
public class StudyPlannerServiceImpl implements StudyPlannerService {

	@Autowired
	private StudyPlannerDAO spDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<StudyPlanner> selectList() {
		return spDAO.selectList(sqlSession);
	}

	@Override
	public int todayCheck(StudyPlanner sp) {
		return spDAO.todayCheck(sqlSession, sp);
	}
}

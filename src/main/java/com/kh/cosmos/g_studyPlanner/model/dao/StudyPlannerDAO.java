package com.kh.cosmos.g_studyPlanner.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.g_studyPlanner.model.vo.StudyPlanner;

@Repository("spDAO")
public class StudyPlannerDAO {

	public ArrayList<StudyPlanner> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("studyPlannerMapper.getMyPlannerList");
	}

	public int todayCheck(SqlSessionTemplate sqlSession, StudyPlanner sp) {
		return sqlSession.update("studyPlannerMapper.todayCheck", sp);
	}

	public int insertPlan(SqlSessionTemplate sqlSession, StudyPlanner sp) {
		return sqlSession.insert("studyPlannerMapper.insertPlan", sp);
	}

	public StudyPlanner selectPlan(SqlSessionTemplate sqlSession, int planNo) {
		return sqlSession.selectOne("studyPlannerMapper.selectPlan", planNo);
	}

	public int deletePlan(SqlSessionTemplate sqlSession, int planNo) {
		return sqlSession.update("studyPlannerMapper.deletePlan", planNo);
	}

}

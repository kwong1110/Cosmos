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

}

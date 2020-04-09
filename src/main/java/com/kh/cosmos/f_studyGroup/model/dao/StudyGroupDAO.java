package com.kh.cosmos.f_studyGroup.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("sgDAO")
public class StudyGroupDAO {

	public ArrayList getStudyList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getStudyList");
	}

	public ArrayList getBranchList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getBranchList");
	}

}

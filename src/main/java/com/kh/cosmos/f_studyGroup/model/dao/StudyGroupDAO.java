package com.kh.cosmos.f_studyGroup.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyRecruit;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Repository("sgDAO")
public class StudyGroupDAO {

	public ArrayList getStudyList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getStudyList");
	}
	
	public ArrayList<ViewBranch> getBranchList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getBranchList");
	}

	public int insertGroup(SqlSessionTemplate sqlSession, StudyGroup sg) {
		String studyname = sg.getStudyName();
		int studyno = sqlSession.selectOne("studyGroupMapper.getStudyNo", studyname);
		sg.setStudyNo(studyno);
		return sqlSession.insert("studyGroupMapper.insertGroup", sg);
	}

	public int insertRecruit(SqlSessionTemplate sqlSession, StudyRecruit sr) {
		return sqlSession.insert("studyGroupMapper.insertRecruit", sr);
	}

	public ArrayList<StudyGroup> getStudyGroupList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getStudyGroup", id);
	}

}

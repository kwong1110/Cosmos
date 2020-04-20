package com.kh.cosmos.f_studyGroup.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.f_studyGroup.model.dao.StudyGroupDAO;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroupRecruit;
import com.kh.cosmos.f_studyGroup.model.vo.StudyRecruit;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Service("sgService")
public class StudyGroupServiceImpl implements StudyGroupService{

	@Autowired
	private StudyGroupDAO sgDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList getStudyList() {
		return sgDAO.getStudyList(sqlSession);
	}

	@Override
	public ArrayList<ViewBranch> getBranchList() {
		return sgDAO.getBranchList(sqlSession);
	}

	@Override
	public int insertGroup(StudyGroup sg) {
		return sgDAO.insertGroup(sqlSession, sg);
	}

	@Override
	public int insertRecruit(StudyRecruit sr) {
		return sgDAO.insertRecruit(sqlSession, sr);
	}

	@Override
	public ArrayList<StudyGroup> getStudyGroupList(String id) {
		return sgDAO.getStudyGroupList(sqlSession, id);
	}

	@Override
	public StudyGroupRecruit getStudyGroupRecruit(int sgno) {
		return sgDAO.getStudyGroupRecruit(sqlSession, sgno);
	}

	@Override
	public StudyGroupRecruit getGroupInfoForRec(int sgno) {
		return sgDAO.getGroupInfoForRec(sqlSession, sgno);
	}

}

package com.kh.cosmos.f_studyGroup.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.f_studyGroup.model.dao.StudyGroupDAO;
import com.kh.cosmos.f_studyGroup.model.vo.ApproachGroup;
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
	public StudyGroupRecruit getGroupInfoForRec(int sgno) {
		return sgDAO.getGroupInfoForRec(sqlSession, sgno);
	}

	@Override
	public int getPartMemberNum(int sgno) {
		return sgDAO.getPartMemberNum(sqlSession, sgno);
	}

	@Override
	public int getIngRecCount(int sgno) {
		return sgDAO.getIngRecCount(sqlSession, sgno);
	}

	@Override
	public ArrayList<StudyGroupRecruit> getRecList(HashMap<String, String> map, PageInfo pi) {
		return sgDAO.getRecList(sqlSession, map, pi);
	}

	@Override
	public int getRecCompleteNum(int recNo) {
		return sgDAO.getRecCompleteNum(sqlSession, recNo);
	}

	@Override
	public int getRecListCount(HashMap<String, String> map) {
		return sgDAO.getRecListCount(sqlSession, map);
	}

	@Override
	public StudyGroup getStudyGroupInfo(int sgno) {
		return sgDAO.getStudyGroupInfo(sqlSession, sgno);
	}

	@Override
	public int insertMultiGroup(StudyGroup sg) {
		return sgDAO.insertMultiGroup(sqlSession, sg);
	}

	@Override
	public int updateGroup(StudyGroup sg) {
		return sgDAO.updateGroup(sqlSession, sg);
	}

	@Override
	public int updateMultiGroup(StudyGroup sg) {
		return sgDAO.updateMultiGroup(sqlSession, sg);
	}

	@Override
	public int getMsgNum(int sgNo) {
		return sgDAO.getMsgNum(sqlSession, sgNo);
	}

	@Override
	public String getSgStatus(int sgno) {
		return sgDAO.getSgStatus(sqlSession, sgno);
	}

	@Override
	public StudyGroupRecruit getRecDetail(int sgno, int ingRecCount, String sgStatus) {
		return sgDAO.getRecDetail(sqlSession, sgno, ingRecCount, sgStatus);
	}

	@Override
	public int getApproachStatus(HashMap<String, String> map) {
		return sgDAO.getApproachStatus(sqlSession, map);
	}

	@Override
	public int insertApp(HashMap<String, String> map) {
		return sgDAO.insertApp(sqlSession, map);
	}

	@Override
	public ArrayList<ApproachGroup> getAppList(int recno) {
		return sgDAO.getAppList(sqlSession, recno);
	}

	@Override
	public ArrayList<Preview> getAppUserInfo(String id) {
		return sgDAO.getAppUserInfo(sqlSession, id);
	}

	@Override
	public HashMap<String, Integer> confirmApproach(HashMap<String, String> map) {
		return sgDAO.confirmApproach(sqlSession, map);
	}

	@Override
	public ArrayList<StudyGroup> getIngStudyGroupList(String id) {
		return sgDAO.getIngStudyGroupList(sqlSession, id);
	}

	@Override
	public int getHomeListCount() {
		return sgDAO.getHomeListCount(sqlSession);
	}

	

}

package com.kh.cosmos.g_studyPlanner.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Reply;
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
	public ArrayList<StudyPlanner> selectList(String loginUserId) {
		return spDAO.selectList(sqlSession, loginUserId);
	}

	@Override
	public int todayCheck(StudyPlanner sp) {
		return spDAO.todayCheck(sqlSession, sp);
	}

	@Override
	public int insertPlan(StudyPlanner sp) {
		return spDAO.insertPlan(sqlSession, sp);
	}

	@Override
	public StudyPlanner selectPlan(int planNo) {
		return spDAO.selectPlan(sqlSession, planNo);
	}

	@Override
	public int deletePlan(int planNo) {
		return spDAO.deletePlan(sqlSession, planNo);
	}

	@Override
	public int updatePlan(StudyPlanner sp) {
		return spDAO.updatePlan(sqlSession, sp);
	}

	@Override
	public ArrayList<StudyPlanner> selectAllList(PageInfo pi) {
		return spDAO.selectAllList(sqlSession, pi);
	}

	@Override
	public int getAllListCount() {
		return spDAO.getAllListCount(sqlSession);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int planNo) {
		return spDAO.selectReplyList(sqlSession, planNo);
	}

	@Override
	public int insertReply(Reply r) {
		return spDAO.insertReply(sqlSession, r);
	}

	@Override
	public int updateReply(Reply r) {
		return spDAO.updateReply(sqlSession, r);
	}

	@Override
	public int deleteReply(Reply r) {
		return spDAO.deleteReply(sqlSession, r);
	}

	@Override
	public int insertReReply(Reply r) {
		return spDAO.insertReReply(sqlSession, r);
	}

	@Override
	public int updateReplyOrder(Reply r) {
		return spDAO.updateReplyOrder(sqlSession, r);
	}

	@Override
	public int updateReReplyOrder(Reply r) {
		return spDAO.updateReReplyOrder(sqlSession, r);
	}

}

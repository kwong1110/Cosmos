package com.kh.cosmos.g_studyPlanner.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Reply;
import com.kh.cosmos.a_common.SearchCondition;
import com.kh.cosmos.g_studyPlanner.model.vo.StudyPlanner;

@Repository("spDAO")
public class StudyPlannerDAO {

	public ArrayList<StudyPlanner> selectList(SqlSessionTemplate sqlSession, String loginUserId) {
		return (ArrayList)sqlSession.selectList("studyPlannerMapper.getMyPlannerList", loginUserId);
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

	public int updatePlan(SqlSessionTemplate sqlSession, StudyPlanner sp) {
		return sqlSession.update("studyPlannerMapper.updatePlan", sp);
	}

	public ArrayList<StudyPlanner> selectAllList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("studyPlannerMapper.getAllPlannerList", null, rowBounds);
	}

	public int getAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("studyPlannerMapper.getAllListCount");
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int planNo) {
		return (ArrayList)sqlSession.selectList("studyPlannerMapper.selectReplyList", planNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("studyPlannerMapper.insertReply", r);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("studyPlannerMapper.updateReply", r);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("studyPlannerMapper.deleteReply", r);
	}

	public int insertReReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("studyPlannerMapper.insertReReply", r);
	}

	public int updateReplyOrder(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("studyPlannerMapper.updateReplyOrder", r);
	}

	public int updateReReplyOrder(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("studyPlannerMapper.updateReReplyOrder", r);
	}

	public int getSearchResultListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("studyPlannerMapper.selectSearchResultCount", sc);
	}

	public ArrayList<StudyPlanner> selectSearchResultList(SqlSessionTemplate sqlSession, PageInfo pi,
			SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("studyPlannerMapper.selectSearchResultList", sc, rowBounds);
	}

}

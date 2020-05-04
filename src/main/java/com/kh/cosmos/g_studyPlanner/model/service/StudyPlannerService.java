package com.kh.cosmos.g_studyPlanner.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Reply;
import com.kh.cosmos.g_studyPlanner.model.vo.StudyPlanner;

public interface StudyPlannerService {

	ArrayList<StudyPlanner> selectList(String loginUserId);

	int todayCheck(StudyPlanner sp);

	int insertPlan(StudyPlanner sp);

	StudyPlanner selectPlan(int planNo);

	int deletePlan(int planNo);

	int updatePlan(StudyPlanner sp);

	ArrayList<StudyPlanner> selectAllList(PageInfo pi);

	int getAllListCount();

	ArrayList<Reply> selectReplyList(int planNo);

	int insertReply(Reply r);

	int updateReply(Reply r);

	int deleteReply(Reply r);

	int insertReReply(Reply r);

	int updateReplyOrder(Reply r);

	int updateReReplyOrder(Reply r);

}

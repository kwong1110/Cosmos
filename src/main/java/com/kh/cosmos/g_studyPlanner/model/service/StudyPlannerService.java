package com.kh.cosmos.g_studyPlanner.model.service;

import java.util.ArrayList;

import com.kh.cosmos.g_studyPlanner.model.vo.StudyPlanner;

public interface StudyPlannerService {

	ArrayList<StudyPlanner> selectList();

	int todayCheck(StudyPlanner sp);

	int insertPlan(StudyPlanner sp);

	StudyPlanner selectPlan(int planNo);

	int deletePlan(int planNo);

	int updatePlan(StudyPlanner sp);

}

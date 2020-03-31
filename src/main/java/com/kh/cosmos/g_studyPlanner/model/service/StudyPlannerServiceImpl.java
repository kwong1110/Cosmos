package com.kh.cosmos.g_studyPlanner.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.b_member.model.service.MemberService;
import com.kh.cosmos.g_studyPlanner.model.dao.StudyPlannerDAO;

@Service("spService")
public class StudyPlannerServiceImpl implements StudyPlannerService {

	@Autowired
	private StudyPlannerDAO spDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

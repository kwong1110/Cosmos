package com.kh.cosmos.i_lecture.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;
import com.kh.cosmos.i_lecture.model.dao.LectureDAO;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Service("lService")
public class LectureServiceImpl implements LectureService {

	@Autowired
	private LectureDAO lDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Lecture> selectList() {
		return lDAO.selectList(sqlSession);
	}

	@Override
	public ArrayList<ViewBranch> selectBranchList() {
		return lDAO.selectBranchList(sqlSession);
	}

	@Override
	public int lectureApply(Lecture l) {
		return lDAO.lectureApply(sqlSession, l);
	}
}

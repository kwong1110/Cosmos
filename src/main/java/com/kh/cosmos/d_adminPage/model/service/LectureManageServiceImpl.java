package com.kh.cosmos.d_adminPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.d_adminPage.model.dao.LectureManageDAO;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Service("lmService")
public class LectureManageServiceImpl implements LectureManageService{

	@Autowired
	private LectureManageDAO lmDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Lecture> lectureManageList(PageInfo pi) {
		return lmDAO.lectureManageList(sqlSession, pi);
	}

	@Override
	public int getListCount() {
		return lmDAO.getListCount(sqlSession);
	}

	@Override
	public Lecture selectLecture(Integer lNo) {
		return lmDAO.selectLecture(sqlSession, lNo);
	}

	@Override
	public Member selectLectureUser(Member m) {
		return lmDAO.selectLectureUser(sqlSession, m);
	}
}

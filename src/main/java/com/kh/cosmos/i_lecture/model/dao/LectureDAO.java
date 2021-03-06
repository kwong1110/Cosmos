package com.kh.cosmos.i_lecture.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Repository("lDAO")
public class LectureDAO {

	public ArrayList<Lecture> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectureMapper.getLectureList");
	}

	public ArrayList<ViewBranch> selectBranchList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("seatMapper.selectBranchList");
	}

	public int lectureApply(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.insert("lectureMapper.lectureApply", l);
	}

	public int lectureBuy(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.insert("lectureMapper.lectureBuy", l);
	}

	public int lectureAttendPlus(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.update("lectureMapper.lectureAttendPlus", l);
	}

	public ArrayList<Lecture> selectLectureAttendList(SqlSessionTemplate sqlSession, String loginUserId) {
		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureAttendList", loginUserId);
	}
}

package com.kh.cosmos.c_myPage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Repository("shDAO")
public class SeatHistoryDAO {

	public ArrayList<Seat> mySeatHistory(SqlSessionTemplate sqlSession, String loginUserId) {
		return (ArrayList)sqlSession.selectList("lectureMapper.mySeatHistory", loginUserId);
	}

	public ArrayList<Lecture> myLectureHistory(SqlSessionTemplate sqlSession, String loginUserId) {
		return (ArrayList)sqlSession.selectList("lectureMapper.myLectureHistory", loginUserId);
	}

}

package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.c_myPage.model.dao.SeatHistoryDAO;
import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Service("shService")
public class SeatHistoryServiceImpl implements SeatHistoryService {

	@Autowired
	private SeatHistoryDAO shDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Seat> mySeatHistory(String loginUserId) {
		return shDAO.mySeatHistory(sqlSession, loginUserId);
	}

	@Override
	public ArrayList<Lecture> myLectureHistory(String loginUserId) {
		return shDAO.myLectureHistory(sqlSession, loginUserId);
	}
	
}

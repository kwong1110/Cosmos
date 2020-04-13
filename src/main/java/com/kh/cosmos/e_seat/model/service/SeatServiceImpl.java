package com.kh.cosmos.e_seat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.e_seat.model.dao.SeatDAO;
import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Service("sService")
public class SeatServiceImpl implements SeatService{
	
	@Autowired
	private SeatDAO sDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return sDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<ViewBranch> selectBranchList(PageInfo pi) {
		return sDAO.selectBranchList(sqlSession, pi);
	}

	@Override
	public ArrayList<Seat> selectSeatList() {
		return sDAO.selectSeatList(sqlSession);
	}

	
}

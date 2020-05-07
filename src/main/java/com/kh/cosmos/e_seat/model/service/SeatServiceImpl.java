package com.kh.cosmos.e_seat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.SearchConditionSeat;
import com.kh.cosmos.e_seat.model.dao.SeatDAO;
import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.e_seat.model.vo.SortTable;
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
	public ArrayList<Seat> selectSeatList(Seat s) {
		return sDAO.selectSeatList(sqlSession, s);
	}

	@Override
	public ArrayList<SortTable> selectSortList() {
		return sDAO.selectSortList(sqlSession);
	}

	@Override
	public int seatBuy(Seat s) {
		return sDAO.seatBuy(sqlSession, s);
	}
	
	@Override
	public int getAllListCount() {
		return sDAO.getAllListCount(sqlSession);
	}

	@Override
	public ArrayList<Seat> selectAllList(PageInfo pi) {
		return sDAO.selectAllList(sqlSession, pi);
	}

	@Override 
	public ArrayList<Seat> seatStatusList(PageInfo pi, SearchConditionSeat scs ) {
		return sDAO.seatStatusList(sqlSession, pi, scs);
	}

	@Override
	public int getSeatStatusListCount(SearchConditionSeat scs) {
		return sDAO.getSeatStatusListCount(sqlSession, scs);
	}

	@Override
	public String getBranchName(int branchNo) {
		return sDAO.getBranchName(sqlSession, branchNo);
	}

	@Override
	public int getTotalStamp(String id) {
		return sDAO.getTotalStamp(sqlSession, id);
	}

	@Override
	public int insertOneStamp(HashMap<String, String> map) {
		return sDAO.insertOneStamp(sqlSession, map);
	}

	@Override
	public int insertCoupon(HashMap<String, String> map) {
		return sDAO.insertCoupon(sqlSession, map);
	}

	

	

	
	
	
}

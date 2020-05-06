package com.kh.cosmos.e_seat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.SearchConditionSeat;
import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.e_seat.model.vo.SortTable;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

public interface SeatService {

	int getListCount();

	ArrayList<ViewBranch> selectBranchList(PageInfo pi);

	ArrayList<Seat> selectSeatList(Seat s);

	ArrayList<SortTable> selectSortList();

	int seatBuy(Seat s);
	
	int getAllListCount();

	ArrayList<Seat> selectAllList(PageInfo pi);

	ArrayList<Seat> seatStatusList(PageInfo pi, SearchConditionSeat scs);

	int getSeatStatusListCount(SearchConditionSeat scs);

	int getSearchListCount(Seat s);

	String getBranchName(int branchNo);

	int getTotalStamp(String id);

	int insertOneStamp(HashMap<String, String> map);

	int insertCoupon(HashMap<String, String> map);

}

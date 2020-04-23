package com.kh.cosmos.e_seat.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.e_seat.model.vo.SortTable;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

public interface SeatService {

	int getListCount();

	ArrayList<ViewBranch> selectBranchList(PageInfo pi);

	ArrayList<Seat> selectSeatList();

	ArrayList<SortTable> selectSortList();

	int seatBuy(Seat s);

	

	

	

}

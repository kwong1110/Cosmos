package com.kh.cosmos.e_seat.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.e_seat.model.vo.Seat;

public interface SeatService {

	int getListCount();

	ArrayList<Seat> selectList(PageInfo pi);

}

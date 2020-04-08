package com.kh.cosmos.e_seat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.e_seat.model.dao.SeatDAO;
import com.kh.cosmos.e_seat.model.vo.Seat;

@Service("sService")
public class SeatServiceImpl implements SeatService{
	
	@Autowired
	private SeatDAO sDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return 0;
	}

	@Override
	public ArrayList<Seat> selectList(PageInfo pi) {
		return null;
	}
}

package com.kh.cosmos.e_seat.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.e_seat.model.dao.SeatDAO;

@Service("sService")
public class SeatServiceImpl implements SeatService{
	
	@Autowired
	private SeatDAO sDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

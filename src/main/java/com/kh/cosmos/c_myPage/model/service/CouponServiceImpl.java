package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.a_common.Pagination_five;
import com.kh.cosmos.c_myPage.model.dao.CouponDAO;
import com.kh.cosmos.c_myPage.model.vo.Coupon;

@Service("cService")
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Coupon> couponInfoList(String id, PageInfo pi) {
		return cDAO.couponInfoList(sqlSession, id, pi);
	}

	@Override
	public int getCouponListCount(String id) {
		return cDAO.getCouponListCount(sqlSession, id);
	}
}

package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination;
import com.kh.cosmos.a_common.Pagination_five;
import com.kh.cosmos.c_myPage.model.vo.Coupon;

public interface CouponService {

	ArrayList<Coupon> couponInfoList(String id, PageInfo pi);

	int getCouponListCount(String id);

}

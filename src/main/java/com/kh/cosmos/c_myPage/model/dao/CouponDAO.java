package com.kh.cosmos.c_myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination_five;
import com.kh.cosmos.c_myPage.model.vo.Coupon;

@Repository("cDAO")
public class CouponDAO {

	public ArrayList<Coupon> couponInfoList(SqlSessionTemplate sqlSession, String id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	    
		return (ArrayList)sqlSession.selectList("myPageMapper.couponList", id, rowBounds);
	}

	public int getCouponListCount(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("myPageMapper.couponListCount", id);
	}

}

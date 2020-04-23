package com.kh.cosmos.e_seat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.e_seat.model.vo.SortTable;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Repository("sDAO")
public class SeatDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("seatMapper.getListCount");
	}

	public ArrayList<ViewBranch> selectBranchList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	      
	    return (ArrayList)sqlSession.selectList("seatMapper.selectBranchList", null, rowBounds);
	}

	public ArrayList<Seat> selectSeatList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("seatMapper.selectSeatList");
	}

	public ArrayList<SortTable> selectSortList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("seatMapper.selectSortList");
	}

	public int seatBuy(SqlSessionTemplate sqlSession, Seat s) {
		return sqlSession.insert("seatMapper.seatBuy", s);
	}

	/*public int seatBuy(SqlSessionTemplate sqlSession) {
		return sqlSession.insert("seatMapper.seatBuy");
	}*/

	

}

package com.kh.cosmos.c_myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Repository("lhDAO")
public class LectureHistoryDAO {

	public ArrayList<Lecture> selectList(SqlSessionTemplate sqlSession, String loginUserId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("lectureMapper.getMyLectureList", loginUserId, rowBounds);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.getMyListCount");
	}

}

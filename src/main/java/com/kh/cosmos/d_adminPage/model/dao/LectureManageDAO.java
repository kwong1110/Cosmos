package com.kh.cosmos.d_adminPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Repository("lmDAO")
public class LectureManageDAO {

	public ArrayList<Lecture> lectureManageList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("lectureMapper.getLectureManageList", null, rowBounds);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.getListCount");
	}

	public Lecture selectLecture(SqlSessionTemplate sqlSession, Integer lNo) {
		return sqlSession.selectOne("lectureMapper.selectLecture", lNo);
	}

	public Member selectLectureUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int updateLecture(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.update("lectureMapper.updateLecture", l);
	}

}

package com.kh.cosmos.c_myPage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroupApproach;

@Repository("mgDAO")
public class MyGroupDAO {

	public int getMemberListCount(SqlSessionTemplate sqlSession, HashMap<Integer, String> map) {
		return sqlSession.selectOne("myPageMapper.getMemberMyGroupCount", map);
	}

	public int getBossListCount(SqlSessionTemplate sqlSession, HashMap<Integer, String> map) {
		return sqlSession.selectOne("myPageMapper.getBossMyGroupCount", map);
	}

	public ArrayList<StudyGroupApproach> getGroupList(SqlSessionTemplate sqlSession, HashMap<Integer, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	    
		return (ArrayList)sqlSession.selectList("myPageMapper.getGroupList", map, rowBounds);
	}

	public ArrayList<StudyGroupApproach> getAttendGroupList(SqlSessionTemplate sqlSession, String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	    
		return (ArrayList)sqlSession.selectList("myPageMapper.getAttendGroupList", userId, rowBounds);
	}

}

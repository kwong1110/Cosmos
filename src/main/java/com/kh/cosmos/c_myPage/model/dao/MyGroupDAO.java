package com.kh.cosmos.c_myPage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.f_studyGroup.model.vo.MyStudyGroup;

@Repository("mgDAO")
public class MyGroupDAO {

	public int getMemberListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("myPageMapper.getMemberMyGroupCount", map);
	}

	public int getBossListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("myPageMapper.getBossMyGroupCount", map);
	}

	public ArrayList<MyStudyGroup> getGroupList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	    
		return (ArrayList)sqlSession.selectList("myPageMapper.getGroupList", map, rowBounds);
	}

	public ArrayList<MyStudyGroup> getMemberList(SqlSessionTemplate sqlSession, int sgno) {
		return (ArrayList)sqlSession.selectList("myPageMapper.getMemberList", sgno);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("myPageMapper.deleteMember", map);
	}

	public ArrayList<MyStudyGroup> getRecList(SqlSessionTemplate sqlSession, int sgno) {
		return (ArrayList)sqlSession.selectList("myPageMapper.getRecList", sgno);
	}

	public int closeRecruit(SqlSessionTemplate sqlSession, int recno) {
		return sqlSession.update("myPageMapper.closeRecruit", recno);
	}

}

package com.kh.cosmos.c_myPage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;

@Repository("mpDAO")
public class MyPageDAO {

	public ArrayList<Preview> getStudyList(SqlSessionTemplate sqlSession, String loginUserId) {
		return (ArrayList)sqlSession.selectList("myPageMapper.getStudyList", loginUserId);
	}

	/*public ArrayList<Preview> getStudyList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("myPageMapper.getStudyList", userId);
	}*/
	
	// 회원정보
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.selectOne", m);
	}

}

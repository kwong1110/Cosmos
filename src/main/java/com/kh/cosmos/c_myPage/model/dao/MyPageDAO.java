package com.kh.cosmos.c_myPage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.b_member.model.vo.StudyCategory;

@Repository("mpDAO")
public class MyPageDAO {

	public ArrayList<Preview> getStudyList(SqlSessionTemplate sqlSession, String loginUserId) {
		return (ArrayList)sqlSession.selectList("myPageMapper.getStudyList", loginUserId);
	}

	/*public ArrayList<Preview> getStudyList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("myPageMapper.getStudyList", userId);
	}*/
	
	// 회원정보 불러오기
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("myPageMapper.selectOne", m);
	}

	// 비밀번호 변경
	public int updatePwd(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("myPageMapper.updatePwd", loginUser);
	}

	public ArrayList<StudyCategory> selectStudyCategory(SqlSessionTemplate sqlSession, StudyCategory sc) {
		return (ArrayList)sqlSession.selectList("myPageMapper.selectList", sc);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myPageMapper.updateMember", m);
	}

/*	public int updatePreview(SqlSessionTemplate sqlSession, Member m, ArrayList<Preview> pList) {
		return sqlSession.update("myPageMapper.updatePreview", pList);
	}*/
	public int deleteAllPreview(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.delete("myPageMapper.deleteFirstPreview", m);
	}

	public int insertAllPreview(SqlSessionTemplate sqlSession, Member m, ArrayList<Preview> pList) {
		return sqlSession.delete("myPageMapper.insertSecondPreview", pList);
	}
	
	public int deletePreview(SqlSessionTemplate sqlSession, String loginUserId) {
		return sqlSession.delete("myPageMapper.deleteUpPreview", loginUserId);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String loginUserId) {
		return sqlSession.update("myPageMapper.deleteUpMember", loginUserId);
	}



}

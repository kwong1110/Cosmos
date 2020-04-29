package com.kh.cosmos.b_member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.b_member.model.vo.StudyCategory;

@Repository("mDAO")
public class MemberDAO {
	// 로그인
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.selectOne", m);
	}

	// 공부 중인 항목 리스트
	public ArrayList<StudyCategory> selectStudyCategoryList(SqlSessionTemplate sqlSession, StudyCategory sc) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", sc);
	}

	// 회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	// 가입하는 회원이 공부 중인 항목 
	public int insertPreview(SqlSessionTemplate sqlSession, Member m, ArrayList<Preview> pList) {
		return sqlSession.insert("memberMapper.insertPreview", pList);
	}
	
	// 아이디 중복 확인
	public int checkIdDup(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.checkIdDup", id);
	}
	
	// 닉네임 중복 확인
	public int checkNickDup(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("memberMapper.checkNickDup", nick);
	}
	
	// 아이디 찾기
	public Member selectFindMemberId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.idCheck", m);
	}

	// selectFindMember
	public Member selectFindMember(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.orderbyId");
	}

	// 비밀번호 변경
	public Member selectFindMemberPwd(SqlSessionTemplate sqlSession, Member m) {
	
		return sqlSession.selectOne("memberMapper.userFindPwd", m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}

}

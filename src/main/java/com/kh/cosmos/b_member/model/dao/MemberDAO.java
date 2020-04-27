package com.kh.cosmos.b_member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.StudyCategory;

@Repository("mDAO")
public class MemberDAO {
	
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int insertMamber(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public ArrayList<StudyCategory> selectStudyCategoryList(SqlSessionTemplate sqlSession, StudyCategory sc) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", sc);
	}
 
	// 아이디 찾기
	public Member selectFindMemberId(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.idCheck", m);
	}
	
//	selectFindMember
	
	public Member selectFindMember(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.orderbyId");
	}

	// 비밀번호 변경
	public Member selectFindMemberPwd(SqlSessionTemplate sqlSession, Member m) {
	
		return sqlSession.selectOne("memberMapper.userFindPwd", m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updatePwd", m);
	}

	
	
	

}

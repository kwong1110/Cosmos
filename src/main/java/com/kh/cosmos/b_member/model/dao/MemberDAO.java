package com.kh.cosmos.b_member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.b_member.model.vo.StudyCategory;

@Repository("mDAO")
public class MemberDAO {
	
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public ArrayList<StudyCategory> selectStudyCategoryList(SqlSessionTemplate sqlSession, StudyCategory sc) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", sc);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int insertPreview(SqlSessionTemplate sqlSession, Member m, ArrayList<Preview> pList) {
		System.out.println("dao : " + pList);
		return sqlSession.insert("memberMapper.insertPreview", pList);
	}




	/*public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int insertPreview(SqlSessionTemplate sqlSession, Member m, Preview p) {
		return sqlSession.insert("memberMapper.insertPreview", p);
	}*/
  
}

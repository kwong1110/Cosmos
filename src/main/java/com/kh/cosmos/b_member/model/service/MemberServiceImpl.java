package com.kh.cosmos.b_member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.b_member.model.dao.MemberDAO;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.StudyCategory;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member memberLogin(Member m) {
		return mDAO.selectMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMamber(sqlSession, m);
	}

	@Override
	public ArrayList<StudyCategory> selectStudyCategoryList(StudyCategory sc) {
		return mDAO.selectStudyCategoryList(sqlSession, sc);
	}

	@Override
	public Member findMemberId(Member m) {

		return mDAO.selectFindMemberId(sqlSession, m);
	}
	
	@Override
	public Member findMember() {
		return mDAO.selectFindMember(sqlSession);
	}

	@Override
	public Member findMemberPwd(Member m) {
		// TODO Auto-generated method stub
		return  mDAO.selectFindMemberPwd(sqlSession, m);
	}

	@Override
	public int fakePwd(Member m) {
		// TODO Auto-generated method stub
		return mDAO.updatePwd(sqlSession, m );
	}



	
	

	
}

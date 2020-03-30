package com.kh.cosmos.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.member.model.dao.MemberDAO;
import com.kh.cosmos.member.model.vo.Member;

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


}

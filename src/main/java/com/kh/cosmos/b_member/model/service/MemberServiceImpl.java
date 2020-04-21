package com.kh.cosmos.b_member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.b_member.model.dao.MemberDAO;
import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
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
	public ArrayList<StudyCategory> selectStudyCategoryList(StudyCategory sc) {
		return mDAO.selectStudyCategoryList(sqlSession, sc);
	}

	@Override
	public int insertMember(Member m, ArrayList<Preview> pList) {
		
		int resultM = mDAO.insertMember(sqlSession, m);
		int resultP = 0;
		
		if(resultM > 0) {
			resultP = mDAO.insertPreview(sqlSession, m, pList);
		}
		
		return resultP;
	}

	@Override
	public ArrayList<Preview> getStudyList(String id) {
		return mDAO.getStudyList(sqlSession, id);
	}

	

}

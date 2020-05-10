package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.b_member.model.vo.StudyCategory;
import com.kh.cosmos.c_myPage.model.dao.MyPageDAO;

@Service("mpService")
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO mpDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public ArrayList<Preview> getStudyList(String loginUserId) {
		return mpDAO.getStudyList(sqlSession, loginUserId);
	}

	@Override
	public int updatePwd(Member loginUser) {
		return mpDAO.updatePwd(sqlSession, loginUser);
	}

	@Override
	public ArrayList<StudyCategory> selectStudyCategoryList(StudyCategory sc) {
		return mpDAO.selectStudyCategory(sqlSession, sc);
	}

	@Override
	public int updateMember(Member m, ArrayList<Preview> pList) {
		
		int resultM = mpDAO.updateMember(sqlSession, m);
		
		int resultP1 = 0;
		int resultP2 = 0;
		
		if(resultM > 0) {
			
			resultP1 = mpDAO.deleteAllPreview(sqlSession, m);
			
			if(resultP1 > 0 ) {
				
				resultP2 = mpDAO.insertAllPreview(sqlSession, m , pList);
			} 
			
		}
		
		return resultP2;
	}

	@Override
	public int deleteMember(String loginUserId) {
		
		int resultM = 0;
		int resultP = mpDAO.deletePreview(sqlSession, loginUserId);
		
		if(resultP > 0) {
			resultM = mpDAO.deleteMember(sqlSession, loginUserId);
		}
			
		return resultM;
	}


}

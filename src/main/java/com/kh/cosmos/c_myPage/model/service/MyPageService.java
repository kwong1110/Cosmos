package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.b_member.model.vo.StudyCategory;

public interface MyPageService {

	ArrayList<Preview> getStudyList(String loginUserId);

	int updatePwd(Member loginUser);

	ArrayList<StudyCategory> selectStudyCategoryList(StudyCategory sc);

	int updateMember(Member m, ArrayList<Preview> pList);

}

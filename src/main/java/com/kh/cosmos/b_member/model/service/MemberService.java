package com.kh.cosmos.b_member.model.service;

import java.util.ArrayList;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.b_member.model.vo.StudyCategory;

public interface MemberService {
	
	Member memberLogin(Member m);

	int insertMember(Member m);

	ArrayList<StudyCategory> selectStudyCategoryList(StudyCategory sc);

}

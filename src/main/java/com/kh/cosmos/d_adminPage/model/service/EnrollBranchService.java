package com.kh.cosmos.d_adminPage.model.service;

import com.kh.cosmos.b_member.model.vo.Member;
import com.kh.cosmos.d_adminPage.model.vo.Master;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

public interface EnrollBranchService {

	int checkNameDup(String masterName);

	int insertMaster(Master m);
	
	int insertBranch(ViewBranch vr);
	
	int insertMember(Member me);
	
}

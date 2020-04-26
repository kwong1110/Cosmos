package com.kh.cosmos.d_adminPage.model.service;

import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

public interface EnrollBranchService {

	int checkNameDup(String masterName);

	int insertMaster(ViewBranch vr);
	
}

package com.kh.cosmos.d_adminPage.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Member;

import com.kh.cosmos.d_adminPage.model.vo.Master;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

public interface EnrollBranchService {

	int checkNameDup(String masterName);

	int insertMaster(Master m);
	
	int insertBranch(ViewBranch vr);
	
	int insertMember(Member me);
	
	
	int getListCount();
		
	ArrayList<ViewBranch> branchList(PageInfo pi);
	

}

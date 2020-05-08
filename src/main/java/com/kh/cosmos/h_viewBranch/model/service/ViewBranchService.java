package com.kh.cosmos.h_viewBranch.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

public interface ViewBranchService {

	int getListCount();

	ArrayList<ViewBranch> selectBranchList(PageInfo pi);

	ViewBranch selectBranch(int vbNo);

	/*int insertBranchPhoto(int branchNo);*/

	int updateBranch(ViewBranch vb);
  
}

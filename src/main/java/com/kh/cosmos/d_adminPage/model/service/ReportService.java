package com.kh.cosmos.d_adminPage.model.service;

import java.util.ArrayList;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.d_adminPage.model.vo.Report;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

public interface ReportService {
	
	int reportInsert(Report rp);
	
	int getListCount();

	ArrayList<Report> reportList(PageInfo pi);
	
	int delete(int no);
	
	int ban(int no);

}

package com.kh.cosmos.h_viewBranch.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.dao.MemberDAO;
import com.kh.cosmos.h_viewBranch.model.dao.ViewBranchDAO;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Service("vbService")
public class ViewBranchServiceImpl implements ViewBranchService {

	@Autowired
	private ViewBranchDAO vbDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return vbDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<ViewBranch> selectBranchList(PageInfo pi) {
		return vbDAO.selectBranchList(sqlSession, pi);
	}

	@Override
	public ViewBranch selectBranch(int vbNo) {
		return vbDAO.selectBranch(sqlSession,  vbNo);
	}

}

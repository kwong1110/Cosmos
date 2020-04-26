package com.kh.cosmos.h_viewBranch.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.b_member.model.dao.MemberDAO;
import com.kh.cosmos.h_viewBranch.model.dao.ViewBranchDAO;

@Service("vbService")
public class ViewBranchServiceImpl implements ViewBranchService {

	@Autowired
	private ViewBranchDAO vbDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

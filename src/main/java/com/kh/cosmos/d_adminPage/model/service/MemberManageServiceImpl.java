package com.kh.cosmos.d_adminPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.cosmos.d_adminPage.model.dao.MemberManageDAO;

@Service("mmService")
public class MemberManageServiceImpl implements MemberManageService {

	@Autowired
	private MemberManageDAO mmDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}

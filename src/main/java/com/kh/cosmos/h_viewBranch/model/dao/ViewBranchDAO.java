package com.kh.cosmos.h_viewBranch.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("vbDAO")
public class ViewBranchDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("viewBranch-mapper.getListCount");
	}

}

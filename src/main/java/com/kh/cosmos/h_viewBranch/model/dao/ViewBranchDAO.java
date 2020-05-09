package com.kh.cosmos.h_viewBranch.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.h_viewBranch.model.vo.SearchCondition;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("vbDAO")
public class ViewBranchDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("viewBranchMapper.getListCount");
	}

	public ArrayList<ViewBranch> selectBranchList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("viewBranchMapper.selectBranchList", null, rowBounds);
	}

	public ViewBranch selectBranch(SqlSessionTemplate sqlSession, int vbNo) {
		return sqlSession.selectOne("viewBranchMapper.selectBranch", vbNo);
	}

	/*public int insertBranchPhoto(SqlSessionTemplate sqlSession, int branchNo) {
		return sqlSession.insert("viewBranchMapper.insertBranchPhoto", branchNo);
	}*/

	public int updateBranch(SqlSessionTemplate sqlSession, ViewBranch vb) {
		return sqlSession.update("viewBranchMapper.updateBranch", vb);
	}

	public int getSearchResultCount(SqlSessionTemplate sqlSession, SearchCondition search) {
		return sqlSession.selectOne("viewBranchMapper.getSearchResultCount", search);
	}

	public ArrayList<ViewBranch> selectSearchResultList(SqlSessionTemplate sqlSession, PageInfo pi,
			SearchCondition search) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("viewBranchMapper.selectSearchResultList", search, rowBounds);
	}

}

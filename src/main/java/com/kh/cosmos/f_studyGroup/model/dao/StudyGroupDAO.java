package com.kh.cosmos.f_studyGroup.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroupRecruit;
import com.kh.cosmos.f_studyGroup.model.vo.StudyRecruit;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Repository("sgDAO")
public class StudyGroupDAO {

	public ArrayList getStudyList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getStudyList");
	}
	
	public ArrayList<ViewBranch> getBranchList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getBranchList");
	}

	public int insertGroup(SqlSessionTemplate sqlSession, StudyGroup sg) {
		String studyname = sg.getStudyName();
		int studyno = sqlSession.selectOne("studyGroupMapper.getStudyNo", studyname);
		sg.setStudyNo(studyno);
		return sqlSession.insert("studyGroupMapper.insertGroup", sg);
	}

	public int insertRecruit(SqlSessionTemplate sqlSession, StudyRecruit sr) {
		return sqlSession.insert("studyGroupMapper.insertRecruit", sr);
	}

	public ArrayList<StudyGroup> getStudyGroupList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getStudyGroup", id);
	}

	public StudyGroupRecruit getStudyGroupRecruit(SqlSessionTemplate sqlSession, int sgno) {
		return sqlSession.selectOne("studyGroupMapper.getStudyGroupRecruit", sgno);
	}

	public StudyGroupRecruit getGroupInfoForRec(SqlSessionTemplate sqlSession, int sgno) {
		return sqlSession.selectOne("studyGroupMapper.getGroupInfoForRec", sgno);
	}

	public int getPartMemberNum(SqlSessionTemplate sqlSession, int sgno) {
		return sqlSession.selectOne("studyGroupMapper.getPartMemberNum", sgno);
	}

	public int getIngRecCount(SqlSessionTemplate sqlSession, int sgno) {
		return sqlSession.selectOne("studyGroupMapper.getIngRecCount", sgno);
	}

	public ArrayList<StudyGroupRecruit> getRecList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	    
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getRecList", null, rowBounds);
	}

	public int getRecCompleteNum(SqlSessionTemplate sqlSession, int recNo) {
		return sqlSession.selectOne("studyGroupMapper.getRecCompleteNum", recNo);
	}

	public int getRecListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("studyGroupMapper.getRecListCount");
	}

	public StudyGroup getStudyGroupInfo(SqlSessionTemplate sqlSession, int sgno) {
		return sqlSession.selectOne("studyGroupMapper.getStudyGroupInfo", sgno);
	}

	public int insertMultiGroup(SqlSessionTemplate sqlSession, StudyGroup sg) {
		return sqlSession.insert("studyGroupMapper.insertMultiGroup", sg);
	}

	public int updateGroup(SqlSessionTemplate sqlSession, StudyGroup sg) {
		return sqlSession.update("studyGroupMapper.updateStudyGroup", sg);
	}

	public int updateMultiGroup(SqlSessionTemplate sqlSession, StudyGroup sg) {
		return sqlSession.update("studyGroupMapper.updateMultiGroup", sg);
	}

}

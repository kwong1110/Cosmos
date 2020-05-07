package com.kh.cosmos.f_studyGroup.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.b_member.model.vo.Preview;
import com.kh.cosmos.f_studyGroup.model.vo.ApproachGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroup;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroupRecruit;
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

	public int insertRecruit(SqlSessionTemplate sqlSession, StudyGroupRecruit sr) {
		return sqlSession.insert("studyGroupMapper.insertRecruit", sr);
	}

	public ArrayList<StudyGroup> getStudyGroupList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getStudyGroup", id);
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

	public ArrayList<StudyGroupRecruit> getRecList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	    
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getRecList", map, rowBounds);
	}

	public int getRecCompleteNum(SqlSessionTemplate sqlSession, int recNo) {
		return sqlSession.selectOne("studyGroupMapper.getRecCompleteNum", recNo);
	}

	public int getRecListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("studyGroupMapper.getRecListCount", map);
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

	public int getMsgNum(SqlSessionTemplate sqlSession, int sgNo) {
		return sqlSession.selectOne("studyGroupMapper.getMsgNum", sgNo);
	}

	public String getSgStatus(SqlSessionTemplate sqlSession, int sgno) {
		return sqlSession.selectOne("studyGroupMapper.getSgStatus", sgno);
	}

	public StudyGroupRecruit getRecDetail(SqlSessionTemplate sqlSession, int sgno, int ingRecCount, String sgStatus) {
		
		StudyGroupRecruit result = null;
		
		if(ingRecCount > 0) { // 모집 중
			if(sgStatus.equals("Y")) { // Y 다회
				result = sqlSession.selectOne("studyGroupMapper.getRecMultiDetail", sgno);
				result.setGroupType("recMulti");
			} else if(sgStatus.equals("N")) { // N 일회
				result = sqlSession.selectOne("studyGroupMapper.getRecOnceDetail", sgno);
				result.setGroupType("recOnce");
			}
			
			if(result != null) {
				int rsgno = result.getRecNo();
				int partnum = sqlSession.selectOne("studyGroupMapper.getRecPartNum", rsgno);
				result.setPartNum(partnum);
				
				if(sgStatus.equals("Y")) { // Y 다회
					int partmemnum = sqlSession.selectOne("studyGroupMapper.getPartMemberNum", sgno);
					result.setPartMemNum(partmemnum+1);
				}
			}
		} else { // 모집 X
			if(sgStatus.equals("Y") || sgStatus.equals("D")) { // Y,D 다회
				result = sqlSession.selectOne("studyGroupMapper.getMultiDetail", sgno);
				result.setGroupType("Multi");
			} else if(sgStatus.equals("N") || sgStatus.equals("E")) { // N,E 일회
				result = sqlSession.selectOne("studyGroupMapper.getRecOnceDetail", sgno);
				//result = sqlSession.selectOne("studyGroupMapper.getOnceDetail", sgno);
				result.setGroupType("Once");
			}
			
			if(result != null) {
				if(sgStatus.equals("Y")) { // Y 다회
					int partmemnum = sqlSession.selectOne("studyGroupMapper.getPartMemberNum", sgno);
					result.setPartMemNum(partmemnum+1);
				}
			}
		}
		
		result.setSgNo(sgno);
		return result;
	}

	public int getApproachStatus(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("studyGroupMapper.getApproachStatus", map);
	}

	public int insertApp(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("studyGroupMapper.insertApp", map);
	}

	public ArrayList<ApproachGroup> getAppList(SqlSessionTemplate sqlSession, int recno) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getAppList", recno);
	}

	public ArrayList<Preview> getAppUserInfo(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getAppUserInfo", id);
	}

	public HashMap<String, Integer> confirmApproach(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		int result = sqlSession.update("studyGroupMapper.confirmApproach", map);
		int rsgno = Integer.parseInt(map.get("recno"));
		int count = sqlSession.selectOne("studyGroupMapper.getRecPartNum", rsgno);
		
		HashMap<String, Integer> resultMap = new HashMap<String, Integer>();
		resultMap.put("result", result);
		resultMap.put("count", count);
		
		return resultMap;
	}

	public ArrayList<StudyGroup> getIngStudyGroupList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getIngStudyGroup", id);
	}

	public ArrayList<String> getMemList(SqlSessionTemplate sqlSession, int group) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getMemList", group);
	}

	public int updateOnceGroup(SqlSessionTemplate sqlSession, StudyGroup sg) {
		return sqlSession.update("studyGroupMapper.updateOnceGroup", sg);
	}

	public String getUserId(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("studyGroupMapper.getUserId", nick);
	}

	public int deleteGroup(SqlSessionTemplate sqlSession, int sgno) {
		return sqlSession.update("studyGroupMapper.deleteGroup", sgno);
	}

	public int getRecNo(SqlSessionTemplate sqlSession, int sgno) {
		int result;
		
		int countRec = sqlSession.selectOne("studyGroupMapper.getIngRecCount", sgno);
		if(countRec > 0) {
			result = sqlSession.selectOne("studyGroupMapper.getRecNo", sgno);
		} else {
			result = 0;
		}
		
		return result;
	}

	public int updateMsgCount(SqlSessionTemplate sqlSession, int group) {
		String status = sqlSession.selectOne("studyGroupMapper.getSgStatus", group);
		
		int result;
		if(status.equals("Y")) {
			result = sqlSession.update("studyGroupMapper.updateMsgCount", group);
		} else {
			result = 0;
		}
		return result;
	}

	public int exitGroup(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("studyGroupMapper.exitGroup", map);
	}

	public String getBossId(SqlSessionTemplate sqlSession, int sgno) {
		return sqlSession.selectOne("studyGroupMapper.getBossId", sgno);
	}

	public int getRecCondition(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("studyGroupMapper.getRecCondition", id);
	}

  public int getHomeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("studyGroupMapper.getHomeListCount");
	}
	
	public ArrayList<StudyGroupRecruit> getEndRecList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getEndRecList");
	}
	
	public ArrayList<StudyGroupRecruit> getMetOnceGroupList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("studyGroupMapper.getMetOnceGroupList");
	}
}

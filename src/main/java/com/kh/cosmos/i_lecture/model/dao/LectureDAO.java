package com.kh.cosmos.i_lecture.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.cosmos.i_lecture.model.vo.Lecture;

@Repository("lDAO")
public class LectureDAO {

	public ArrayList<Lecture> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectureMapper.getLectureList");
	}


}

package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import com.kh.cosmos.b_member.model.vo.Preview;

public interface MyPageService {

	ArrayList<Preview> getStudyList(String loginUserId);

}

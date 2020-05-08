package com.kh.cosmos.c_myPage.model.service;

import java.util.ArrayList;

import com.kh.cosmos.e_seat.model.vo.Seat;
import com.kh.cosmos.i_lecture.model.vo.Lecture;

public interface SeatHistoryService {

	ArrayList<Seat> mySeatHistory(String loginUserId);

	ArrayList<Lecture> myLectureHistory(String loginUserId);

}

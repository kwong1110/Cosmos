package com.kh.cosmos.c_myPage.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination_five;
import com.kh.cosmos.c_myPage.model.exception.MyPageException;
import com.kh.cosmos.c_myPage.model.service.CouponService;
import com.kh.cosmos.c_myPage.model.vo.Coupon;
import com.kh.cosmos.f_studyGroup.model.vo.StudyGroupRecruit;

@Controller
public class CouponController {

	@Autowired
	private CouponService cService;
	
	@RequestMapping("getCouponInfo.mp")
	public void CouponInfo(HttpServletResponse response, @RequestParam(value="page", required=false) Integer page, @RequestParam("id") String id) throws JsonIOException, IOException {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getCouponListCount(id);
		PageInfo pi = Pagination_five.getPageInfo(currentPage, listCount);
		
		ArrayList<Coupon> list = cService.couponInfoList(id, pi);
		
		if(list != null) {

			for(Coupon c : list) {
				c.setcContent(URLEncoder.encode(c.getcContent(),"UTF-8"));
			}

			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(list, response.getWriter());
		} else {
			throw new MyPageException("쿠폰 리스트를 불러오지 못했습니다.");
		}
	}

	@RequestMapping("getCouponPage.mp")
	public void CouponPage(HttpServletResponse response, @RequestParam(value="page", required=false) Integer page, @RequestParam("id") String id) throws JsonIOException, IOException {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getCouponListCount(id);
		PageInfo pi = Pagination_five.getPageInfo(currentPage, listCount);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(pi, response.getWriter());
	}
}

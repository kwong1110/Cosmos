package com.kh.cosmos.a_common;

import com.kh.cosmos.a_common.PageInfo;

public class Pagination_seat {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
			
			PageInfo pi = null;
			
			int pageLimit = 10;
			int maxPage;
			int startPage;
			int endPage;
			int boardLimit = 8;
			
			maxPage = (int)((double)listCount / boardLimit + 0.9);
			
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			
			endPage = startPage + pageLimit - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			
			return pi;
		}
}

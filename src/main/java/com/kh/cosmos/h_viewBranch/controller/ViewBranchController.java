package com.kh.cosmos.h_viewBranch.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.cosmos.a_common.PageInfo;
import com.kh.cosmos.a_common.Pagination_five;
import com.kh.cosmos.h_viewBranch.model.exception.ViewBranchException;
import com.kh.cosmos.h_viewBranch.model.service.ViewBranchService;
import com.kh.cosmos.h_viewBranch.model.vo.SearchCondition;
import com.kh.cosmos.h_viewBranch.model.vo.ViewBranch;

@Controller
public class ViewBranchController {
	
	@Autowired
	private ViewBranchService vbService;
	
	@RequestMapping("viewBranchList.vb")
	public ModelAndView branchList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv){
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = vbService.getListCount();
//		PageInfo pi = Pagination_five.getPageInfo(currentPage, listCount);
		PageInfo pi = Pagination_five.getPageInfo(currentPage, listCount);
		
		ArrayList<ViewBranch> vbList = vbService.selectBranchList(pi);
		
		if(vbList != null) {
			mv.addObject("vbList", vbList);
			mv.addObject("pi", pi);
			mv.setViewName("viewBranchList");
		} else {
			throw new ViewBranchException("지점 리스트 조회에 실패하였습니다.");
		}
		return mv;
		
	}
	
	// 지점 검색
	@RequestMapping("search.vb")
	public ModelAndView noteSearch(@RequestParam(value="page", required=false) Integer page, 
								   @ModelAttribute SearchCondition search, @RequestParam("searchCondition") String condition, 
								   @RequestParam("searchValue") String value, ModelAndView mv) {
		
		
		if(condition.equals("name")) {
			search.setName(value);
		} else if(condition.equals("address")) {
			search.setAddress(value);
		} 
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = vbService.getSearchResultListCount(search);
		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo pi = Pagination_five.getPageInfo(currentPage, listCount);
		ArrayList<ViewBranch> vbList = vbService.selectSearchResultList(pi, search);
		
		if(vbList != null) {
			mv.addObject("vbList", vbList)
			  .addObject("pi", pi)
			  .addObject("searchValue", value)
			  .addObject("searchCondition", search)
			  .setViewName("viewBranchList");
		} else {
			throw new ViewBranchException("지점 검색에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	@RequestMapping("viewBranchDetail.vb")
	public ModelAndView branchDetail(@RequestParam("vbNo") int vbNo, @RequestParam(value="page", required=false) int page, 
									 ModelAndView mv) {
		
		ViewBranch vBranch = vbService.selectBranch(vbNo);
		
		
		if(vBranch != null) {
			mv.addObject("vBranch", vBranch)
			  .addObject("page", page)
			  .setViewName("viewBranchDetail");
		} else {
			throw new ViewBranchException("지점 조회에 실패하였습니다.");
		}
		 
		return mv ;
	}
	
	@RequestMapping("viewBranchUpForm.vb")
	public ModelAndView branchUpFormView(@RequestParam("vbNo") int vbNo, @RequestParam(value="page", required=false) int page, ModelAndView mv) {
		
		ViewBranch vBranch = vbService.selectBranch(vbNo);
		
		mv.addObject("vBranch", vBranch)
		  .addObject("page", page)
		  .setViewName("viewBranchUpForm");
		
		return mv;
	}
	
	
	@RequestMapping("viewBranchUpdate.vb")
	public ModelAndView branchUpdate(@ModelAttribute ViewBranch vb, 
									 @RequestParam("vbNo") int branchNo, @RequestParam(value="page", required=false) int page, 
									 /*@RequestParam("post") String post, @RequestParam("address1") String addr1, @RequestParam("address2") String addr2,*/ 
									 @RequestParam("localNum") String localNum, @RequestParam("tel1") String tel1, @RequestParam("tel2") String tel2,
									 @RequestParam("time1") String time1, @RequestParam("time2") String time2, 
									 ModelAndView mv) {
		
		vb.setBranchNo(branchNo);
//		vb.setBranchAddress(post + " / " + addr1 + " / " + addr2);
		vb.setBranchTel(localNum + "-" + tel1 + "-" + tel2);
		vb.setBranchTime(time1 + " ~ " + time2);
		
		System.out.println(vb);
		
		int result = vbService.updateBranch(vb);
		
		if(result > 0) {
			mv.addObject("page", page)
			  .setViewName("redirect:viewBranchDetail.vb?vbNo=" + vb.getBranchNo());
		} else {
			throw new ViewBranchException("지점 정보 수정에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 사진 구현은 일단 실패
	/*@RequestMapping("viewBranchUpdate.vb")
	public ModelAndView branchUpdate(@ModelAttribute ViewBranch vb, @ModelAttribute BranchPhoto bp, @RequestParam("vbNo") int branchNo, @RequestParam("page") int page,
									 @RequestParam("uploadFile") MultipartFile[] uploadFiles, 
									 HttpServletRequest request, ModelAndView mv) {
		
		if(uploadFiles != null && !(uploadFiles.length == 0)) { // 업로드 파일이 존재할 때
			
			// ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			ArrayList<String> renameList = saveFile(uploadFiles, request); // renameList[]
			
			System.out.println("renameList : " + renameList);
			System.out.println("bp : " + bp);
			System.out.println("vbNo : " + branchNo);
			
			ArrayList<BranchPhoto> branchPhoto = new ArrayList<BranchPhoto>();
			
			for(int i = 0; i < uploadFiles.length - 1 ; i++) {
				
				BranchPhoto bPhoto = new BranchPhoto();
				bPhoto.setBranchNo(branchNo);
				bPhoto.setOriginalFileName(uploadFiles[i].getOriginalFilename());
				bPhoto.setRenameFileName(renameList.get(i));
				
				// rename 을 사진 경로에 넣어줌.
				// bPhoto.setBpPath(uploadFiles[i].);
			}
			
			ViewBranch vBranch = vbService.selectBranch(branchNo);
			int result = vbService.insertBranchPhoto(branchNo);
			
			if(result > 0) {
				mv.addObject("vBranch", vBranch)
				  .addObject("page", page)
				  .setViewName("viewBranchDetail");
				
			} else {
				throw new ViewBranchException("지점 조회에 실패하였습니다.");
			}
		} 
		
		return mv;
	}
	
	public ArrayList<String> saveFile(MultipartFile[] files, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\photo_uploadFiles\\branch\\";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		
		ArrayList<String> renameList = new ArrayList<String>();
		
		
		for(int i = 0; i < files.length; i++) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			int ranNum = (int)(Math.random() * 100000);
			
			String originFileName = files[i].getOriginalFilename();
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
			String renamePath = folder + "\\" + renameFileName;
			
			renameList.add(renameFileName);
			
			try {
				files[i].transferTo(new File(renamePath));
			} catch (Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
				e.printStackTrace();
			} 
			
		}
		
		System.out.println("saveFile() : renameList 바뀐 이름 : " + renameList);

		return renameList;
		
	}*/
	
}

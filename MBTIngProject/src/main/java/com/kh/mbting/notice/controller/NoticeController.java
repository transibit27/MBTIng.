package com.kh.mbting.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.common.template.Pagination;
import com.kh.mbting.notice.model.service.NoticeService;
import com.kh.mbting.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	
	/*
	@GetMapping("list.no")
	public ModelAndView selectList(
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = noticeService.selectListCount();
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectList(pi);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("notice/noticeListView");
		
		return mv;
	}
	*/
	
	
	@GetMapping("list.no")
	public ModelAndView selectList(
	        @RequestParam(value = "cpage", defaultValue = "1") int currentPage,
	        @RequestParam(value = "keyword", required = false) String keyword,
	        ModelAndView mv) {

	    int listCount = noticeService.selectListCount();
	    
	    int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
	    ArrayList<Notice> list = noticeService.selectList(pi);

	    if (keyword != null && !keyword.isEmpty()) {
	        // 검색어가 있을 경우 검색된 결과 가져오기
	        listCount = noticeService.searchListCount(keyword);
	        list = noticeService.searchList(keyword, currentPage, pageLimit, boardLimit);
	    } else {
	        // 검색어가 없을 경우 전체 리스트 가져오기
	        listCount = noticeService.selectListCount();
	        list = noticeService.selectList(listCount, currentPage, pageLimit, boardLimit);
	    }

	    

	    mv.addObject("list", list)
	      .addObject("pi", pi)
	      .setViewName("notice/noticeListView");

	    return mv;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("enrollForm.no")
	public String enrollForm() {
		
		return "notice/noticeEnrollForm";
	}
	
	@PostMapping("insert.no")
	public String insertNotice(Notice n,
							   HttpSession session,
							   Model model) {
		
		int result = noticeService.insertNotice(n);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			
			return "redirect:/list.no"; // 공지사항 첫 페이지로 이동
			
		} else { // 실패
			
			model.addAttribute("errorMsg", "공지사항 등록이 실패되었습니다.");
			
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		
		// 조회수 증가용 서비스 호출
		int result = noticeService.increaseCount(nno);
		
		if(result > 0) { // 성공
			
			Notice n = noticeService.selectNotice(nno);
			
			mv.addObject("n", n).setViewName("notice/noticeDetailView");
		
		} else { // 실패
			
			mv.addObject("errorMsg", "공지사항 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("delete.no")
	public String deleteNotice(int nno, Model model, HttpSession session) {
		
		int result = noticeService.deleteNotice(nno);
		
		if(result > 0) { // 삭제 성공
			
			session.setAttribute("alertMsg", "성공적으로 공지사항 게시글이 삭제되었습니다.");
			
			return "redirect:/list.no";
			
		} else { // 삭제 실패
			
			model.addAttribute("errorMsg", "공지사항 게시글 삭제를 실패했습니다.");
			
			return "common/errorPage";
		}
	}
	
	@PostMapping("updateForm.no")
	public String updateForm(int nno, Model model) {
		
		Notice n = noticeService.selectNotice(nno);
		
		model.addAttribute("n", n);
		
		return "notice/noticeUpdateForm";
		
	}
	
	@PostMapping("update.no")
	public String updateNotice(Notice n,
							   HttpSession session,
							   Model model) {
		
		int result = noticeService.updateNotice(n);
		
		if(result > 0) { // 수정 성공
			
			session.setAttribute("alertMsg", "성공적으로 공지사항 게시글이 수정되었습니다.");
			
			return "redirect:/detail.no?nno=" + n.getNoticeNo();
		
		} else { // 수정 실패
			
			model.addAttribute("errorMsg", "공지사항 게시글 수정을 실패하였습니다.");
			
			return "common/errorPage";
		}
	}
	
	
	
	
	
	
}












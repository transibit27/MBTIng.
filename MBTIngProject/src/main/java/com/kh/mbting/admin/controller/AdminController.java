package com.kh.mbting.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mbting.admin.model.service.AdminService;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.common.template.Pagination;
import com.kh.mbting.member.model.vo.Member;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("adminMain.ad")
	public String adminMain() {
		
		return "admin/adminMainPage";
	}
	
	@GetMapping("list.adme")
	public ModelAndView memberSelectList(
			@RequestParam(value="cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = adminService.memberSelectListCount();
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = adminService.memberSelectList(pi);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("admin/adminMemberListView");
		
		return mv;
	}
	
	
	
	
}

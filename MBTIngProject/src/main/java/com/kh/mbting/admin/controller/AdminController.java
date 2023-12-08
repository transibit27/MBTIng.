package com.kh.mbting.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	// 상태에 따른 토글바 조회용 (보류)
	@PostMapping("updateStatus.ad")
    public ResponseEntity<String> updateStatus(@RequestBody Map<String, String> data) {
        String email = data.get("userEmail");
        String newStatus = data.get("newStatus");

        try {
            adminService.updateUserStatus(email, newStatus);
            return ResponseEntity.ok("Status updated successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to update status");
        }
    }
	
	
	// 선택 된 회원 저장 (확인 필요)
	@CrossOrigin
	@PutMapping("updateSelectedStatus.ad")
	public ResponseEntity<String> updateSelectedStatus(@RequestBody Map<String, List<Integer>> data) {
	    List<Integer> selectedUserNos = data.get("selectedUserNos");

	    try {
	        adminService.updateSelectedUserStatus(selectedUserNos);
	        return ResponseEntity.ok("Selected statuses updated successfully");
	    } catch (Exception e) {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body("Failed to update selected statuses");
	    }
	}

	@RequestMapping("selectTotalMembers.ad")
	public ModelAndView selectTotalMembers(ModelAndView mv,
			 							   HttpSession session,
			 							   Member m,
			 							   int userNo,
			 							   Model model) {
		
		model.addAttribute("m", m);
		
		return mv;
		
	}
	
	
}

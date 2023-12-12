package com.kh.mbting.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mbting.admin.model.service.AdminService;
import com.kh.mbting.admin.model.vo.Month;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.common.template.Pagination;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.pay.vo.KakaoPay;

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

	@ResponseBody
	@RequestMapping("selectTotalMembers.ad") 
	public int totalMemberCount() {
		
		int totalMemberCount = adminService.selectTotalMembers();
		//System.out.println(totalMemberCount);

		return totalMemberCount;
	}
	
	@ResponseBody
	@RequestMapping("selectTotalCouple.ad")
	public int totalCoupleCount() {
		
		int totalCoupleCount = adminService.selectTotalCouple();
		// System.out.println(totalCoupleCount);
		return totalCoupleCount;
	}
	
	@ResponseBody
	@RequestMapping("selectTotalPay.ad")
	public int totalPayCount() {
		//System.out.println("여");
		int totalPayCount = adminService.selectTotalPay();
		
		return totalPayCount;
	}
	
	@ResponseBody
	@RequestMapping("selectTotalBoard.ad")
	public int totalBoardCount() {

		int totalBoardCount = adminService.selectTotalBoard();
		
		return totalBoardCount;
	}
	
	// 월 별 회원가입 수 그래프
	@ResponseBody
	@RequestMapping(value="selectTotalMonthly.ad", produces="application/json; charset=UTF-8")
	public String selectTotalMonthly() {
		
		ArrayList<Month> list = adminService.selectTotalMonthly();
		//System.out.println(list);
		
		return new Gson().toJson(list);
	}
	
	// 커플 매칭 상태 수락 그래프
	@ResponseBody
	@RequestMapping(value="selectTotalMatchingSuccess.ad", produces="application/json; charset=UTF-8")
	public String totalMatchingSuccess() {
		
		ArrayList<Matching> list = adminService.totalMatchingSuccess();
		
		// System.out.println(list);;
		// 3번이 수락, 2번이 보류
		
		return new Gson().toJson(list);
	}
	
	// 커플 매칭 상태 거절 그래프
	@ResponseBody
	@RequestMapping(value="selectTotalMatchingRefusal.ad", produces="application/json; charset=UTF-8")
	public String totalMatchingRefusal() {
		
		ArrayList<Matching> list = adminService.totalMatchingRefusal();
		
		return new Gson().toJson(list);
	}
	
	// 커플 매칭 상태 보류 그래프
	@ResponseBody
	@RequestMapping(value="selectTotalMatchingPending.ad", produces="application/json; charset=UTF-8")
	public String totalMatchingPending() {
		
		ArrayList<Matching> list = adminService.totalMatchingPending();
		
		// System.out.println(list);;
		// 3번이 수락, 2번이 보류, // 1번 거절ㄱ
		
		return new Gson().toJson(list);
	}
	
	// MBTI 성향 분포도
	@ResponseBody
	@RequestMapping(value="totalMbtiCount.ad", produces="application/json; charset=UTF-8")
	public String totalMbtiCount() {
		
		
		ArrayList<Member> list = adminService.totalMbtiCount();
		
		return new Gson().toJson(list);
	}
	
	// 남녀성비 원그래프
	@ResponseBody
	@RequestMapping(value="totalGenderRate.ad", produces="application/json; charset=UTF-8")
	public String totalGenderRate() {
		
		ArrayList<Member> list = adminService.totalGenderRate();
		
		return new Gson().toJson(list);
	}
	
	// 매칭 성공률 원그래프
	@ResponseBody
	@RequestMapping(value="totalMatchingRate.ad", produces="application/json; charset=UTF-8")
	public String totalMatchingRate() {
		
		ArrayList<Matching> list = adminService.totalMatchingRate();
		
		return new Gson().toJson(list);
	}
	
	// 유료계정비율 원그래프
	@ResponseBody
	@RequestMapping(value="totalPremiumCount.ad", produces="application/json; charset=UTF-8")
	public String totalPremiumCount() {
		
		ArrayList<KakaoPay> list = adminService.totalPremiumCount();
		
		return new Gson().toJson(list);
	}
	
	// 무료계정비율 원그래프
	@ResponseBody
	@RequestMapping(value="totalFreeCount.ad", produces="application/json; charset=UTF-8")
	public String totalFreeCount() {
		
		ArrayList<KakaoPay> list = adminService.totalFreeCount();
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	// 월 별 매출 그래프
	@ResponseBody
	@RequestMapping(value="totalMonthlySalesCount.ad", produces="application/json; charset=UTF-8")
	public String totalMonthlySalesCount() {
		
		ArrayList<KakaoPay> list = adminService.totalMonthlySalesCount();
		
		return new Gson().toJson(list);
	}
	
	// 년 별 매출 그래프
	@ResponseBody
	@RequestMapping(value="totalyearlySalesCount.ad", produces="application/json; charset=UTF-8")
	public String totalyearlySalesCount() {
		
		System.out.println("년별 그래프 안 나오니?");
		ArrayList<KakaoPay> list = adminService.totalyearlySalesCount();
		
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	
	
	
	
}

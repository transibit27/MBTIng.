package com.kh.mbting.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mbting.admin.model.service.AdminService;
import com.kh.mbting.admin.model.vo.Month;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.common.template.Pagination;
import com.kh.mbting.matching.model.vo.Matching;
import com.kh.mbting.member.model.vo.Member;
import com.kh.mbting.pay.vo.KakaoPay;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	// 전체 회원수 조회
	@ResponseBody
	@RequestMapping("selectTotalMembers.ad") 
	public int totalMemberCount() {
		
		int totalMemberCount = adminService.selectTotalMembers();
		//System.out.println(totalMemberCount);

		return totalMemberCount;
	}
	
	// 전체 커플 매칭수 조회
	@ResponseBody
	@RequestMapping("selectTotalCouple.ad")
	public int totalCoupleCount() {
		
		int totalCoupleCount = adminService.selectTotalCouple();
		// System.out.println(totalCoupleCount);
		return totalCoupleCount;
	}
	
	// 전체 결제 금액 조회
	@ResponseBody
	@RequestMapping("selectTotalPay.ad")
	public int totalPayCount() {
		//System.out.println("여");
		int totalPayCount = adminService.selectTotalPay();
		
		return totalPayCount;
	}
	
	// 전체 후기 게시글 수 조회
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
		
		ArrayList<KakaoPay> list = adminService.totalyearlySalesCount();
		
		return new Gson().toJson(list);
	}
	
	
	/* 회원 관리 시작!!!!!!!!!!!!!!!!!! */
	@RequestMapping("adminMain.ad")
	public String adminMain() {
		
		return "admin/adminMainPage";
	}
	
	// 전체회원 조회
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
		  .addObject("result", new Gson().toJson(list))
		  .addObject("pi", pi)
		  .setViewName("admin/adminMemberListView");
		
		return mv;
	}
	
	// 회원관리 검색 조회용
	@GetMapping("search.adme")
    public ModelAndView adminSearchMember(
            @RequestParam("keyword") String keyword,
            @RequestParam(value = "cpage", defaultValue = "1") int currentPage,
            ModelAndView mv) {
        
        int listCount = adminService.memberSearchListCount(keyword);
        
        int pageLimit = 5;
        int boardLimit = 10;
        
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        
        List<Member> searchResult = adminService.memberSearchList(keyword, pi.getCurrentPage(), pi.getBoardLimit(), pi.getPageLimit());
        
        mv.addObject("list", searchResult)
          .addObject("pi", pi)
          .setViewName("admin/adminMemberListView");
        
        return mv;
    }
	
	
	@RequestMapping("update-status")
	public void updateMember(@RequestParam("selectedUserNos") List<String> selectedUserNos){
		
		Member m = new Member();
		ArrayList<Member> memNo = new ArrayList<>();

    	for (int i = 0; i <selectedUserNos.size(); i++ ) {   	  
    		int userNo = Integer.parseInt(selectedUserNos.get(i)); 
    		m.setUserNo(userNo);
    		
    		memNo.add(m);
    	}
    	
    	int result = adminService.updateSelectedStatus(memNo);
		
		List<String> statusN = new ArrayList<>();
		//System.out.println("배열" + selectedUserNos );
		
		// int allMember = adminService.selectAllMember();
		//6이 담김 
/*
		for (int i = 1; i <= allMember; i++) {
		    if (!selectedUserNos.contains(String.valueOf(i))) {
		        statusN.add(String.valueOf(i));
		    }
		}
		*/
		
		
		System.out.println(result);
		
	}
	/*
	
	// 회원 상태 업데이트 API
	@RequestMapping(value = "/update-status", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> updateStatus(@RequestParam("selectedUserNos") List<String> selectedUserNos) {
	    
		//System.out.println(selectedUserNos);
		// 처리 로직
	    //return ResponseEntity.ok("Update successful");
		
		 int result = adminService.updateSelectedStatus(status, selectedUserNos);
	}
    
*/
	/*
    // 선택된 회원 상태 일괄 업데이트 API
    @PutMapping("/update-status")
    public ResponseEntity<String> updateSelectedStatus(@RequestParam String status, @RequestBody List<String> selectedUserNos) {
        System.out.println("야 오냐 ㅠㅠ");
    	//System.out.println(selectedUserNos);
    	//System.out.println("status" +status);
    	//System.out.println("dd");
    	
    	try {
            int result = adminService.updateSelectedStatus(status, selectedUserNos);
            
            System.out.println(result);
            
            return ResponseEntity.ok("Successfully updated " + result + " records.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating records: " + e.getMessage());
        }
    	
    }
    */
	
	/*
	 * // 선택 된 회원 저장 (확인 필요)
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
	 * 
	 * 
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
	
	
	
	*/
	
    /* 매칭후기 관리 시작!!!!!!!!!!!!!!!!!! */
    
    // 매칭후기 게시글 전체 조회
    @GetMapping("list.adbo")
	public ModelAndView boardSelectList(
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = adminService.boardSelectListCount();
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = adminService.boardSelectList(pi);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("admin/adminBoardListView");
		
		return mv;
	}
    
    // 매칭후기 검색
    @GetMapping("search.adbo")
    public ModelAndView searchBoard(
            @RequestParam("keyword") String keyword,
            @RequestParam(value = "cpage", defaultValue = "1") int currentPage,
            ModelAndView mv) {
        
        int listCount = adminService.adminSearchListCount(keyword);
        
        int pageLimit = 5;
        int boardLimit = 10;
        
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        
        List<Board> searchResult = adminService.adminSearchList(keyword, pi.getCurrentPage(), pi.getBoardLimit(), pi.getPageLimit());
        
        mv.addObject("list", searchResult)
          .addObject("pi", pi)
          .setViewName("admin/adminBoardListView");
        
        return mv;
    }
    
    
    
	}
    
	
    
    
    
    
    
    
    
    


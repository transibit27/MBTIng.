package com.kh.mbting.mbti.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mbting.mbti.model.service.MbtiService;
import com.kh.mbting.mbti.model.vo.Mbti;
import com.kh.mbting.member.model.vo.Member;

@Controller
public class MbtiController {
	
		
	@Autowired	
	private MbtiService mbtiService; 
	
//	연애 테스트 클릭 시 테스트 화면으로 넘어가기 위한 메소드
	@RequestMapping("mbtiTest.mb")
	public String mbtiTest() {
		
		return "mbti/mbtiTest";
	}
	
//	테스트 후 mbti 정보 추가하기
	@RequestMapping(value = "updateMbti.mb", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> updateMbti(HttpSession session, Mbti mbti) {

	    int result = mbtiService.updateMbti(mbti);
	    System.out.println(mbti);

	    if(result > 0) {
	        
	        return ResponseEntity.ok("성공적으로 내 mbti를 추가했습니다.");
	    } else {
	        session.setAttribute("errorMsg", "내 mbti 추가를 실패했습니다.");
	        return ResponseEntity.badRequest().body("내 mbti 추가를 실패했습니다.");
	    }
	}
	
//	테스트 후 매칭하기
	@RequestMapping("selectMatchList.mb")
	public String selectList(Model model, HttpSession session) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
//		System.out.println(loginMember);
		ArrayList<Mbti> list = mbtiService.selectMatchList(loginMember);
		ArrayList<Mbti> list2 = mbtiService.selectRandomList(loginMember);
		
		model.addAttribute("matchList", list);
		model.addAttribute("randomList", list2);
		
//		System.out.println(list);
//		System.out.println(list2);
		
		return "mbti/mbtiMatch";
	}

	@RequestMapping("updateMatchRequestList.mb")
	@ResponseBody
	public Map<String, Object> updateMatchRequestList(Model model, HttpSession session, String receiverNo) {
	    Map<String, Object> result = new HashMap<>();
	    
	    Member loginMember = (Member) session.getAttribute("loginMember");
	    loginMember.setReceiverNo(receiverNo);
	    
	    int updateResult = mbtiService.updateMatchRequestList(loginMember);
	    int insertResult = mbtiService.insertMatchRequestList(loginMember);
	    
	    if (updateResult > 0 && insertResult > 0) {
	        result.put("success", true);
	        result.put("message", "채팅을 위한 신청을 완료했습니다. 수락을 대기해주세요.");
	    } else {
	        result.put("success", false);
	        result.put("message", "요청을 실패했습니다. 다시 시도해 주세요.");
	    }

	    return result;
	}

	

}

package com.kh.mbting.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mbting.board.model.service.BoardService;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("list.bo")
	public  ModelAndView selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		int listCount = boardService.selectListCount();		
		int pageLimit = 10;
		int boardLimit = 12;		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = boardService.selectList(pi);
		mv.addObject("list", list).addObject("pi", pi).setViewName("board/boardListView");
		return mv;
	}
	
	@GetMapping("enrollForm.bo")
	public String enrollForm() {		
		return "board/boardEnrollForm";
	}
	
	@PostMapping("insert.bo")
	public String insertBoard(Board b, HttpSession session, Model model) {
		int result = boardService.insertBoard(b);		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 만남후기가 등록되었습니다.");			
			return "redirect:/list.bo";			
		} else {			
			model.addAttribute("errorMsg", "만남후기 등록 실패");			
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		
		int result = boardService.increaseCount(bno);
		if(result > 0) {
			Board b = boardService.selectBoard(bno);
			mv.addObject("b", b).setViewName("board/boardDetailView");
		} else {
			mv.addObject("errorMsg", "만남후기 상세조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno, Model model, HttpSession session) {
		
		int result = boardService.deleteBoard(bno);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 만남후기가 삭제되었습니다.");
			return "redirect:/list.bo";
		} else {
			model.addAttribute("alertMsg", "만남후기 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@PostMapping("updateForm.bo")
	public String updateForm(int bno, Model model) {
		Board b = boardService.selectBoard(bno);
		model.addAttribute("b", b);
		return "board/boardUpdateForm";
	}
	
	@PostMapping("update.bo")
	public String updateBoard(Board b, HttpSession session, Model model) {
		int result = boardService.updateBoard(b);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 만남후기가 수정되었습니다.");
			return "redirect:/detail.bo?bno=" + b.getBoardNo();
		} else {
			model.addAttribute("errorMsg", "만남후기 수정 실패");
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		try {	
			upfile.transferTo(new File(savePath + changeName));	
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
		
	@ResponseBody
	@RequestMapping(value = "topList.bo", produces = "application/json; charset=UTF-8")
	public String ajaxTopBoardList() {	
	ArrayList<Board> list = boardService.selectTopBoardList();
	return new Gson().toJson(list);
	}
	
}

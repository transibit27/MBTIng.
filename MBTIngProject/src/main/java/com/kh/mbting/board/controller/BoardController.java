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
	
	@GetMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);			
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/" + changeName);	
		}
		int result = boardService.insertBoard(b);		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");			
			return "redirect:/list.bo";			
		} else {			
			model.addAttribute("errorMsg", "게시글 등록 실패");			
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

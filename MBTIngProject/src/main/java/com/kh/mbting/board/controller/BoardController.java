package com.kh.mbting.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mbting.board.model.service.BoardService;
import com.kh.mbting.board.model.vo.Board;
import com.kh.mbting.board.model.vo.BoardImg;
import com.kh.mbting.common.model.vo.PageInfo;
import com.kh.mbting.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, ModelAndView mv) {
		int listCount = boardService.selectListCount();		
		int pageLimit = 10;
		int boardLimit = 12;		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = boardService.selectList(pi);
		mv.addObject("list", list).addObject("pi", pi).setViewName("board/boardListView");
		return mv;
	}
	
	@GetMapping("search.bo")
	public ModelAndView searchBoard(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, @RequestParam(value = "condition", defaultValue = "") String condition, @RequestParam(value = "keyword", defaultValue = "") String keyword, ModelAndView mv) {

		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		int searchCount = boardService.selectSearchListCount(map);		
		int pageLimit = 10;
		int boardLimit = 12;	
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = boardService.selectSearchList(map, pi);
		mv.addObject("list", list).addObject("pi", pi).addObject("condition", condition).addObject("keyword", keyword).setViewName("board/boardListView");
		return mv;
	}

	@GetMapping("enrollForm.bo")
	public String enrollForm() {		
		return "board/boardEnrollForm";
	}
	
	@PostMapping("insert.bo")
	public String insertBoard(Board b, BoardImg bi, MultipartFile[] upfile, HttpSession session, Model model) {
		int result = boardService.insertBoard(b);
		for(int i = 0; i <= 3; i++ ) {
			if(!upfile[i].getOriginalFilename().equals("")) {
				String thumbnail = "";
				if(i == 0) {
					thumbnail = "Y";
				} else {
					thumbnail = "N";
				}
				String changeName = saveFile(upfile[i], session);
				bi.setOriginName(upfile[i].getOriginalFilename());
				bi.setChangeName("resources/uploadFiles/" + changeName);
				bi.setThumbnail(thumbnail);
				boardService.insertBoardImg(bi);
			}
		}		
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
			ArrayList<BoardImg> list = boardService.selectBoardImg(bno);			
			mv.addObject("b", b).addObject("list", list).setViewName("board/boardDetailView");
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
	
	@RequestMapping("updateForm.bo")
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		Board b = boardService.selectBoard(bno);
		mv.addObject("b", b).setViewName("board/boardUpdateForm");
		return mv;
	}
	
	@PostMapping("update.bo")
	public String updateBoard(Board b, BoardImg bi, MultipartFile[] reupfile, HttpSession session, Model model) {
		int result = boardService.updateBoard(b);
		if(result > 0) {			
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");			
			return "redirect:/detail.bo?bno=" + b.getBoardNo();			
		} else {			
			model.addAttribute("errorMsg", "게시글 수정 실패");		
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

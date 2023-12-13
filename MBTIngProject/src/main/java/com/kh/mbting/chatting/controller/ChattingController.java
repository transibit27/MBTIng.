package com.kh.mbting.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.mbting.chatting.model.service.ChattingServiceImpl;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.chatting.model.vo.SearchMember;
import com.kh.mbting.mbti.model.vo.Mbti;
import com.kh.mbting.member.model.vo.Member;


@Controller
public class ChattingController {

	@Autowired
	private ChattingServiceImpl cService;
	
	/*검색 값을 담을 hashmap입니당*/
	@Autowired
	private HashMap<String, String> map;
	
	/**
     * 해당 채팅방의 채팅 메세지 불러오기
     * @param roomId
     * @param model
     * @param response
     * @throws JsonIOException
     * @throws IOException
     */
	

    @RequestMapping("messageList.do")
    public void messageList( String roomNo, String userEmail, Model model, HttpServletResponse response) throws JsonIOException, IOException {
       
    	//System.out.println(roomNo);
    	
        List<ChatMessage> mList = cService.messageList(roomNo);
        response.setContentType("application/json; charset=utf-8");
        //System.out.println(mList);
        
        // 안읽은 메세지의 숫자 0으로 바뀌기
        ChatMessage message = new ChatMessage();
        message.setEmail(userEmail);
        message.setRoomNo(roomNo);
        
        cService.updateCount(message);
        
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(mList,response.getWriter());
    }
    
    @RequestMapping("chatRoomList.do")
    public void createChat(ChatRoom room, ChatMessage message, String userEmail, HttpServletResponse response) throws JsonIOException, IOException{
       
    	List<ChatRoom> cList = cService.chatRoomList(userEmail);
        //System.out.println(cList);
        for(int i = 0; i < cList.size(); i++) {
            message.setRoomNo(cList.get(i).getRoomNo());
            message.setEmail(userEmail);
        }
        
        response.setContentType("application/json; charset=utf-8");
 
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(cList,response.getWriter());
    }
    
    
    @GetMapping("convert.ch")
    public String convertChatting() {

    	//model.addAttribute("roomNo", roomNo);
    	//System.out.println(roomNo);
    	return "chatting/chattingView";
    }
    
   
    @RequestMapping("master.In") 
    public void masterInfo(String email , HttpServletResponse response)throws JsonIOException, IOException {
    	
    	 Member masterInfo = cService.masterInfo(email);
    	 response.setContentType("application/json; charset=utf-8");
    	
    	 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	 gson.toJson(masterInfo,response.getWriter());
    }
    
    @RequestMapping("all.me")
    public String allMember() {
    	return "chatting/chattingList";
    }
    
    @ResponseBody
    @RequestMapping("all.memList")
    public void allMemberList(HttpServletResponse response , HttpSession session)throws JsonIOException, IOException {
    	
    	Member loginMember = (Member)session.getAttribute("loginMember");
    			
    	ArrayList<Member> list = cService.allMemberList(loginMember);
    	response.setContentType("application/json; charset=utf-8");
     	
    	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	gson.toJson(list , response.getWriter());
    }
    
    @ResponseBody
    @RequestMapping("search.li")
    public void searchMember(String height, String address, String age, String mbti ,String gender , int userNo, HttpServletResponse response) throws JsonIOException, IOException{
    //System.out.println(height + address + age + mbti + gender);
    //System.out.println(height  + age );
    ArrayList<Member> list = new ArrayList<Member>();
    	
    	if(height.equals("없음") && (!age.equals("없음"))) {
    		//System.out.println("난 지금 키만 없음이야 ");
    		int startAge 	 =  Integer.parseInt(age.substring(0, 2));
	    	int endAge 		 =  Integer.parseInt(age.substring(2, 4)); 
    		SearchMember sm  = new SearchMember(startAge, address, endAge, mbti, gender , height, userNo );
	    	list = cService.searchMember(sm);
	    	
    	}else if(age.equals("없음") && (!height.equals("없음")) ) {
    		System.out.println("난 지금 나이만 없음이야 ");
    		int startHeight  =  Integer.parseInt(height.substring(0, 3));
	    	int endHeight 	 =  Integer.parseInt(height.substring(3, 6));
	    	System.out.println("start :" + startHeight + "end :" + endHeight);
	    	SearchMember sm = new SearchMember(startHeight, endHeight, address, mbti, gender , age, userNo );
	    	list = cService.searchMember(sm);
	    	
    	}else if(height.equals("없음") && (age.equals("없음"))) {
    		//System.out.println("난 지금 키 나이 둘 다 없음이야 ");
    		SearchMember sm = new SearchMember(age, height, address, mbti, gender, userNo);
	    	list = cService.searchMember(sm);	
	    	
    
    	}else {
    		//System.out.println("난 지금 둘 다 선택했음이야 ㅋ ");
    		int startAge 	 =  Integer.parseInt(age.substring(0, 2));
	    	int endAge 		 =  Integer.parseInt(age.substring(2, 4));    	
	    	int startHeight  =  Integer.parseInt(height.substring(0, 3));
	    	int endHeight 	 =  Integer.parseInt(height.substring(3, 6));
	    	
	    	SearchMember sm = new SearchMember(startAge, endAge, startHeight, endHeight, address, mbti, gender, userNo);
	    	list = cService.searchMember(sm);
    	}
    

	    response.setContentType("application/json; charset-UTF-8");
    	new Gson().toJson(list, response.getWriter());
    }
    
    @ResponseBody
    @RequestMapping("check.pro")
    public void checkProposer(int userNo, HttpServletResponse response )throws JsonIOException, IOException {
    		
    		ArrayList<Mbti> proposerNoList = cService.checkProposer(userNo);
    		 
    		response.setContentType("application/json; charset-UTF-8");
        	new Gson().toJson(proposerNoList, response.getWriter());
    		
    }
    
    @ResponseBody
    @RequestMapping("check.rec")
    public void checkReciever(int userNo, HttpServletResponse response )throws JsonIOException, IOException {
    		
    		ArrayList<Mbti> RecieverNoList = cService.checkReciever(userNo);
    		 
    		response.setContentType("application/json; charset-UTF-8");
        	new Gson().toJson(RecieverNoList, response.getWriter());
    		
    }
}
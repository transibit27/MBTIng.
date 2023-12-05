package com.kh.mbting.chatting.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.mbting.chatting.model.service.ChattingServiceImpl;
import com.kh.mbting.chatting.model.vo.ChatMessage;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.member.model.vo.Member;


@Controller
public class ChattingController {

	@Autowired
	private ChattingServiceImpl cService;
	
    @ResponseBody
    @RequestMapping("createChat.do")
    public String createChat(ChatRoom room, HttpSession session, String masterName, String masterEmail, String masterPic, HttpServletResponse response)throws JsonIOException, IOException{

    	/*현재 로그인한 유저의 이메일정보와 이름 값*/
        Member loginMember =  (Member)session.getAttribute("loginMember");
        String userEmail   = loginMember.getEmail();
        String userName    = loginMember.getUserName();
        String userPic	   = loginMember.getProfileImg();
        
        room.setUserPic(userPic);
        room.setUserEmail(userEmail);
        room.setUserName(userName);
        room.setMasterEmail(masterEmail);
        room.setMasterName(masterName);
        room.setMasterPic(masterPic);
 
        ChatRoom exist  = cService.searchChatRoom(room);
        
        String roomNo = "";
        
        // DB에 방이 없을 때
        if(exist == null) {
            System.out.println("방이 없다!!");
            int result = cService.createChat(room);
            if(result == 1) {
                System.out.println("방 만들었다!!");
                
                ChatRoom RecentRoomInfo = cService.chatRoom(room);
        		
                roomNo = RecentRoomInfo.getRoomNo();

                return roomNo;
                
            }else {
                return "fail";
            }
        }
        // DB에 방이 있을 때
        else{
            System.out.println("방이 있다!!");
            ChatRoom RecentRoomInfo = cService.chatRoom(room);
            roomNo = RecentRoomInfo.getRoomNo();
 
            return roomNo;
        }
    
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
    
    
    @RequestMapping("convert.ch")
    public String convertChatting(Model model, String roomNo) {

    	model.addAttribute("roomNo", roomNo);
    	//System.out.println(roomNo);
    	return "chatting/chattingView";
    }
    
    
	
}

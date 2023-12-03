package com.kh.mbting.chatting.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mbting.chatting.model.service.ChattingServiceImpl;
import com.kh.mbting.chatting.model.vo.ChatRoom;
import com.kh.mbting.member.model.vo.Member;


@Controller
public class ChattingController {

	@Autowired
	private ChattingServiceImpl cService;
	
    @ResponseBody
    @RequestMapping("createChat.do")
    public String createChat(ChatRoom room, HttpSession session, String masterName, String masterEmail, String masterPic){

    	/*현재 로그인한 유저의 이메일정보와 이름 값*/
        Member loginMember =  (Member)session.getAttribute("loginMember");
        String userEmail = loginMember.getEmail();
        String userName  = loginMember.getUserName();
        
        room.setUserEmail(userEmail);
        room.setUserName(userName);
        room.setMasterEmail(masterEmail);
        room.setMasterName(masterName);
        room.setMasterPic(masterPic);
 
        ChatRoom exist  = cService.searchChatRoom(room);
        
        // DB에 방이 없을 때
        if(exist == null) {
            System.out.println("방이 없다!!");
            int result = cService.createChat(room);
            if(result == 1) {
                System.out.println("방 만들었다!!");
                return "new";
            }else {
                return "fail";
            }
        }
        // DB에 방이 있을 때
        else{
            System.out.println("방이 있다!!");
            return "exist";
        }
    
    }
	
}

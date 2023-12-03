package com.kh.mbting.chatting.model.service;

import com.kh.mbting.chatting.model.vo.ChatRoom;


public interface ChattingService {

	  /**
     * DB에 채팅 방이 있는지 확인
     * @param room
     * @return
     */
    ChatRoom searchChatRoom(ChatRoom room);
	
	  /**
     * 채팅 방 DB 저장
     * @param room
     * @return
     */
    int createChat(ChatRoom room);
}

package com.kh.mbting.chatting.model.service;

import com.kh.mbting.chatting.model.vo.ChatRoom;


public interface ChattingService {

	  /**
     * 채팅 방 DB 저장
     * @param room
     * @return
     */
    int createChat(ChatRoom room);
}

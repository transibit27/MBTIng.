package com.kh.mbting.chatting.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
@ToString
public class ChatMessage {
       private String roomNo;               // 방 번호
       private String messageNo;           // 메세지 번호
       private String message;              // 메세지 내용
       private String name;               // 보낸이 이름
       private String email;               // 보낸이 이메일
       private Date sendTime;				//메시지 보낸 시간
       private int unReadCount;           // 안 읽은 메세지 수
       private int sessionCount;          // 현재 세션 수
}
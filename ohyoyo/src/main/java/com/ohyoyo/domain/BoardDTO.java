package com.ohyoyo.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
    private int bno; 			
//    private String type;		// 게시판유형
    private String title;
    private String content;
    private String writer;
    private int viewcnt;
    private int replycnt;		// 답변 수
    private int goodcnt;		// 좋아요
    private String name; 		// 작성자이름(tbl_member테이블)
    private Date regdate;
    private Date updatedate;
    private String show;		// 화면표시여부
    private String[] files;		// 첨부파일 이름배열
    private int ref;			// 답변그룹번호
    private int re_step;		// 답변출력순번
    private int re_level;		// 답변단계(계층형)
}

package com.lumodiem.board.memberboard.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// Lombok
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class Review {

	private int reviewNo; // 리뷰번호
	private int accountNo; // 회원번호
	private int resNo; // 예약번호
	private int klassDateNo; // 클래스 예약일 목록번호
	private String reviewTxt;
	private String reviewName;
	private String accountNickName;
	private String reviewRegDate;
	private String reviewModDate;
	private String orderType;
	private int attachNo;
}

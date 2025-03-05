package com.lumodiem.board.adminboard.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class ReportReview {
	private int reportReviewNo;
	private int accountNo;
	private int reviewNo;
	
	private String reviewTxt;
	private String reviewName;
	private String accountNickname;
	
	private String searchType;
	private String searchTxt;

	private String reviewRegDate;
	private String reviewModDate;
	private String orderType;
	private int attachNo;
	private String klassName;
	private String payTime;
	private String payStatus;
	private int payPrice;
	private String attachPath;

}

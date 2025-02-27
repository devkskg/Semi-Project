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
	
	private int reviewTxt;
	private int reviewName;
	private int accountNickName;
	
}

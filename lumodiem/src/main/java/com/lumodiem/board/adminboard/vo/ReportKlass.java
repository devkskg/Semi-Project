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
public class ReportKlass {
	
	private int reportKlassNo;
	private int klassNo;
	private int accountNo;
	
	// 클래스 신고 내역 참조용
	private String klassName;
	private String accountNickname;
	private String klassTxt;
	
	
	
	
	private int reportReviewNo;
	
	private int reportReviewCmtNo;
}

package com.lumodiem.board.hostboard.vo;

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
public class Klass {
	private  int klassNo;
	private int accountNo;
	private String klassName;
	private String klassAddress;
	private int klassPrice;
	private int klassMax;
	private String klassStatus;
	private String klassTxt;
	private String accountNickname;
	private String klassRegDate;
	private String klassModDate;
	private String searchType;
	private String searchTxt;
	private String approveCode;
}

package com.lumodiem.board.hostboard.vo;

import com.lumodiem.account.vo.Account;

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
public class ClassAttach {
//	2번 바구니
	private int attachNo;
	private int boardNo;
	private String oriName;
	private String newName;
	private String attachPath;
	
}

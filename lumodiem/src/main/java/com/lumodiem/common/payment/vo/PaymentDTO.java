package com.lumodiem.common.payment.vo;

import com.lumodiem.board.memberboard.vo.Reservation;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//Lombok
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class PaymentDTO {
	private int resNo;
	private String klassName;
	private int resPpl;
	private int klassPrice;
}

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
public class ProductDTO {
	private int pno;
	private String pname;
	private String ptype;
	private String pmemo;
	private int price;
	private int avail_cnt;
	private int sale_cnt;
	private Date regdate;
}

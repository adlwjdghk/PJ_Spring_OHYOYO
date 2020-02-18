package com.ohyoyo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	@GetMapping("/join")
	public String viewJoin(Model model) {
		return "member/join";
	}
	@GetMapping("/constract")
	public String viewConstract(Model model) {
		return "member/constract";
	}
	@GetMapping("/drop")
	public String viewDrop(Model model) {
		return "member/drop";
	}
}

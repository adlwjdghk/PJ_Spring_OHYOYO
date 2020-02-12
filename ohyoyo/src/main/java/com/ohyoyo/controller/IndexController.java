package com.ohyoyo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	@GetMapping("/")
	public String indexView(Model model) {
		log.info(">>> INDEX PAGE 출력");
		
		return "index";
	}

}

package com.ohyoyo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohyoyo.domain.ReplyDTO;
import com.ohyoyo.service.reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private ReplyService rService;
	
	@GetMapping("/list")
	public String list(int bno, Model model) {
		log.info(">>>>>>>> GET: REPLY LIST");
		log.info("**************bno"+bno);
		
		List<ReplyDTO> list = rService.list(bno);
		for (ReplyDTO replyDTO : list) {
			log.info(replyDTO.toString());
		}
		
		model.addAttribute("list", rService.list(bno));
		
		return "/board/commentlist";
	}
}

package com.ohyoyo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		model.addAttribute("list", rService.list(bno));
		
		return "/board/commentlist";
	}
	
	@ResponseBody
	@PostMapping("/insert")
	public void insert(ReplyDTO rDto) {
		log.info(">>>>> POST: REPLY INSERT");
		log.info(rDto.toString());
		
		rService.insert(rDto);
	}
	@ResponseBody
	@PostMapping("/delete")
	public void delete(int rno, int bno) {
		log.info(">>>>> POST: REPLY DELETE");
		
		rService.delete(rno, bno);
		
	}
	
}

package com.ohyoyo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohyoyo.domain.BoardDTO;
import com.ohyoyo.service.board.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String list(Model model) {
		log.info(">>>>>>>> GET: BOARD LIST");
		
		List<BoardDTO> list = bService.selectList();
		// 왜 HashMap을 사용하는지?
		// 나중에 데이터 보낼께 많아지면 hashmap으로 한꺼번에 받아서 보내는게 편해서
		HashMap<String, Object> map = new HashMap<>(); //List는 new안하는 이유는?
		map.put("list", list);
		
		model.addAttribute("map", map);
	
		return "board/list";
	}

}

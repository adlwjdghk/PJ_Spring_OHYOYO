package com.ohyoyo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ohyoyo.domain.BoardDTO;
import com.ohyoyo.service.board.BoardService;
import com.ohyoyo.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String list(
			@RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue="new")String sort_option, 
			@RequestParam(defaultValue="free")String type,
			@RequestParam(defaultValue="all")String search_option,
			@RequestParam(defaultValue="")String keyword,
			Model model) {
		
		log.info(">>>>>>>> GET: BOARD LIST");
		
		// 게시글 갯수 계산
		int count = bService.countArticle(search_option, keyword);
		
		//페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardDTO> list = bService.selectList(sort_option, search_option, keyword, start, end);
		
		if(keyword != "" && keyword != null) {
			for (BoardDTO boardDTO : list) {
				String highStart = "<span class='board_highlight'>";
				String highEnd = "</span>";
				
				String title = boardDTO.getTitle();
				String newTitle = title.replaceAll(keyword, highStart+keyword+highEnd);
				boardDTO.setTitle(newTitle);
				String name = boardDTO.getName();
				String newName = name.replaceAll(keyword, highStart+keyword+highEnd);
				boardDTO.setName(newName);
			}
		}
		
		
		// 왜 HashMap을 사용하는지?
		// 나중에 데이터 보낼께 많아지면 hashmap으로 한꺼번에 받아서 보내는게 편해서
		HashMap<String, Object> map = new HashMap<>(); //List는 new안하는 이유는?
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("type", type);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		model.addAttribute("map", map);
	
		return "board/list";
	}
	
	@GetMapping("/view/{bno}")
	public String view(@PathVariable(value="bno") int bno,
					   HttpSession session,
					   Model model) {
		log.info(">>>>>>>> GET: BOARD VIEW");
		
		// 1. 해당 bno의 조회수 +1 증가
		bService.increaseViewCnt(session, bno);
		
		// 2. DB에서 해당 bno 정보를 get해서 View단으로 전송
		BoardDTO bDto= bService.selectView(bno);
		
		model.addAttribute("one",bDto);
		model.addAttribute("key","dropBoard");
		
		return "board/view";
	}
	
	@GetMapping("/delete")
	public String delete(int bno) {
		log.info(">>>>>>>> GET: BOARD DELETE ACTION");
		bService.deleteBoard(bno);
		
		return "redirect:/board/list";
	}
	
	// 게시글 등록
	@GetMapping("/write")
	public String write() {
		log.info(">>>>>>>> GET: BOARD WRITE ACTION");
		return "/board/register";
	}
	
	// 게시글 등록 후 서버보내기
	@PostMapping("/write")
	public String write(BoardDTO bDto) {
		log.info(">>>>>>>> POST: BOARD WRITE ACTION");
		log.info("^^^^^^^^^^^^^^^^^"+bDto.toString());
		
		if(bDto.getFiles() == null) { // 첨부파일 NO
			bDto.setFilecnt(0);
		} else { // 첨부파일 YES
			bDto.setFilecnt(bDto.getFiles().length);
		}
		bService.write(bDto);
		
		return "redirect:/board/view/"+bDto.getBno();
	}
	
	// 게시글 수정 페이지
	@GetMapping("/update")
	public String update(int bno, Model model) {
		log.info(">>>>>>>> GET: BOARD UPDATE ACTION");
		log.info("***********bno***"+bno);
		
		// 수정을 원하는 게시글의 정보를 1줄 원함
		// 비즈니스 로직을 보고 활용할수 있는 게 있으면 활용하기
		// bService.selectView(bno);
		
		model.addAttribute("one",bService.selectView(bno));
		model.addAttribute("flag","update");
		
		return "/board/register";
	}
	
	// 게시글 수정후 서버보내기
	@PostMapping("/update")
	public String update(BoardDTO bDto, Model model) {
		log.info(">>>>>>>> POST: BOARD UPDATE ACTION");
		log.info("****************"+bDto.toString());
		
		bService.update(bDto);
		
		model.addAttribute("two","1");
		return "redirect:/board/view/"+bDto.getBno();
	}
	
	// 계층형 답글 만들기
	@GetMapping("/answer")
	public String answer(BoardDTO bDto, Model model) {
		log.info(">>>>>>>> GET: BOARD ANSWER VIEW PAGE");
		bDto = bService.selectView(bDto.getBno());
		String newContent = "<br><br>"
				+ "<p style='font-size:16px;'>========== Original Message ==========</p>"
				+ bDto.getView_content();
		
		bDto.setView_content(newContent);
		
		model.addAttribute("one", bDto);
		model.addAttribute("flag","answer");
		
		return "board/register";
	}
	
	// 답글 서버로
	@PostMapping("/answer")
	public String answer(BoardDTO bDto) {
		log.info(">>>>>>>> POST: BOARD ANSWER ACTION");
		// bDto에는 답글을 저장하려는 정보 (메인 게시글 bno, title, content, writer...)
		log.info(bDto.toString());
		// prevDto에는 메인 게시글의 정보가 담겨있음 (All , ref, re_level, re_step)
		BoardDTO prevDto = bService.selectView(bDto.getBno());
		log.info(prevDto.toString());
		
		// files는 실제 첨부파일 데이터x 파일 이름들이 배열로 들어가있음
		if(bDto.getFiles() == null) { // 첨부파일 NO
			bDto.setFilecnt(0);
		} else { // 첨부파일 YES
			bDto.setFilecnt(bDto.getFiles().length);
		}
		
		// 현재 bDto 정보 (메인 게시글 bno, All, 메인게시글 ref re_level re_step)
		bDto.setRef(prevDto.getRef());
		bDto.setRe_level(prevDto.getRe_level());
		bDto.setRe_step(prevDto.getRe_step());
		
		// ref, re_step, re_level
		// ref 메인게시글 그대로
		// re_step 메인게시글 re_step +1
		// re_level 메인게시글 re_level+1 인데 그전에 re_level보다 큰 애들 모두 +1
		
		bService.answer(bDto);
		
		return "redirect:/board/view/"+bDto.getBno();
	}
	
	@ResponseBody
	@PostMapping("/getAttach")
	public List<String> getAttach(int bno){
		log.info(">>>>>>>> POST: BOARD GETATTACH ACTION");
		log.info("bno: "+bno);
		return bService.getAttach(bno);
	}
}

package khu.jsp.board.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import khu.jsp.board.service.BoardService;
import khu.jsp.common.common.CommandMap;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardService")
	private BoardService boardService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	// 메인 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}

	// 회원가입 폼 불러오기
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public String regist() {
		return "regist";
	}

	// 회원가입
	@RequestMapping(value = "registUser", method = RequestMethod.GET)
	public ModelAndView registUser(CommandMap commandMap) {
		boardService.insertUser(commandMap.getMap());
		ModelAndView mv = new ModelAndView("redirect:./");
		return mv;
	}
	

	// 중복체크
	@RequestMapping(value = "checkEmail", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> checkEmail(CommandMap commandMap) throws Exception {
		Map<String, Object> map = boardService.selectUserDetail(commandMap.getMap());
		return map;
	}

	// 게시글 목록
	@RequestMapping(value = "/listBoard")
	public ModelAndView openBoardList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("listBoard");

		List<Map<String, Object>> list = boardService.selectBoardList(commandMap);
		mv.addObject("list", list);
		return mv;
	}

	// 게시글 쓰기
	@RequestMapping(value = "/writeBoard")
	public ModelAndView writeBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("writeBoard");
		return mv;
	}

	// 게시글 저장
	@RequestMapping(value = "/insertBoard")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/listBoard");
		boardService.insertBoard(commandMap.getMap(), request);

		return mv;
	}

	// 글정보보기

	@RequestMapping(value = "/infoBoard")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("infoBoard");
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}

	// 글수정입력창
	@RequestMapping(value = "/updateBoard")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("updateBoard");
		Map<String, Object> mapCheck = boardService.checkBoard(commandMap.getMap());
		mv.addObject("mapCheck", mapCheck);

		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}

	// 글수정하기
	@RequestMapping(value = "/updateBoardConfirm")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/infoBoard");
		boardService.updateBoard(commandMap.getMap(), request);

		mv.addObject("BOARD_IDX", commandMap.get("BOARD_IDX"));
		return mv;
	}

	// 글삭제하기
	@RequestMapping(value = "/deleteBoard")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:listBoard");

		boardService.deleteBoard(commandMap.getMap());

		return mv;
	}

	// 답글달기
	@RequestMapping(value = "/repleBoard")
	public ModelAndView repleBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("repleBoard");

		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		return mv;
	}

	// 답글저장
	@RequestMapping(value = "/repleBoardConfirm")
	public ModelAndView repleBoardConfirm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/listBoard");

		boardService.repleBoard(commandMap.getMap());
		mv.addObject("BOARD_IDX", commandMap.get("BOARD_IDX"));

		return mv;
	}

}

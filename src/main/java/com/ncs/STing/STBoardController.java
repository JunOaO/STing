package com.ncs.STing;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import STservice.STBservice;
import cri.PageMaker;
import cri.SearchCriteria;
import vo.STBoardVO;

@Controller
public class STBoardController {
	
	@Autowired
	STBservice service;
	/*
	@RequestMapping(value = "/main")
	public ModelAndView main(ModelAndView mv) {
		List<STBoardVO> football = new ArrayList<STBoardVO>();
		
		football = service.fmainList();
		if(football != null) {
			mv.addObject("football",football);
		} else {
			mv.addObject("message","~~ 게시글이 없습니다 ~~");
		}
		mv.setViewName("home");
		return mv;
	}
	*/
	
	@RequestMapping(value = "/FBdetail")
	public ModelAndView FBdetail(ModelAndView mv, STBoardVO vo) {
		
		vo = service.fbdetail(vo);
		
		mv.addObject("one", vo);		
		mv.setViewName("board/football_BDetail");
		
		return mv;
	}
	
	@RequestMapping(value = "/sports")
	public ModelAndView sports (ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		cri.setSnoEno();
		mv.addObject("sports",service.searchList(cri));
		pageMaker.setCri(cri);
		pageMaker.setTotalRow(service.searchRowCount(cri));
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("board/football_Board");
		return mv;
	}
	
	@RequestMapping(value = "/football_Board")
	public ModelAndView footballList(ModelAndView mv) {
		mv.setViewName("board/football_Board");
		return mv;
	}
	
	@RequestMapping(value = "/baseball_Board")
	public ModelAndView baseballList(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		mv.addObject("Banana",service.baseBallselectList());
		mv.setViewName("board/baseball_Board");
		return mv;
	}
	
	@RequestMapping(value = "/baseballf")
	public ModelAndView baseballf(ModelAndView mv) {
		mv.setViewName("board/baseball_InsertForm");
		return mv;
	}

	@RequestMapping(value = "/basketball_Board")
	public ModelAndView basketballList(ModelAndView mv) {
		mv.setViewName("board/basketball_Board");
		return mv;
	}
	
	
	@RequestMapping(value="/baseballinsert")
	public ModelAndView baseballInsert(ModelAndView mv , STBoardVO vo ,HttpServletRequest request) {
		if(service.baseballInsert(vo)>0) {
			//성공 -> blist
			mv.addObject("message","새글등록 성공");
			mv.setViewName("redirect:baseball_Board");
		}else {
			//실패 -> doFinish
			mv.addObject("message","새글등록 실패");
			mv.addObject("fCode","BF");
			mv.setViewName("member/doFinish");
		}
		return mv;
	}//binsert

}

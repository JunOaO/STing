package com.ncs.STing;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Provider.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.group.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import STservice.STMservice;
import vo.STMemberVO;


@Controller
public class STMemberController {
	
	  @Autowired 
	  STMservice service;

	//***********************************************************************************************************************
	/* 회원 가입 & ID 중복 체크 start */
	@RequestMapping(value = "/bjoinf")
	public ModelAndView bjoinf(ModelAndView mv) {
		mv.setViewName("member/joinForm");
		return mv;
	}
	
	// ID Dup Check
			@RequestMapping(value="/idDupCheck")
			public ModelAndView idDupCheck(ModelAndView mv , STMemberVO vo) {
				//client 로 부터 전달된 id의 존재여부 확인 : selectone()
				//notnull ( 존재하면 ) : 사용불가
				//null ( 존재하지 않으면 ) : 사용가능 (먼저 입력한 ID보관)
				mv.addObject("newId",vo.getId());
				if(service.selectOne(vo) != null) {
					//사용불가
					mv.addObject("idUse","F");
				}else {
					//사용가능
					mv.addObject("idUse","T");
				}
				mv.setViewName("member/idDupCheck");
				return mv;
			} // idDupCheck 
	/* 회원 가입 & ID 중복 체크 end */		
	//***********************************************************************************************************************
	
	//***********************************************************************************************************************
	@RequestMapping(value = "/loginf")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("login/loginForm");
		return mv;
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView jslogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			STMemberVO vo) {
		// jsonView 사용시 response 의 한글 처리
		response.setContentType("text/html; charset=UTF-8");

		String id = vo.getId();
		String password = vo.getPassword();
		String message = null;
		String loginSuccess = "F";
		// 입력값 확인
		if (id.length() > 0 && password.length() > 0) {
			vo = service.selectOne(vo);
			// 2. 성공(로그인 정보 보관) -> index
			// 실패 (재로그인 유도) -> loginForm
			if (vo == null) {
				message = " ID 오류 ~~~ ";
			} else {
				// Password 비교
				if (vo.getPassword().equals(password)) {
					// login 성공 -> session 에 로그인 값 보관
					HttpSession session = request.getSession();
					session.setAttribute("logID", id);
					session.setAttribute("logName", vo.getName());
					session.setAttribute("logNickname", vo.getNickname());
					loginSuccess = "T";
				} else {
					message = " Password 오류 ~~~ ";
				} // Password 비교
			} // selectOne 성공여부
		} else { // 입력값 check
			message = "값을 정확하게 모두 입력 하고 다시 하세요 ~~~";
		}
		mv.addObject("id",id);
		mv.addObject("message", message);
		mv.addObject("loginSuccess", loginSuccess);
		mv.setViewName("login/loginForm");
		return mv;
	} // login
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv,HttpServletResponse response) {

		String message = "";
		HttpSession session = request.getSession(false);
		// login 확인하기
		if ((session != null) && (session.getAttribute("logID") != null)) {
			session.invalidate();
			message = " LogOut 성공 !!! ~~~";
			mv.addObject("logout",true);
		} else
			message = " 당신은 Login 하지 않았습니다. !!! ~~~";

		// Service 결과 처리
		if (message != null)
		mv.addObject("message", message);
		mv.setViewName("home");
		return mv;
	} // logout
	//***********************************************************************************************************************
	
	//***********************************************************************************************************************	
		@RequestMapping(value="/insert")
		public ModelAndView insert(ModelAndView mv,STMemberVO vo) {
			String message =null;
			String url = "member/doFinish";
			
			if(service.insert(vo) > 0) {
				message =" 가입에 성공 하였습니다.로그인후 이용하세요.";
				mv.addObject("fCode","MJS");
			}else {
				message="가입에 실패하였습니다.다시 하세요.";
				mv.addObject("fCode","MJF");
				mv.setViewName(url);
			}
			if(message != null) {
				mv.addObject("message",message);
			}
			mv.setViewName(url);
			return mv;
		}
	//***********************************************************************************************************************	

}

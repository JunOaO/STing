/*
package com.ncs.STing;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

*//**
	* Handles requests for the application home page.
	*/
/*
@Controller
public class HomeController {

private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

*//**
	* Simply selects the home view to render by returning its name.
	*//*
		@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
		}
		
		}
		
		*/

package com.ncs.STing;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cri.PageMaker;
import cri.SearchCriteria;
//import STservice.STBoardService;
import vo.STBoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
/*
	@Autowired
	STBoardService service;
*/
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model, ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	/*	
		List<STBoardVO> football = new ArrayList<STBoardVO>();

		football = service.fmainList();
		if (football != null) {
			mv.addObject("football", football);
		} else {
			mv.addObject("message", "~~ 게시글이 없습니다 ~~");
		}
		*/
		
		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		cri.setSnoEno();
		pageMaker.setCri(cri);
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("home");
		return mv;
	}

}

package com.ncs.STing;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import STservice.STBservice;
import cri.PageMaker;
import cri.SearchCriteria;
import vo.STBoardVO;
import vo.STCommentVO;
import vo.STMatchingVO;
import vo.STMemberVO;

@Controller
public class STBoardController implements ServletContextAware{
	
	@Autowired
	STBservice service;
	
	private ServletContext context;
	
	/******************************************** 매칭 Start ********************************************/
	@RequestMapping(value = "/matchingf")
	public ModelAndView matchingf(ModelAndView mv, STBoardVO vo, STMatchingVO mvo,HttpServletRequest request) {
		String id = null;
		
		HttpSession session = request.getSession(false);
		vo = service.boardSelectOne(vo);
		id = (String)session.getAttribute("logID");
		
		mv.addObject("matchingTeam",vo);
		mv.addObject("matching",service.matchingSelect(mvo));
		mvo.setMatchingid(id);
		mv.addObject("idcheck2",service.idcheckSelect2(mvo));
		mv.setViewName("board/matching_Board");
		
		return mv;
	}
	
	@RequestMapping(value = "/matching")
	public ModelAndView matching(ModelAndView mv,STMatchingVO mvo,STBoardVO vo, STMemberVO  memvo,HttpServletRequest request) {
		String id = null;
		String  sports = null;
		
		HttpSession session = request.getSession(false);
		id = (String)session.getAttribute("logID");
		sports = vo.getSports();
		vo.setSports(sports);
		vo = service.boardSelectOne(vo);
		
		mvo.setLeaderid(vo.getId());
		mvo.setMatchingid(id);
		mvo.setSports(vo.getSports());
		service.matchingInsert(mvo);
		service.matchingUpdate(memvo);
		mv.setViewName("redirect:matchingf?seq="+ vo.getSeq()+"&sports="+vo.getSports());
		return mv;
	}
	
	@RequestMapping(value = "/partyplay")
	public String partyplay(ModelAndView mv, STMatchingVO mvo) {
		int seq = mvo.getSeq();
		String id = mvo.getMatchingid();
		
		mvo.setSeq(seq);
		mvo.setMatchingid(id);
		
		service.memberpartyplay(mvo); 
		service.partyplayD(mvo);
		return "redirect:/matchingf";
	}
	/******************************************** 매칭 End ********************************************/
	
	
	@RequestMapping(value = "/sports")
	public ModelAndView sports (ModelAndView mv, SearchCriteria cri, PageMaker pageMaker, STBoardVO vo) {
		String  sports = null;
		sports = cri.getSports();
		cri.setSports(sports);
		
		cri.setSnoEno();
		mv.addObject("Banana",service.searchList(cri));
		pageMaker.setCri(cri);
		pageMaker.setTotalRow(service.searchRowCount(cri));
		mv.addObject("pageMaker",pageMaker);
		/* mv.addObject("repleCnt",service.rePleCnt(vo)); */
		
		if (cri.getSearchType().length() > 0) {
			mv.setViewName("board/"+cri.getSearchType()+"_Board"); 
		}
		else if (cri.getSports().length() > 0){
			mv.setViewName("board/"+cri.getSports()+"_Board");
		}
		return mv;
	}
	
	@RequestMapping(value = "/footballf")
	public ModelAndView footballf(ModelAndView mv) {
		mv.setViewName("board/football_InsertForm");
		return mv;
	}
	@RequestMapping(value = "/baseballf")
	public ModelAndView baseballf(ModelAndView mv) {
		mv.setViewName("board/baseball_InsertForm");
		return mv;
	}
	@RequestMapping(value = "/basketballf")
	public ModelAndView basketballf(ModelAndView mv) {
		mv.setViewName("board/basketball_InsertForm");
		return mv;
	}
	@RequestMapping(value = "/bicyclef")
	public ModelAndView bicyclef(ModelAndView mv) {
		mv.setViewName("board/bicycle_InsertForm");
		return mv;
	}
	@RequestMapping(value = "/tennisf")
	public ModelAndView tennisf(ModelAndView mv) {
		mv.setViewName("board/tennis_InsertForm");
		return mv;
	}
	
/******************* 디테일, 수정 & 삭제 start *******************/
	
	@RequestMapping(value = "/baseball_Detail")
	public ModelAndView baseballDetail(HttpServletRequest request, ModelAndView mv, STBoardVO vo, STMatchingVO mvo,
			STMemberVO memvo, PageMaker pageMaker, SearchCriteria cri) {
		String id = null;
		HttpSession session = request.getSession(false);
		id = (String)session.getAttribute("logID");
		vo = service.boardSelectOne(vo);
		if (vo.getId().equals(id)) {
		}else {
			service.countUP(vo);
		}
		memvo.setId(id);
		if(vo != null) {
			cri.setSnoEno();
			mv.addObject("Detail",vo);
			//mv.addObject("cment",service.clist(vo)); // 댓글
			mv.addObject("profile",service.profileSelect(memvo)); //댓글 프로필
			mv.addObject("profile2",service.profileSelect2(vo)); //글쓴이 프로필
			
			mv.addObject("cment",service.repleList(cri));
			pageMaker.setCri(cri);
			pageMaker.setTotalRow(service.repleRowCount(cri));
			mv.addObject("pageMaker",pageMaker); 
			//Detail or Update 확인
			if("U".equals(request.getParameter("code"))) {
				//update
				mv.setViewName("board/baseball_UpdateForm");
			}else {
				mv.setViewName("board/baseball_DetailForm");
			}
		}else {
			mv.addObject("message","출력할 자료가 없습니다.");
			mv.setViewName("redirect:sports?sports=baseball");
		}
		return mv;
	}//baseballBoard
	
	@RequestMapping(value = "/football_Detail")
	public ModelAndView footballDetail(HttpServletRequest request, ModelAndView mv, STBoardVO vo, STMatchingVO mvo,
			STMemberVO memvo, PageMaker pageMaker, SearchCriteria cri) {
		String id = null;
		HttpSession session = request.getSession(false);
		id = (String)session.getAttribute("logID");
		vo = service.boardSelectOne(vo);
		if (vo.getId().equals(id)) {
		}else {
			service.countUP(vo);
		}
		memvo.setId(id);
		if(vo != null) {
			cri.setSnoEno();
			mv.addObject("Detail",vo);
			/* mv.addObject("cment",service.clist(vo)); */
			mv.addObject("profile",service.profileSelect(memvo)); //댓글 프로필
			mv.addObject("profile2",service.profileSelect2(vo)); //글쓴이 프로필
			
			mv.addObject("cment",service.repleList(cri));
			pageMaker.setCri(cri);
			pageMaker.setTotalRow(service.repleRowCount(cri));
			mv.addObject("pageMaker",pageMaker); 
			//Detail or Update 확인
			if("U".equals(request.getParameter("code"))) {
				//update
				mv.setViewName("board/football_UpdateForm");
			}else {
				mv.setViewName("board/football_DetailForm");
			}
		}
		else {
			mv.addObject("message","출력할 자료가 없습니다.");
			mv.setViewName("redirect:sports?sports=football");
		}
		return mv;
	}//baseballBoard
	
	@RequestMapping(value="/basketball_Detail")
	public ModelAndView basketballDetail(HttpServletRequest request, ModelAndView mv , STBoardVO vo, STMatchingVO mvo,
			STMemberVO memvo, PageMaker pageMaker, SearchCriteria cri) {
		String id = null;
		HttpSession session = request.getSession(false);
		id = (String)session.getAttribute("logID");
		vo = service.boardSelectOne(vo);
		if (vo.getId().equals(id)) {
		}else {
			service.countUP(vo);
		}
		memvo.setId(id);
		if(vo != null) {
			cri.setSnoEno();
			mv.addObject("Detail",vo);
			/* mv.addObject("cment",service.clist(vo)); */
			mv.addObject("profile",service.profileSelect(memvo)); //댓글 프로필
			mv.addObject("profile2",service.profileSelect2(vo)); //글쓴이 프로필
			
			mv.addObject("cment",service.repleList(cri));
			pageMaker.setCri(cri);
			pageMaker.setTotalRow(service.repleRowCount(cri));
			mv.addObject("pageMaker",pageMaker); 
			//Detail or Update 확인
			if("U".equals(request.getParameter("code"))) {
				//update
				mv.setViewName("board/basketball_UpdateForm");
			}else {
				mv.setViewName("board/basketball_DetailForm");
			}
		}
		else {
			mv.addObject("message","출력할 자료가 없습니다.");
			mv.setViewName("redirect:sports?sports=basketball");
		}
		return mv;
	}//baseballBoard
	
	@RequestMapping(value="/tennis_Detail")
	public ModelAndView tennisDetail(HttpServletRequest request, ModelAndView mv , STBoardVO vo, STMatchingVO mvo,
			STMemberVO memvo, PageMaker pageMaker, SearchCriteria cri) {
		String id = null;
		HttpSession session = request.getSession(false);
		id = (String)session.getAttribute("logID");
		vo = service.boardSelectOne(vo);
		if (vo.getId().equals(id)) {
		}else {
			service.countUP(vo);
		}
		memvo.setId(id);
		if(vo != null) {
			cri.setSnoEno();
			mv.addObject("Detail",vo);
			/* mv.addObject("cment",service.clist(vo)); */
			mv.addObject("profile",service.profileSelect(memvo)); //댓글 프로필
			mv.addObject("profile2",service.profileSelect2(vo)); //글쓴이 프로필
			
			mv.addObject("cment",service.repleList(cri));
			pageMaker.setCri(cri);
			pageMaker.setTotalRow(service.repleRowCount(cri));
			mv.addObject("pageMaker",pageMaker); 
			//Detail or Update 확인
			if("U".equals(request.getParameter("code"))) {
				//update
				mv.setViewName("board/tennis_UpdateForm");
			}else {
				mv.setViewName("board/tennis_DetailForm");
			}
		}
		else {
			mv.addObject("message","출력할 자료가 없습니다.");
			mv.setViewName("redirect:sports?sports=tennis");
		}
		return mv;
	}//baseballBoard
	
	@RequestMapping(value="/bicycle_Detail")
	public ModelAndView bicycleDetail(HttpServletRequest request, ModelAndView mv , STBoardVO vo, STMatchingVO mvo,
			STMemberVO memvo, PageMaker pageMaker, SearchCriteria cri) {
		String id = null;
		HttpSession session = request.getSession(false);
		id = (String)session.getAttribute("logID");
		vo = service.boardSelectOne(vo);
		if (vo.getId().equals(id)) {
		}else {
			service.countUP(vo);
		}
		memvo.setId(id);
		if(vo != null) {
			cri.setSnoEno();
			mv.addObject("Detail",vo);
			/* mv.addObject("cment",service.clist(vo)); */
			mv.addObject("profile",service.profileSelect(memvo)); //댓글 프로필
			mv.addObject("profile2",service.profileSelect2(vo)); //글쓴이 프로필
			
			mv.addObject("cment",service.repleList(cri));
			pageMaker.setCri(cri);
			pageMaker.setTotalRow(service.repleRowCount(cri));
			mv.addObject("pageMaker",pageMaker); 
			//Detail or Update 확인
			if("U".equals(request.getParameter("code"))) {
				//update
				mv.setViewName("board/bicycle_UpdateForm");
			}else {
				mv.setViewName("board/bicycle_DetailForm");
			}
		}
		else {
			mv.addObject("message","출력할 자료가 없습니다.");
			mv.setViewName("redirect:sports?sports=bicycle");
		}
		return mv;
	}//baseballBoard

//================= 디테일 end ===================
	
	@RequestMapping(value="/baseball_Update")
	public ModelAndView baseballUpdate(ModelAndView mv , STBoardVO vo) {
				
		if ( service.baseballUpdate(vo) > 0 ) {
			// Update 성공 => baseballBoard
			mv.addObject("message","글 수정 성공");
			mv.setViewName("redirect:sports?sports=baseball");
			
		}else {
			// Update 실패 => 실패 message, doFinish 출력
			mv.addObject("message","글 수정 실패");
			mv.addObject("fCode","BF");
			mv.setViewName("member/doFinish");
		}
		return mv;
	}//baseball_Update
	
	@RequestMapping(value="/football_Update")
	public ModelAndView footballballUpdate(ModelAndView mv , STBoardVO vo) {
		
		if ( service.footballUpdate(vo) > 0 ) {
			// Update 성공 => baseballBoard
			mv.addObject("message","글 수정 성공");
			mv.setViewName("redirect:sports?sports=football");
			
		}else {
			// Update 실패 => 실패 message, doFinish 출력
			mv.addObject("message","글 수정 실패");
			mv.addObject("fCode","FF");
			mv.setViewName("member/doFinish");
		}
		return mv;
	}//football_Update
	
	@RequestMapping(value="/basketball_Update")
	public ModelAndView basketballUpdate(ModelAndView mv , STBoardVO vo) {
		
		if ( service.basketballUpdate(vo) > 0 ) {
			// Update 성공 => baseballBoard
			mv.addObject("message","글 수정 성공");
			mv.setViewName("redirect:sports?sports=basketball");
			
		}else {
			// Update 실패 => 실패 message, doFinish 출력
			mv.addObject("message","글 수정 실패");
			mv.addObject("fCode","KF");
			mv.setViewName("member/doFinish");
		}
		return mv;
	}//basketball_Update
	
	@RequestMapping(value="/tennis_Update")
	public ModelAndView tennisUpdate(ModelAndView mv , STBoardVO vo) {
		
		if ( service.tennisUpdate(vo) > 0 ) {
			// Update 성공 => baseballBoard
			mv.addObject("message","글 수정 성공");
			mv.setViewName("redirect:sports?sports=tennis");
			
		}else {
			// Update 실패 => 실패 message, doFinish 출력
			mv.addObject("message","글 수정 실패");
			mv.addObject("fCode","TF");
			mv.setViewName("member/doFinish");
		}
		return mv;
	}//tennis_Update
	
	@RequestMapping(value="/bicycle_Update")
	public ModelAndView bicycleUpdate(ModelAndView mv , STBoardVO vo) {
		
		if ( service.bicycleUpdate(vo) > 0 ) {
			// Update 성공 => baseballBoard
			mv.addObject("message","글 수정 성공");
			mv.setViewName("redirect:sports?sports=bicycle");
			
		}else {
			// Update 실패 => 실패 message, doFinish 출력
			mv.addObject("message","글 수정 실패");
			mv.addObject("fCode","CF");
			mv.setViewName("member/doFinish");
		}
		return mv;
	}//tennis_Update
	
//====================== 업데이트 end ======================

	@RequestMapping(value="/baseball_Delete")
	public ModelAndView baseballDelete(ModelAndView mv,STBoardVO vo) {
		
		int count = service.baseballDelete(vo);
		
		if(count > 0) {
			mv.addObject("message","글삭제 성공");
			mv.setViewName("redirect:sports?sports=baseball");
		}else {
			mv.addObject("message","글삭제 실패");
			mv.setViewName("member/doFinish");
		}
		
		return mv;
	}
	@RequestMapping(value="/football_Delete")
	public ModelAndView footballDelete(ModelAndView mv,STBoardVO vo) {
		
		int count = service.footballDelete(vo);
		
		if(count > 0) {
			mv.addObject("message","글삭제 성공");
			mv.setViewName("redirect:sports?sports=football");
		}else {
			mv.addObject("message","글삭제 실패");
			mv.setViewName("member/doFinish");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/basketball_Delete")
	public ModelAndView basketballDelete(ModelAndView mv,STBoardVO vo) {
		
		int count = service.basketballDelete(vo);
		
		if(count > 0) {
			mv.addObject("message","글삭제 성공");
			mv.setViewName("redirect:sports?sports=basketball");
		}else {
			mv.addObject("message","글삭제 실패");
			mv.setViewName("member/doFinish");
		}
		
		return mv;
	}
	@RequestMapping(value="/tennis_Delete")
	public ModelAndView tennisDelete(ModelAndView mv,STBoardVO vo) {
		
		int count = service.tennisDelete(vo);
		
		if(count > 0) {
			mv.addObject("message","글삭제 성공");
			mv.setViewName("redirect:sports?sports=tennis");
		}else {
			mv.addObject("message","글삭제 실패");
			mv.setViewName("member/doFinish");
		}
		
		return mv;
	}
	@RequestMapping(value="/bicycle_Delete")
	public ModelAndView bicycleDelete(ModelAndView mv,STBoardVO vo) {
		
		int count = service.bicycleDelete(vo);
		
		if(count > 0) {
			mv.addObject("message","글삭제 성공");
			mv.setViewName("redirect:sports?sports=bicycle");
		}else {
			mv.addObject("message","글삭제 실패");
			mv.setViewName("member/doFinish");
		}
		
		return mv;
	}
	/******************* 디테일, 수정 & 삭제 end *******************/
	
//================================ 최신글 불러오기 start ==========================================================
	@RequestMapping(value = "/NewBoard")
	public ModelAndView baseball_NewBoard(ModelAndView mv, STMemberVO memvo,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String id = null;
		id = (String)session.getAttribute("logID");
		if (id != null) {
			memvo.setId(id);
			mv.addObject("profile", service.profileSelect(memvo));
		}
		mv.addObject("newBaseball",service.baseballSelectList());		
		mv.addObject("newFootBall",service.footballSelectList());		
		mv.addObject("newBasketBall",service.basketballSelectList());		
		mv.addObject("newTennis",service.tennisSelectList());		
		mv.addObject("newBicycle",service.bicycleSelectList());		
		mv.setViewName("board/newHome");
		
		return mv;
	}
//================================ 최신글 불러오기 end ==========================================================

//==============================================================================================================
		@RequestMapping(value="/baseballinsert")
		public ModelAndView baseballInsert(ModelAndView mv , STBoardVO vo) {
			if(service.baseballInsert(vo)>0) {
				//성공 -> blist
				service.boardLeaderUpdate(vo);
				mv.setViewName("redirect:sports?sports=baseball");
			}else {
				//실패 -> doFinish
				mv.addObject("message","새글등록 실패");
				mv.addObject("fCode","FF");
				mv.setViewName("member/doFinish");
			}
			return mv;
		}//baseball_insert
		@RequestMapping(value="/footballinsert")
		public ModelAndView footballinsert(ModelAndView mv , STBoardVO vo) {
			if(service.footballInsert(vo)>0) {
				//성공 -> blist
				service.boardLeaderUpdate(vo);
				mv.addObject("message","새글등록 성공");
				mv.setViewName("redirect:sports?sports=football");
			}else {
				//실패 -> doFinish
				mv.addObject("message","새글등록 실패");
				mv.addObject("fCode","FF");
				mv.setViewName("member/doFinish");
			}
			return mv;
		}//football_insert
		@RequestMapping(value="/basketballinsert")
		public ModelAndView basketballinsert(ModelAndView mv , STBoardVO vo) {
			if(service.basketballInsert(vo)>0) {
				//성공 -> blist
				service.boardLeaderUpdate(vo);
				mv.addObject("message","새글등록 성공");
				mv.setViewName("redirect:sports?sports=basketball");
			}else {
				//실패 -> doFinish
				mv.addObject("message","새글등록 실패");
				mv.addObject("fCode","FF");
				mv.setViewName("member/doFinish");
			}
			return mv;
		}//football_insert
		@RequestMapping(value="/tennisinsert")
		public ModelAndView tennisinsert(ModelAndView mv , STBoardVO vo) {
			if(service.tennisInsert(vo)>0) {
				//성공 -> blist
				service.boardLeaderUpdate(vo);
				mv.addObject("message","새글등록 성공");
				mv.setViewName("redirect:sports?sports=tennis");
			}else {
				//실패 -> doFinish
				mv.addObject("message","새글등록 실패");
				mv.addObject("fCode","FF");
				mv.setViewName("member/doFinish");
			}
			return mv;
		}//football_insert
		@RequestMapping(value="/bicycleinsert")
		public ModelAndView bicycleinsert(ModelAndView mv , STBoardVO vo) {
			if(service.bicycleInsert(vo)>0) {
				//성공 -> blist
				service.boardLeaderUpdate(vo);
				mv.addObject("message","새글등록 성공");
				mv.setViewName("redirect:sports?sports=bicycle");
			}else {
				//실패 -> doFinish
				mv.addObject("message","새글등록 실패");
				mv.addObject("fCode","FF");
				mv.setViewName("member/doFinish");
			}
			return mv;
		}//football_insert

//==============================================================================================================
	
	@RequestMapping(value = "/file_uploader_html5", method = RequestMethod.POST)
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String sFileInfo = "";
		//파일명 - 싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴 
		String name = request.getHeader("file-name");
		String ext = name.substring(name.lastIndexOf(".")+1);
		//파일 기본경로
		String root = request.getContextPath() + "/resources";
		String defaultPath = context.getRealPath("/resources");
		//파일 기본경로 _ 상세경로
		String path = defaultPath + File.separator + "upload" + File.separator;
		File file = new File(path);
		if(!file.exists()) {
		  file.mkdirs();
		}
		String realname = UUID.randomUUID().toString() + "." + ext;
		InputStream is = request.getInputStream();
		String storedFileName = path + realname;
		OutputStream os=new FileOutputStream(storedFileName);
		int numRead;
		//파일쓰기
		byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
		while((numRead = is.read(b,0,b.length)) != -1){
		  os.write(b,0,numRead);
		}
		if(is != null) {
		  is.close();
		}
		os.flush();
		os.close();

		sFileInfo += "&bNewLine=true&sFileName="+ name+"&sFileURL=" + root + "/upload/"+realname;
		PrintWriter out = response.getWriter();
		out.println(sFileInfo);
	}
	
	@RequestMapping(value="/file_uploader", method=RequestMethod.POST)
	public void file_uploader(HttpServletRequest request, HttpServletResponse response) throws IOException, FileUploadException {
		request.setCharacterEncoding("utf-8");
		String return1="";
		String return2="";
		String return3="";
		String name = "";
		if (ServletFileUpload.isMultipartContent(request)){
		    ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		    //UTF-8 인코딩 설정
		    uploadHandler.setHeaderEncoding("UTF-8");
		    List<FileItem> items = uploadHandler.parseRequest(request);
		    //각 필드태그들을 FOR문을 이용하여 비교를 합니다.
		    for (FileItem item : items) {
		        if(item.getFieldName().equals("callback")) {
		            return1 = item.getString("UTF-8");
		        } else if(item.getFieldName().equals("callback_func")) {
		            return2 = "?callback_func="+item.getString("UTF-8");
		        } else if(item.getFieldName().equals("Filedata")) {
		            //FILE 태그가 1개이상일 경우
		            if(item.getSize() > 0) {
		            	name = item.getName();
		                String ext = item.getName().substring(item.getName().lastIndexOf(".")+1);
		                //파일 기본경로
		                String defaultPath = context.getRealPath("/");
		                //파일 기본경로 _ 상세경로
		                String path = defaultPath + "upload" + File.separator;
		                 
		                File file = new File(path);
		                 
		                //디렉토리 존재하지 않을경우 디렉토리 생성
		                if(!file.exists()) {
		                    file.mkdirs();
		                }
		                //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
		                String realname = UUID.randomUUID().toString() + "." + ext;
		                ///////////////// 서버에 파일쓰기 ///////////////// 
		                InputStream is = item.getInputStream();
		                OutputStream os=new FileOutputStream(path + realname);
		                int numRead;
		                byte b[] = new byte[(int)item.getSize()];
		                while((numRead = is.read(b,0,b.length)) != -1){
		                    os.write(b,0,numRead);
		                }
		                if(is != null)  is.close();
		                os.flush();
		                os.close();
		                ///////////////// 서버에 파일쓰기 /////////////////
		                String root = request.getContextPath();

		                return3 += "&bNewLine=true&sFileName="+name+"&sFileURL=" + root + "/upload/"+realname;	// by ksseo
		            }else {
		                return3 += "&errstr=error";
		            }
		        }
		    }
		}
		response.sendRedirect(return1+return2+return3);
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.context = servletContext;
	}
	
	@RequestMapping(value = "/comment_insert")
	public ModelAndView commentInsert(ModelAndView mv, STBoardVO vo, STCommentVO cvo,STMemberVO memvo) {
		memvo = service.profileSelectOne(memvo);
		cvo.setProfile(memvo.getProfile());
		service.commentInsert(cvo);
		mv.setViewName("redirect:"+vo.getSports()+"_Detail?seq=" + cvo.getSeq()+"&sports="+vo.getSports());
		return mv;
	}

	@RequestMapping(value = "/comment_delelte")
	public ModelAndView commentDelete(ModelAndView mv, STBoardVO vo, STCommentVO cvo) {
		service.commentDelete(cvo);
		mv.setViewName("redirect:"+vo.getSports()+"_Detail?seq=" + cvo.getSeq()+"&sports="+vo.getSports());
		return mv;
	}

}

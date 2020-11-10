package com.ncs.STing;

import java.io.Console;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import STservice.STBservice;
import cri.PageMaker;
import cri.SearchCriteria;
import vo.STBoardVO;

@Controller
public class STBoardController {
	
	@Autowired
	STBservice service;
	
	private ServletContext context;

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
		mv.addObject("Banana",service.searchList(cri));
		pageMaker.setCri(cri);
		pageMaker.setTotalRow(service.searchRowCount(cri));
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("board/"+cri.getSearchType()+"_Board");
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
	
	@RequestMapping(value = "/stBoard")
	public ModelAndView stboard(ModelAndView mv) {
		mv.setViewName("board/stBoard");
		return mv;
	}
	@RequestMapping(value = "/football_Board")
	public ModelAndView footballList(ModelAndView mv) {
		mv.setViewName("board/football_Board");
		return mv;
	}
	@RequestMapping(value = "/baseball_Board")
	public ModelAndView baseballList(HttpServletRequest request,ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		cri.setSnoEno();
		mv.addObject("Banana",service.baseBallselectList(cri));
		pageMaker.setCri(cri);
		pageMaker.setTotalRow(service.boardRowCount(cri));
		
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("board/baseball_Board");
		return mv;
	}
	
	@RequestMapping(value = "/baseball_NewBoard")
	public ModelAndView baseball_NewBoard(ModelAndView mv) {
		mv.addObject("Newbaseball",service.baseBallselectList());		
		
		mv.setViewName("home");
		return mv;
	}
	
	
	@RequestMapping(value = "/basketball_Board")
	public ModelAndView basketballList(ModelAndView mv) {
		mv.setViewName("board/basketball_Board");
		return mv;
	}
	@RequestMapping(value = "/bicycle_Board")
	public ModelAndView bicycleList(ModelAndView mv) {
		mv.setViewName("board/bicycle_Board");
		return mv;
	}
	@RequestMapping(value = "/tennis_Board")
	public ModelAndView tennisList(ModelAndView mv) {
		mv.setViewName("board/tennis_Board");
		return mv;
	}
	
	
	
	@RequestMapping(value="/basebalinsert")
	public ModelAndView baseballInsert(ModelAndView mv , STBoardVO vo) {
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
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request) throws IOException, FileUploadException {
		String title = request.getParameter("title");
		String smarteditor = request.getParameter("smarteditor");
//		
//		System.out.println("title = " + title);
//		System.out.println("content = " + smarteditor);
		ModelAndView model = new ModelAndView("write");
		model.addObject("title", title);
		model.addObject("smarteditor", smarteditor);
		return model;
	}
	
	public void setServletContext(ServletContext servletContext) {
		this.context = servletContext;
	}

}

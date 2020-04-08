package com.pro.semi;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.BbsVO;
import com.data.vo.HospitalVO;
import com.data.vo.ProtectVO;
import com.data.vo.RescueVO;
import com.data.vo.StoreVO;

import mybatis.dao.BbsDAO;
import spring.util.Paging;

@Controller
public class BbsAction {
	
	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 5;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode;
	
	@Autowired
	BbsDAO bbsDao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/bbs.inc")
	public ModelAndView list(String nowPage, String s_type) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		
		String type = s_type;
		
		// ---------------------------------------
		Paging page = null;
		int begin, end;
		BbsVO[] ar = null;
		switch(Integer.parseInt(type)) {
		case 4:
			rowTotal = bbsDao.getTotalCount(4);
			page = new Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, type);
			pageCode = page.getSb().toString();
			
			// 게시물 목록 ------------------------------
			begin = page.getBegin();
			end = page.getEnd();
			
			ar = bbsDao.getList(begin, end, type);
			break;
		case 5:
			rowTotal = bbsDao.getTotalCount(5);
			page = new Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, type);
			pageCode = page.getSb().toString();
			
			// 게시물 목록 ------------------------------
			begin = page.getBegin();
			end = page.getEnd();
			
			ar = bbsDao.getList(begin, end, type);
			break;
		}
		session.setAttribute("ar", ar);
		mv.addObject("ar", ar);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("pageCode", pageCode);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("type", type);
		
		mv.setViewName("bbslist");
		return mv;
	}
	
	
}
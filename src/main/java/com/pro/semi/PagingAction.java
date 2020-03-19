package com.pro.semi;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.util.Paging;

@Controller
public class PagingAction {
	
	@Autowired
	HttpServletRequest request;
	
	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 10;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode;
	
	@RequestMapping("/paging.inc")
	public ModelAndView list(String nowPage) throws Exception {
		ModelAndView mv = new ModelAndView();
		String type = (String) request.getAttribute("type");
		
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		
//		mv.addObject("list", getList(nowPage));
		//this.rowTotal = bbsDao.getTotalCount(bname);
		Paging page = new Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);

		// 페이지 기법의 HTML코드
		pageCode = page.getSb().toString();
		
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.setViewName("list");

		return mv;
	}
	
}

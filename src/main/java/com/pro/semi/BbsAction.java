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

import com.data.vo.HospitalVO;
import com.data.vo.ProtectVO;
import com.data.vo.RescueVO;
import com.data.vo.StoreVO;

import spring.util.Paging;

@Controller
public class BbsAction {
	
	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 10;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode;
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/bbs.inc")
	public ModelAndView list(String nowPage, String s_type) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String type = null;
		if(s_type == null) {
			type = "0";
		} else {
			type = s_type;
		}
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		// ---------------------------------------
		switch(Integer.parseInt(type)) {
		case 4:
			//RescueVO[] r_list = getRes(this.nowPage, s_type);
			//mv.addObject("ar", r_list);
			//session.setAttribute("ar", r_list);
			break;
		case 5:
			//HospitalVO[] h_list = getHos(this.nowPage, s_type);
			//mv.addObject("ar", h_list);
			//session.setAttribute("ar", h_list);
			break;
		}
		
		//this.rowTotal = bbsDao.getTotalCount(bname);
		Paging page = new Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, type);

		// 페이지 기법의 HTML코드
		pageCode = page.getSb().toString();
		
		mv.addObject("pageCode", pageCode);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("type", type);
		mv.setViewName("main");
		request.setAttribute("type", type);
		request.setAttribute("chk", "0");
		
		return mv;
	}
	
}
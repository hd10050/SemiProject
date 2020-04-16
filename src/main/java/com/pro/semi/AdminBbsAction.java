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
import com.data.vo.MemberVO;
import com.data.vo.ProtectVO;
import com.data.vo.RescueVO;
import com.data.vo.StoreVO;

import mybatis.dao.BbsDAO;
import mybatis.dao.MemDAO;
import spring.util.Paging;

@Controller
public class AdminBbsAction {
	
	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 5;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode;
	
	@Autowired
	BbsDAO bbsDao;
	@Autowired
	MemDAO memDao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/ad_bbs.inc")
	public ModelAndView list(String nowPage, String m_idx) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		// ---------------------------------------
		System.out.println(m_idx);
		MemberVO mvo = memDao.get_mem(m_idx);
		
		if(nowPage != null) {
			this.nowPage = Integer.parseInt(nowPage);
		} else {
			this.nowPage = 1;
		}
		Paging page = null;
		int begin, end;
		BbsVO[] ar = null;

		rowTotal = bbsDao.getAd_totalCount(m_idx);
		page = new Paging(m_idx, this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		pageCode = page.getSb().toString();
		
		// 게시물 목록 ------------------------------
		begin = page.getBegin();
		end = page.getEnd();
		
		ar = bbsDao.getAd_list(begin, end, m_idx);
		
		session.setAttribute("ar", ar);
		mv.addObject("ar", ar);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("pageCode", pageCode);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("mvo", mvo);
		
		mv.setViewName("admin_bbslist");
		return mv;
	}
	
	
}
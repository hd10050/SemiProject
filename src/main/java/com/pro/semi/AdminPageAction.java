package com.pro.semi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.BbsVO;
import com.data.vo.MemberVO;

import mybatis.dao.MemDAO;
import spring.util.Paging;

@Controller
public class AdminPageAction {
	
	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 5;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode;

	@Autowired
	private MemDAO memDao;
	
	@RequestMapping(value="/ad_page.inc", method=RequestMethod.GET)
	public ModelAndView adminPage(String nowPage) {
		ModelAndView mv = new ModelAndView();
		
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		
		// ---------------------------------------
		Paging page = null;
		int begin, end;
		MemberVO[] ar = null;
		rowTotal = memDao.getTotalCount();
		page = new Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		pageCode = page.getSb().toString();
		
		// 게시물 목록 ------------------------------
		begin = page.getBegin();
		end = page.getEnd();
		
		ar = memDao.getList(begin, end);

		mv.addObject("ar", ar);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("pageCode", pageCode);
		mv.setViewName("adminPage");
		
		return mv;
	}
	
	@RequestMapping(value="/ad_changelv.inc", method=RequestMethod.POST)
	public ModelAndView ad_changeLevel(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		memDao.mem_change(vo);

		mv.setViewName("redirect:/ad_page.inc");
		return mv;
	}

	@RequestMapping(value="/ad_ban.inc", method=RequestMethod.POST)
	public ModelAndView ad_ban(String m_idx) {
		ModelAndView mv = new ModelAndView();
		MemberVO vo = memDao.get_mem(m_idx);
		memDao.delMem(vo);

		mv.setViewName("redirect:/ad_page.inc");
		return mv;
	}

}

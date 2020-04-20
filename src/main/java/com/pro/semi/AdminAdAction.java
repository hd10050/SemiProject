package com.pro.semi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.AdVO;

import mybatis.dao.AdDAO;
import spring.util.Paging;

@Controller
public class AdminAdAction {

	// 페이징 기법 상수
	public final int BLOCK_LIST = 10;	// 한 페이지당 보여질 게시물 수
	public final int BLOCK_PAGE = 5;	// 한 블럭당 보여질 페이지 수
	int nowPage, rowTotal;
	String pageCode;
	
	@Autowired
	private AdDAO adDao;
	
	@RequestMapping("/ad_ad.inc")
	public ModelAndView adminPage(String nowPage) {
		ModelAndView mv = new ModelAndView();
		
		if(nowPage == null) { this.nowPage = 1; }
		else { this.nowPage = Integer.parseInt(nowPage); }
		
		// ---------------------------------------
		Paging page = null;
		int begin, end;
		AdVO[] ad_ar = null;
		rowTotal = adDao.getTotalCount();
		page = new Paging(this.nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, "ad");
		pageCode = page.getSb().toString();
		
		// 게시물 목록 ------------------------------
		begin = page.getBegin();
		end = page.getEnd();
		
		ad_ar = adDao.getList(begin, end);
		mv.addObject("ar", ad_ar);
		mv.addObject("nowPage", page.getNowPage());
		mv.addObject("pageCode", pageCode);
		
		mv.setViewName("admin_ad");
		
		return mv;
	}

}

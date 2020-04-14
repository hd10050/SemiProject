package com.pro.semi;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.BbsVO;
import com.data.vo.ReviewVO;

import mybatis.dao.BbsDAO;
import mybatis.dao.ReviewDAO;

@Controller
public class BbsViewAction {
	
	@Autowired
	private ReviewDAO reviewDao;
	@Autowired
	private BbsDAO bbsDao;
	@Autowired
	private ServletContext application;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="/bbs_view.inc", method=RequestMethod.POST)
	public ModelAndView view(String type, String nowPage, String b_idx) {
		ModelAndView mv = new ModelAndView();
		BbsVO vo = bbsDao.view(b_idx);
		ReviewVO[] review_ar = reviewDao.listReview(b_idx);
		
		// 조회수 관련 처리 ----------
		Object obj = session.getAttribute("read_list");
		List<String> read_list = (ArrayList)obj;
		if (read_list == null || read_list.size() < 1) {
			read_list = new ArrayList<String>();
		}

		boolean chk = false;
		for(int i = 0 ; i < read_list.size() ; i++) {
			if(read_list.get(i).equals(vo.getB_idx())) {
				chk = true;
				break; 
			}
		}
		if(!chk) {
			int hit = Integer.parseInt(vo.getHit());
			vo.setHit(String.valueOf(Integer.parseInt(vo.getHit()) + 1));
			bbsDao.hit(vo.getB_idx());

			read_list.add(vo.getB_idx());
		}
		session.setAttribute("read_list", read_list);
		// ------------------------------*/
				
		session.setAttribute("vo", vo);
		mv.addObject("review_ar", review_ar);
		mv.addObject("vo", vo);
		mv.addObject("type", type);
		mv.addObject("nowPage", nowPage);
		mv.addObject("b_idx", b_idx);
		mv.setViewName("bbsView");
		return mv;
	}
	
	@RequestMapping(value="/bbs_view.inc", method=RequestMethod.GET)
	public ModelAndView view2(String type, String nowPage, String b_idx) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("type", type);
		mv.addObject("nowPage", nowPage);
		mv.addObject("b_idx", b_idx);
		mv.setViewName("bbsView2");
		return mv;
	}

}

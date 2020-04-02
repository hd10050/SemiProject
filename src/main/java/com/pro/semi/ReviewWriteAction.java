package com.pro.semi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.MemberVO;
import com.data.vo.ReviewVO;

import mybatis.dao.ReviewDAO;

@Controller
public class ReviewWriteAction {
	
	@Autowired
	private ReviewDAO reviewDao;
	
	@RequestMapping("/r_write.inc")
	public ModelAndView r_write(String m_idx, String b_idx, String r_content, String r_score, String type) {
		ModelAndView mv = new ModelAndView();
		String str = "redirect:/main.inc";
		ReviewVO vo = new ReviewVO(m_idx, b_idx, r_score, r_content);
		
		if(reviewDao.writeReview(vo)) {
			switch(Integer.parseInt(type)){
			case 0:
				str = "redirect:/view.inc?type=0&RESCUE_INST_TELNO=" + b_idx;
				break;
			case 1:
				str = "redirect:/view.inc?type=1&LOCPLC_FACLT_TELNO=" + b_idx;
				break;
			case 2:
				str = "redirect:/view.inc?type=2&LOCPLC_FACLT_TELNO=" + b_idx;
				break;
			case 3:
				str = "redirect:/view.inc?type=3&ENTRPS_TELNO=" + b_idx;
				break;
			}
		}
		
		mv.setViewName(str);
		return mv;
	}
	
	@RequestMapping("/c_write.inc")
	public ModelAndView c_write(String m_idx, String b_idx, String r_content, String type, String nowPage) {
		ModelAndView mv = new ModelAndView();
		String str = "redirect:/main.inc";
		ReviewVO vo = new ReviewVO(m_idx, b_idx, "-1", r_content);
		System.out.println(vo.getR_content());
		if(reviewDao.writeReview(vo)) {
			switch(Integer.parseInt(type)){
			case 4:
				str = "redirect:/bbs_view.inc?type=4&nowPage=" + nowPage + "&b_idx=" + b_idx ;
				break;
			case 5:
				str = "redirect:/bbs_view.inc?type=5&nowPage=" + nowPage + "&b_idx=" + b_idx ;
				break;
			}
		}
		
		mv.setViewName(str);
		return mv;
	}
}
	

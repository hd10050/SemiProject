package com.pro.semi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.ReviewVO;

import mybatis.dao.ReviewDAO;

@Controller
public class EditAction {
	
	@Autowired
	private ReviewDAO reviewDao;
	
	@RequestMapping("/r_edit.inc")
	public ModelAndView r_edit(String r_idx, String b_idx, String content, String type) {
		ModelAndView mv = new ModelAndView();
		String str = "redirect:/main.inc";
		ReviewVO rvo = reviewDao.getReview(r_idx);
		rvo.setR_content(content);
		
		if(reviewDao.updateReview(rvo)) {
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
}
	

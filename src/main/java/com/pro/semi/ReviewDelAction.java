package com.pro.semi;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.data.vo.ReviewVO;

import mybatis.dao.ReviewDAO;

@Controller
public class ReviewDelAction {
	
	@Autowired
	private ReviewDAO reviewDao;
	
	@ResponseBody
	@RequestMapping("/r_del.inc")
	public Map<String, String> r_edit(String r_idx) {
		Map<String, String> map = new HashMap<String, String>();
		
		if(reviewDao.delReview(r_idx)) {
			map.put("value", "1");
		} else {
			map.put("value", "0");
		}

		return map;
	}
}
	

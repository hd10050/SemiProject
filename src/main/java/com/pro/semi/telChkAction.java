package com.pro.semi;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.data.vo.MemberVO;

import mybatis.dao.MemDAO;

@Controller
public class telChkAction {

		@Autowired
		MemDAO m_dao;
		
		@ResponseBody
		@RequestMapping("/telchk.inc")
		public Map<String, String> phonechk(String phone){
			Map<String, String>map = new HashMap<String, String>();
			
			MemberVO vo = m_dao.telchk(phone);
			
			if(vo != null) {
				//id가 중복일 경우
				map.put("chk", "1");
				
			}else {
				//id가 중복이 아닐 경우
				map.put("chk", "0");
				
			}
			
			return map;
		}
}

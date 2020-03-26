package com.pro.semi;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.data.vo.MemberVO;

@Controller
public class LogoutAction {

	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	
	@ResponseBody
	@RequestMapping("/logout.inc")
	public Map<String, String> logout() {
		Map<String, String>map = new HashMap<String, String>();
		
		session.removeAttribute("mvo");
		
		MemberVO mvo = (MemberVO)request.getAttribute("mvo");
		
		String chk = "0";
		if(mvo == null) {
			chk = "1";
		}
		map.put("chk", chk);
		
		return map;
	}
}

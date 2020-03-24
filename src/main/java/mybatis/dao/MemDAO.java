package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.MemberVO;

public class MemDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	 
	//회원 가입 가능
	public boolean join(MemberVO vo) {
		boolean chk = false;
		int cnt =  ss.insert("mem.joinMem", vo);
	
		if(cnt > 0) {
			chk = true;
		}
		return chk;
	}
	
	
	//회원 탈퇴
	public boolean delMem(MemberVO vo) {
		boolean chk = false;
		int cnt = ss.update("mem.delMem", vo);
		
		if(cnt>0) {
			chk = true;
		}
		return chk;
	}
	
	
	//회원 수정
	public boolean updateMem(MemberVO vo) {
		boolean chk = false;
		int cnt = ss.update("updateMem",vo);
		
		if(cnt>0) {
			chk = true;
		}
		return chk;
	}
	
	//회원 로그인
	public MemberVO login(String m_pw, String m_id) {
		
		Map<String, String>map = new HashMap<String, String>();	
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		MemberVO vo = ss.selectOne("mem.login", map);
		
		return vo;
	}
	
	

	
	
	
	
	
}

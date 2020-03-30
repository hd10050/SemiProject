package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.MemberVO;

public class MemDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	//sns코드 찾기
	public MemberVO snslogin(String code) {
		MemberVO vo = null;
		vo = ss.selectOne("mem.sns_login", code);
		return vo;
	}
	
	//회원 가입 가능
	public boolean join(MemberVO vo) {
		boolean chk = false;
		if(vo.getR_snscode() == null) {
			vo.setR_snscode("0");
		}
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
	
	//비밀번호 체크 
	public boolean pwdCheck(String m_id, String m_pw) {
        int result = 0;
        try {
            Map<String, String> map = new HashMap<String, String>();
            map.put("m_id", m_id);
            map.put("m_pw", m_pw);
 
            result = ss.selectOne("mem.pwdCheck", map);
                //맞으면 1 리턴
            if (result > 0)
                return true;
        } catch (Exception e) {
 
            e.printStackTrace();
        }
 
        return false;
    }



	
	
	
	
	
}

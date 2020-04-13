package mybatis.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.BbsVO;
import com.data.vo.MemberVO;

public class MemDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	
	// 회원 페이징
	public MemberVO[] getList(int begin, int end) {
		MemberVO[] ar = null;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		List<BbsVO> list = ss.selectList("mem.memlist", map);

		if(list.size() > 0) {
			ar = new MemberVO[list.size()];
			ar = list.toArray(ar);
		}
		return ar;
	}

	// 회원수
	public int getTotalCount() { return ss.selectOne("mem.totalCount"); }
	
	// 회원 검색
	public MemberVO get_mem(String m_idx) { return ss.selectOne("mem.get_mem", m_idx);  }
	
	//아이디 찾기
	public String findID(String m_name, String m_phone){
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("m_name", m_name);
		map.put("m_phone", m_phone);
		
		String m_id = ss.selectOne("mem.find_id", map);
				
		return m_id;
	}	
	
	//비밀번호 찾기
	public String findPW(String m_id, String question, String answer){
		System.out.println(m_id + " " + question + " " + answer);
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("question", question);
		map.put("answer", answer);
		
		String m_pw = ss.selectOne("mem.find_pw", map);
		
		return m_pw;
	}
	
	// 회원 목록
	public MemberVO[] mem_list() {
		MemberVO[] ar = null;
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = ss.selectList("mem.mem_list");
		if(list.size() > 0) {
			ar = new MemberVO[list.size()];
			ar = list.toArray(ar);
		}
		
		return ar;
	}
	
	// 권한 수정
	public boolean mem_change(MemberVO vo) {
		boolean chk = false;
		
		int i = ss.update("mem.mem_change", vo);
		if(i > 0) {
			chk = true;
		}
		
		return chk;
	}
	
   //아이디 중복 체크
   public MemberVO idchk(String id) {
      
      MemberVO vo = ss.selectOne("mem.idchk", id);
            
      return vo;
   }
   
   //전화번호 중복 체크
   public MemberVO telchk(String phone) {
      
      MemberVO vo = ss.selectOne("mem.telchk", phone);
            
      return vo;
   }
	
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
		//System.out.println("DAO:"+m_pw+m_id);
		
		Map<String, String>map = new HashMap<String, String>();	
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		MemberVO vo = ss.selectOne("mem.login", map);
		
		return vo;
	}
	



	
	
	
	
	
}

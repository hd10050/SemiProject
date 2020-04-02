package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.BbsVO;

public class BbsDAO {
	@Autowired
	private SqlSessionTemplate ss;
	
	public int getTotalCount(int reqnum) {
		int cnt = ss.selectOne("bbs.totalCount", reqnum);
		return cnt;
	}
	
	// View DAO
	public BbsVO view(String b_idx) {
		BbsVO vo = ss.selectOne("bbs.view",b_idx);
		return vo;
		
	}
	
	public BbsVO[] getList(int begin, int end, String reqnum) {
		BbsVO[] ar = null;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("reqnum", Integer.parseInt(reqnum));
		List<BbsVO> list = ss.selectList("bbs.bbslist", map);

		if(list.size() > 0) {
			ar = new BbsVO[list.size()];
			ar = list.toArray(ar);
		}
		return ar;
	}
	
	// 조회수
	public void hit(String b_idx) {
		int cnt = ss.update("bbs.hit",b_idx);
	}
	
	public void add(BbsVO vo) {
		int cnt = ss.insert("bbs.addBbs", vo);
	}
	
	// 글삭제
	public boolean delBbs(String b_idx) {
		boolean value = false;
		
		int cnt = ss.update("bbs.del",b_idx);
		
		if(cnt>0) {
			value = true;
		}
		return value;
	}
	
	// 댓글 저장
		public boolean c_add(String writer, String content, String pwd, String ip, String b_idx, String r_idx) {
			boolean chk = false;
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("writer", writer);
			map.put("content", content);
			map.put("pwd", pwd);
			map.put("ip", ip);
			map.put("b_idx", b_idx);
			map.put("r_idx", r_idx);
			map.put("status","0");
			int i = ss.insert("bbs.c_add", map);
			if(i > 0) {
				chk = true;
			}
			
			return chk;
		}
	
		
	// 게시물 수정
		public void viewEdit(Map<String,String> map) {
			int i = ss.update("bbs.viewUpdate", map);
		}
		
	// 댓글 삭제 
		public boolean c_del(String c_idx,String pwd) {
			boolean chk = false;
			Map<String, String>map = new HashMap<String, String>();
			
			map.put("c_idx",c_idx);
			map.put("pwd",pwd);
			
			int cnt = ss.update("bbs.c_del", map);
			
			if(cnt>0) {
				chk = true;
			}
			
			return chk;
		}
	
}







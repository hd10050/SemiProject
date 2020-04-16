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

	// 게시물 수정
	public boolean viewEdit(BbsVO vo) {
		boolean chk = false;
		int i = ss.update("bbs.b_edit", vo);
		if(i > 0) {
			chk = true;
		}
		return chk;
	}
	
	// *********************************************************
	
	public int getAd_totalCount(String m_idx) {
		int cnt = ss.selectOne("admin_bbs.totalCount", m_idx);
		return cnt;
	}

	public BbsVO[] getAd_list(int begin, int end, String m_idx) {
		BbsVO[] ar = null;

		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("m_idx", m_idx);
		List<BbsVO> list = ss.selectList("admin_bbs.bbslist", map);

		if(list.size() > 0) {
			ar = new BbsVO[list.size()];
			ar = list.toArray(ar);
		}
		return ar;
	}

}







package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.AdVO;

public class AdDAO {
	@Autowired
	private SqlSessionTemplate ss;

	public int getTotalCount() {
		int cnt = ss.selectOne("admin_ad.adtotalCount");
		return cnt;
	}

	public AdVO[] getList(int begin, int end) {
		AdVO[] ar = null;

		Map<String, Integer> map = new HashMap<String, Integer>();	
		map.put("begin", begin);
		map.put("end", end);
		List<AdVO> list = ss.selectList("admin_ad.getadlist", map);

		if(list.size() > 0) {
			ar = new AdVO[list.size()];
			ar = list.toArray(ar);
		}
		return ar;
	}
	
	public AdVO[] totalList() {
		AdVO[] ar = null;
		
		List<AdVO> list = ss.selectList("admin_ad.totalList");
		
		if(list.size() > 0) {
			ar = new AdVO[list.size()];
			ar = list.toArray(ar);
		}
		return ar;
	}
	
	public AdVO getAd(String location) {
		AdVO[] ar = null;
		
		AdVO vo = ss.selectOne("admin_ad.getAd", location);
		
		return vo;
	}
	
	public void add(AdVO vo) {
		int cnt = ss.insert("admin_ad.add", vo);
	}
	
	public boolean updateAd(AdVO vo) {
		boolean value = false;

		int cnt = ss.update("admin_ad.updateAd",vo);

		if(cnt>0) {
			value = true;
		}
		return value;
	}
	
	/*
	public AdVO view(String b_idx) {
		AdVO vo = ss.selectOne("admin_ad.view",b_idx);
		return vo;
	}

	


	// 게시물 수정
	public boolean viewEdit(BbsVO vo) {
		boolean chk = false;
		int i = ss.update("admin_ad.b_edit", vo);
		if(i > 0) {
			chk = true;
		}
		return chk;
	}
	*/
	
}

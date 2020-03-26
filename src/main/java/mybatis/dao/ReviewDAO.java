package mybatis.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.ReviewVO;

public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate ss;
	
	//댓글 조회
	public ReviewVO getReview(String r_idx) {
		ReviewVO vo = ss.selectOne("getReview", r_idx);
		
		return vo;
	}
	
	//댓글 리스트
	public ReviewVO[] listReview(String b_idx) {
		ReviewVO[] ar = null;
		
		List<ReviewVO> list = ss.selectList("review.listReview", b_idx);
		
		if(list.size() > 0) {
			ar = new ReviewVO[list.size()];
			ar = list.toArray(ar);
		}
		
		return ar;
	}
	
	//댓글 쓰기
	public boolean writeReview(ReviewVO rvo) {
		boolean chk = false;
		
		System.out.println("getM_idx=" + rvo.getM_idx());
		System.out.println("getB_idx=" + rvo.getB_idx());
		System.out.println("getR_score=" + rvo.getR_score());
		System.out.println("getR_content=" + rvo.getR_content());
		
		int cnt = ss.insert("review.writeReview", rvo);
		if(cnt > 0) {
			chk = true;
		}
		return chk;
	}
	
	
	//댓글 수정
	public boolean updateReview(ReviewVO vo) {
		boolean chk = false;
		int cnt = ss.update("review.updateReview", vo);
		
		if(cnt > 0) {
			chk = true;
		}
		return chk;
	}
	
	
	//댓글 삭제
	public boolean delReview(String r_idx) {
		boolean chk = false;
		int cnt = ss.update("review.delReview", r_idx);
		
		if(cnt >0) {
			chk= true;
		}
		
		return chk;
	}
	
	
}

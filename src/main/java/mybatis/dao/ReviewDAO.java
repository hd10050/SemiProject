package mybatis.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.data.vo.ReviewVO;

public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate ss;
	
	
	//댓글 쓰기
	public boolean writeReview(ReviewVO vo) {
		boolean chk = false;
		int cnt = ss.update("review.writeReview",vo);
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

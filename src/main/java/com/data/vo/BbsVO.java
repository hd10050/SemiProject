package com.data.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BbsVO {
	private String type, b_idx, m_idx, subject, writer, content, file_name, ori_name, write_date, hit, status;
	private List<ReviewVO> r_list;
	private MemberVO mvo;
	
	// parameter로 받을 변수
	private int nowPage;
	private MultipartFile file; 

	// constructor --------------------------------------------------------------------------------
	public BbsVO() { }
	public BbsVO(String type, String b_idx, String m_idx, String subject, String writer, String content,
			String file_name, String ori_name, String write_date, String hit, String status, List<ReviewVO> r_list,
			MemberVO mvo, int nowPage, MultipartFile file) {
		this.type = type;
		this.b_idx = b_idx;
		this.m_idx = m_idx;
		this.subject = subject;
		this.writer = writer;
		this.content = content;
		this.file_name = file_name;
		this.ori_name = ori_name;
		this.write_date = write_date;
		this.hit = hit;
		this.status = status;
		this.r_list = r_list;
		this.mvo = mvo;
		this.nowPage = nowPage;
		this.file = file;
	}

	// getter setter ------------------------------------------------------------------------------
	public String getB_idx() { return b_idx; }
	public void setB_idx(String b_idx) { this.b_idx = b_idx; }
	public String getSubject() { return subject; }
	public void setSubject(String subject) { this.subject = subject; }
	public String getWriter() { return writer; }
	public void setWriter(String writer) { this.writer = writer; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	public String getFile_name() { return file_name; }
	public void setFile_name(String file_name) { this.file_name = file_name; }
	public String getOri_name() { return ori_name; }
	public void setOri_name(String ori_name) { this.ori_name = ori_name; }
	public String getWrite_date() { return write_date; }
	public void setWrite_date(String write_date) { this.write_date = write_date; }
	public String getHit() { return hit; }
	public void setHit(String hit) { this.hit = hit; }
	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }
	public String getType() { return type; }
	public void setType(String type) { this.type = type; }
	public List<ReviewVO> getR_list() { return r_list; }
	public void setR_list(List<ReviewVO> r_list) { this.r_list = r_list; }
	public MemberVO getMvo() { return mvo; }
	public void setMvo(MemberVO mvo) { this.mvo = mvo; }
	public int getNowPage() { return nowPage; }
	public void setNowPage(int nowPage) { this.nowPage = nowPage; }
	public MultipartFile getFile() { return file; }
	public void setFile(MultipartFile file) { this.file = file; }
	public String getM_idx() { return m_idx; }
	public void setM_idx(String m_idx) { this.m_idx = m_idx; }
	
}

package com.data.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AdVO {
	private String idx, title, company, content, write_date, end_date, stauts;
	
	// parameter로 받을 변수
	private int nowPage;
	private MultipartFile file;
	
	// constructor --------------------------------------------------------------------------------
	public AdVO() { }
	public AdVO(String idx, String title, String company, String content, String write_date, String end_date,
			String stauts, int nowPage, MultipartFile file) {
		super();
		this.idx = idx;
		this.title = title;
		this.company = company;
		this.content = content;
		this.write_date = write_date;
		this.end_date = end_date;
		this.stauts = stauts;
		this.nowPage = nowPage;
		this.file = file;
	}
	
	// getter setter ------------------------------------------------------------------------------
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getStauts() {
		return stauts;
	}
	public void setStauts(String stauts) {
		this.stauts = stauts;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	} 
	
}

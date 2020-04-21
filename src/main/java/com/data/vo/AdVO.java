package com.data.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AdVO {
	private String idx, title, company, content, start_date, end_date, stauts, link, location;
	
	// parameter로 받을 변수
	private int nowPage;
	private MultipartFile file;
	
	// constructor --------------------------------------------------------------------------------
	public AdVO() { }
	public AdVO(String idx, String title, String company, String content, String write_date, String end_date,
			String stauts, String link, String location, int nowPage, MultipartFile file) {
		this.idx = idx;
		this.title = title;
		this.company = company;
		this.content = content;
		this.start_date = write_date;
		this.end_date = end_date;
		this.stauts = stauts;
		this.link = link;
		this.location = location;
		this.nowPage = nowPage;
		this.file = file;
	}

	// getter setter ------------------------------------------------------------------------------
	public String getIdx() { return idx; }
	public void setIdx(String idx) { this.idx = idx; }
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	public String getCompany() { return company; }
	public void setCompany(String company) { this.company = company; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	public String getWrite_date() { return start_date; }
	public void setWrite_date(String write_date) { this.start_date = write_date; }
	public String getEnd_date() { return end_date; }
	public void setEnd_date(String end_date) { this.end_date = end_date; }
	public String getStauts() { return stauts; }
	public void setStauts(String stauts) { this.stauts = stauts; }
	public int getNowPage() { return nowPage; }
	public void setNowPage(int nowPage) { this.nowPage = nowPage; }
	public MultipartFile getFile() { return file; }
	public void setFile(MultipartFile file) { this.file = file; }
	public String getLink() { return link; }
	public void setLink(String link) { this.link = link; }
	public String getLocation() { return location; }
	public void setLocation(String location) { this.location = location; } 
	
}

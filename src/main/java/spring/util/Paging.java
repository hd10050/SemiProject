package spring.util;

public class Paging {

	private int nowPage,
				rowTotal,	// 총 게시물 수
				blockList,	// 한 페이지에 표현될 게시물 수
				blockPage,	// 한 블럭당 표현할 페이지 수
				totalPage, startPage, endPage,
				begin, end;
	private boolean isPrePage, isNextPage;
	private StringBuffer sb;
	private String type;
	
	// Constructor ------------------------------------------------------------------------
	public Paging(int nowPage, int rowTotal, int blockList, int blockPage, String type) {
		this.nowPage = nowPage;
		this.rowTotal = rowTotal;
		this.blockList = blockList;
		this.blockPage = blockPage;
		this.isPrePage = false;
		this.isNextPage = false;
		this.type = type;
		
		makeHTML();
	}
	
	// Getter Setter -----------------------------------------------------------------------
	public int getNowPage() { return nowPage; }
	public String getType() { return type; }
	public void setType(String type) { this.type = type; }
	public void setNowPage(int nowPage) { this.nowPage = nowPage; }
	public int getRowTotal() { return rowTotal; }
	public void setRowTotal(int rowTotal) { 	this.rowTotal = rowTotal; }
	public int getBlockList() { return blockList; }
	public void setBlockList(int blockList) { this.blockList = blockList; }
	public int getBlockPage() { return blockPage; }
	public void setBlockPage(int blockPage) { this.blockPage = blockPage; }
	public int getTotalPage() { return totalPage; }
	public void setTotalPage(int totalPage) { this.totalPage = totalPage; }
	public int getStartPage() { return startPage; }
	public void setStartPage(int startPage) { this.startPage = startPage; }
	public int getEndPage() { return endPage; }
	public void setEndPage(int endPage) { this.endPage = endPage; }
	public int getBegin() { return begin; }
	public void setBegin(int begin) { this.begin = begin; }
	public int getEnd() { return end; }
	public void setEnd(int end) { this.end = end; }
	public boolean isPrePage() { return isPrePage; }
	public void setPrePage(boolean isPrePage) { this.isPrePage = isPrePage; }
	public boolean isNextPage() { return isNextPage; }
	public void setNextPage(boolean isNextPage) { this.isNextPage = isNextPage; }
	public StringBuffer getSb() { return sb; }
	public void setSb(StringBuffer sb) { this.sb = sb; }

	// Method ------------------------------------------------------------------------------
	public void makeHTML() {
		// 총 게시물 수를 통해 페이지 수를 구한다
		this.totalPage = (int)Math.ceil((double)rowTotal/blockList);

		if(nowPage > totalPage) { this.nowPage = totalPage; }

		// 현재 블럭의 시작페이지 값과 마지막 페이지 값
		this.startPage = ((int)((nowPage-1)/blockPage)*blockPage) + 1 ;
		this.endPage = this.startPage + blockPage - 1;
		if(endPage > totalPage) { this.endPage = this.totalPage; }

		// 현재 페이지의 시작 게시물의 행번호, 마지막 게시물의 행번호 지정
		this.begin = (nowPage - 1)*blockList + 1;
		this.end = this.begin + blockList - 1;

		// 이전, 다음 기능 활성화/비활성화
		if(this.startPage > 1) { this.isPrePage = true; }
		if(this.endPage < this.totalPage ) { this.isNextPage = true; }

		// 페이지 기법에 사용할 코드 StringBuffer에 저장 ---------------------------
		this.sb = new StringBuffer("");

		if(this.isPrePage) {
			if(this.type.equals("4") || this.type.equals("5")) {
				sb.append("<li><a href='bbs.inc?nowPage=");
			} else {
				sb.append("<li><a href='reviewBbs.inc?nowPage=");
			}
			if (this.nowPage - this.blockPage < 1) {
				sb.append("1");
			} else {
				sb.append(this.nowPage - this.blockPage);
			}
			sb.append("&s_type=" + this.type + "'>&lt;</a></li>");
		} else { 
			if(this.type.equals("4") || this.type.equals("5")) {
				sb.append("<li><a href='bbs.inc?nowPage=" + 1 + "&s_type=" + this.type + "'>&lt;</a></li>");
			} else {
				sb.append("<li><a href='reviewBbs.inc?nowPage=" + 1 + "&s_type=" + this.type + "'>&lt;</a></li>");
			}
		}

		for(int i = this.startPage ; i <= endPage ; i++) {
			if(i == this.nowPage) {
				sb.append("<li class='now'><a href='#'>");
				sb.append(i);
				sb.append("</a></li>");
			} else {
				if(this.type.equals("4") || this.type.equals("5")) {
					sb.append("<li><a href='bbs.inc?nowPage=");
				} else {
					sb.append("<li><a href='reviewBbs.inc?nowPage=");
				}
				sb.append(i);
				sb.append("&s_type=" + this.type + "'>");
				sb.append(i);
				sb.append("</a></li>");
			}
		}

		if(this.isNextPage) {
			if(this.type.equals("4") || this.type.equals("5")) {
				sb.append("<li><a href='bbs.inc?nowPage=");
			} else {
				sb.append("<li><a href='reviewBbs.inc?nowPage=");
			}
			if(this.nowPage + this.blockPage > this.totalPage) {
				sb.append(this.totalPage);
			} else {
				sb.append(this.nowPage + this.blockPage);
			}
			
			sb.append("&s_type=" + this.type + "'>&gt;</a></li>");
		} else { 
			if(this.type.equals("4") || this.type.equals("5")) {
				sb.append("<li><a href='bbs.inc?nowPage=" + this.totalPage + "&s_type=" + this.type + "'>&gt;</a></li>");
			} else {
				sb.append("<li><a href='reviewBbs.inc?nowPage=" + this.totalPage + "&s_type=" + this.type + "'>&gt;</a></li>");
			}
		}

	}

}

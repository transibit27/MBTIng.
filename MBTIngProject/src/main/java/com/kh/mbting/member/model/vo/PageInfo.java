package com.kh.mbting.member.model.vo;

public class PageInfo {
	private int listCount;    //현재 총 게시글의 갯수  							ex)		게시글의 총 갯수는 100개
	private int currentPage;  //현재 페이지									ex)		현재 페이지는 1페이지
	private int pageLimit;    //페이지 하단에 보여질 페이징 바의 페이지 최대 갯수		ex)		페이징바 1 2 3 4 5 6 7 8 9 10 이라면 pageLimit 는 10입니당. 
	private int boardLimit;   //한 페이지에 보여질 게시글의 최대 갯수 				ex)		한 페이지에 게시글이 20개씩 보일 거라면 boardLimit 값은 20 
	private int maxPage;      //가장 마지막 페이지가 몇 번 페이지인지 (즉, 페이지 수)	ex)		총 게시물 갯수가 100이고 한 페이지에 20개씩 보이니까 페이지 수는 5가 나옴. 
	private int startPage;    //페이지 하단에 보여질 페이징바의 시작수				ex)		페이징 바의 시작 수는 1
	private int endPage;	  //페이지 하단에 보여질 페이징바의 끝수  				ex)		페이징 바의 끝 수는 10
	
	public PageInfo() {};
	
	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageLimit() {
		return pageLimit;
	}
	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}
	public int getBoardLimit() {
		return boardLimit;
	}
	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}


}

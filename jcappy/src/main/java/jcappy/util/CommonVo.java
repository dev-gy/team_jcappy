package jcappy.util;

public class CommonVo {
	private int pageRow;		// 페이지당 개수
	private int startIdx;		// 시작인덱스
	private int reqPage;		// 사용자가 요청한 페이지
	private int totCount;		// 총개수
	private int totPage;		// 총페이지수
	private int pageRange;		// 하단페이지 범위
	private int startPage;		// 시작페이지
	private int endPage;		// 끝페이지
	private String stype;		// 검색타입(전체,제목,내용)
	private String sval;		// 검색어
	private String orderby;		// 정렬컬럼
	private String direct;		// 오름차순/내림차순
	private String ftype;		// 필터타입(컬럼명)
	private String fval;		// 필터기준(대상 컬럼의 특정 값)
	
	public CommonVo() {
		this.pageRow = 10;
		this.reqPage = 1;
		this.pageRange = 10;
		this.orderby = "regdate";
		this.direct = "DESC";
	}
	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		if (!"".equals(orderby)) this.orderby = orderby;
	}

	public String getDirect() {
		return direct;
	}

	public void setDirect(String direct) {
		if (!"".equals(direct)) this.direct = direct;
	}

	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	public String getSval() {
		return sval;
	}

	public void setSval(String sval) {
		this.sval = sval;
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

	public int getPageRange() {
		return pageRange;
	}

	public void setPageRange(int pageRange) {
		this.pageRange = pageRange;
	}

	public int getTotCount() {
		return totCount;
	}

	public void setTotCount(int totCount) {
		this.totCount = totCount;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getReqPage() {
		return reqPage;
	}

	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}

	public int getStartIdx() {
		//return startIdx;
		return (getReqPage()-1)*getPageRow();
	}

	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}

	public int getPageRow() {
		return pageRow;
	}

	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}
	
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public String getFval() {
		return fval;
	}
	public void setFval(String fval) {
		this.fval = fval;
	}
}

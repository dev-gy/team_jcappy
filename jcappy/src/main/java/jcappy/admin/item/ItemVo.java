package jcappy.admin.item;

import java.sql.Timestamp;

public class ItemVo {

	private	int ino;
	private String iimg1;
	private String iimg2;
	private String iimg3;
	private int iprice;
	private String iname;
	private String icompany;
	private int icount;
	private String itype;
	private String icate;
	private Timestamp iregdate;
	private String idetailimg;
	
	private int pageRow;	// 페이지당 개수
	private int startIdx;	// 시작인덱스
	private int reqPage;	// 사용자가 요청한 페이지
	private int totCount;	// 총 개수
	private int totPage;	// 총 페이지수
	private int pageRange;	// 하단페이지 범위
	private int startPage;	// 시작페이지
	private int endPage;	// 끝페이지
	private String stype;	// 검색 타입 (전체, 제목, 내용)
	private String sval;	// 검색어 
	private String orderby;	// 정렬컬럼
	private String direct;	// 오름차순 / 내림차순
	
	public ItemVo() { // 초기화 (값을 바꾸지 않으면 설정한 값으로 나옴)
		this.pageRow = 5;
		this.reqPage = 1;
		this.pageRange = 5;
		this.orderby = "regdate";
		this.direct = "desc";
	}
	
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public String getIimg1() {
		return iimg1;
	}
	public void setIimg1(String iimg1) {
		this.iimg1 = iimg1;
	}
	public String getIimg2() {
		return iimg2;
	}
	public void setIimg2(String iimg2) {
		this.iimg2 = iimg2;
	}
	public String getIimg3() {
		return iimg3;
	}
	public void setIimg3(String iimg3) {
		this.iimg3 = iimg3;
	}
	public int getIprice() {
		return iprice;
	}
	public void setIprice(int iprice) {
		this.iprice = iprice;
	}
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public String getIcompany() {
		return icompany;
	}
	public void setIcompany(String icompany) {
		this.icompany = icompany;
	}
	public int getIcount() {
		return icount;
	}
	public void setIcount(int icount) {
		this.icount = icount;
	}
	public String getItype() {
		return itype;
	}
	public void setItype(String itype) {
		this.itype = itype;
	}
	public String getIcate() {
		return icate;
	}
	public void setIcate(String icate) {
		this.icate = icate;
	}
	public Timestamp getIregdate() {
		return iregdate;
	}
	public void setIregdate(Timestamp iregdate) {
		this.iregdate = iregdate;
	}
	public String getIdetailimg() {
		return idetailimg;
	}
	public void setIdetailimg(String idetailimg) {
		this.idetailimg = idetailimg;
	}
	
	public int getPageRow() {
		return pageRow;
	}

	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}

	public int getStartIdx() {
		return startIdx;
	}

	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}

	public int getReqPage() {
		return reqPage;
	}

	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
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

	public int getPageRange() {
		return pageRange;
	}

	public void setPageRange(int pageRange) {
		this.pageRange = pageRange;
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

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public String getDirect() {
		return direct;
	}

	public void setDirect(String direct) {
		this.direct = direct;
	}

}

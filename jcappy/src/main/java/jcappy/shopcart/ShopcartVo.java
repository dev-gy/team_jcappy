package jcappy.shopcart;

public class ShopcartVo {
	private int mno;
	private int sno;
	private int pno;
	private int scount;
	
	private String pname;
	private String pimg1_org;
	private int pprice;
	private int pdelprice;
	private int total_price;

	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getScount() {
		return scount;
	}
	
	public void setScount(int scount) {
		this.scount = scount;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPimg1_org() {
		return pimg1_org;
	}
	public void setPimg1_org(String pimg1_org) {
		this.pimg1_org = pimg1_org;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPdelprice() {
		return pdelprice;
	}
	public void setPdelprice(int pdelprice) {
		this.pdelprice = pdelprice;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	
}

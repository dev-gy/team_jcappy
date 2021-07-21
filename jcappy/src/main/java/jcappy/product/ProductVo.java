package jcappy.product;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class ProductVo extends CommonVo {

	private	int pno;
	private String pimg1;
	private String pimg2;
	private String pimg3;
	private int pprice;
	private String pname;
	private String pcompany;
	private int pcount;
	private String ptype;
	private String pcate;
	private Timestamp pregdate;
	private String pdetail;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPimg1() {
		return pimg1;
	}
	public void setPimg1(String pimg1) {
		this.pimg1 = pimg1;
	}
	public String getPimg2() {
		return pimg2;
	}
	public void setPimg2(String pimg2) {
		this.pimg2 = pimg2;
	}
	public String getPimg3() {
		return pimg3;
	}
	public void setPimg3(String pimg3) {
		this.pimg3 = pimg3;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcompany() {
		return pcompany;
	}
	public void setPcompany(String pcompany) {
		this.pcompany = pcompany;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPcate() {
		return pcate;
	}
	public void setPcate(String pcate) {
		this.pcate = pcate;
	}
	public Timestamp getPregdate() {
		return pregdate;
	}
	public void setPregdate(Timestamp pregdate) {
		this.pregdate = pregdate;
	}
	public String getPdetail() {
		return pdetail;
	}
	public void setPdetail(String pdetail) {
		this.pdetail = pdetail;
	}
	
	

}

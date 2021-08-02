package jcappy.product;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class ProductVo extends CommonVo {

	private int pno;
	private String pimg1_org;
	private String pimg1_real;
	private String pimg2_org;
	private String pimg2_real;
	private String pimg3_org;
	private String pimg3_real;
	private int pprice;
	private String pname;
	private String pcompany;
	private int pcount;
	private String ptype;
	private String pcate;
	private Timestamp pregdate;
	private String pdetail;
	
	private int pdelprice;
	
	private String tval;
	private String cval;
	
	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPimg1_org() {
		return pimg1_org;
	}

	public void setPimg1_org(String pimg1_org) {
		this.pimg1_org = pimg1_org;
	}

	public String getPimg1_real() {
		return pimg1_real;
	}

	public void setPimg1_real(String pimg1_real) {
		this.pimg1_real = pimg1_real;
	}

	public String getPimg2_org() {
		return pimg2_org;
	}

	public void setPimg2_org(String pimg2_org) {
		this.pimg2_org = pimg2_org;
	}

	public String getPimg2_real() {
		return pimg2_real;
	}

	public void setPimg2_real(String pimg2_real) {
		this.pimg2_real = pimg2_real;
	}

	public String getPimg3_org() {
		return pimg3_org;
	}

	public void setPimg3_org(String pimg3_org) {
		this.pimg3_org = pimg3_org;
	}

	public String getPimg3_real() {
		return pimg3_real;
	}

	public void setPimg3_real(String pimg3_real) {
		this.pimg3_real = pimg3_real;
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
	
	public int getPdelprice() {
		return pdelprice;
	}

	public void setPdelprice(int pdelprice) {
		this.pdelprice = pdelprice;
	}

	public String getTval() {
		return tval;
	}
	public void setTval(String tval) {
		this.tval = tval;
	}
	public String getCval() {
		return cval;
	}
	public void setCval(String cval) {
		this.cval = cval;
	}

}

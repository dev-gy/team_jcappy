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
}

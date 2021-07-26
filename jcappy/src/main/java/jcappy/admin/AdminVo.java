package jcappy.admin;

import java.sql.Timestamp;

import jcappy.util.CommonVo;

public class AdminVo extends CommonVo {

	private int ano;
	private String aid;
	private String apwd;
	private String aname;
	private Timestamp aregdate;
	private String auth;

	private int[] anos; // ano의 배열을 담아와서 일괄 삭제를 처리하기위한 필드
	private String[] auths; // 관리자계정 생성, 수정시 권한 체크박스에 체크한 값들을 가져오기위한 필드

	private String[] authList; // DB에서 가져온 auth를 배열로 바꾸기위한 필드

	AdminVo() {
		super.setOrderby("aregdate");
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getApwd() {
		return apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public Timestamp getAregdate() {
		return aregdate;
	}

	public void setAregdate(Timestamp aregdate) {
		this.aregdate = aregdate;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public int[] getAnos() {
		return anos;
	}

	public void setAnos(int[] anos) {
		this.anos = anos;
	}

	public String[] getAuths() {
		return auths;
	}

	public void setAuths(String[] auths) {
		this.auths = auths;
	}

	public String[] getAuthList() {
		return authList;
	}

	public void setAuthList(String[] authList) {
		this.authList = authList;
	}
}

//	private int admin_product;
//	private int admin_order;
//	private int admin_members;
//	private int admin_board;
//	private int admin_add;
//	private int admin_account;
//	private int admin_auth;
//	public int getAdmin_product() {return admin_product;}
//	public void setAdmin_product(int admin_product) {this.admin_product = admin_product;}
//	public int getAdmin_order() {return admin_order;}
//	public void setAdmin_order(int admin_order) {this.admin_order = admin_order;}
//	public int getAdmin_members() {return admin_members;}
//	public void setAdmin_members(int admin_members) {this.admin_members = admin_members;}
//	public int getAdmin_board() {return admin_board;}
//	public void setAdmin_board(int admin_board) {this.admin_board = admin_board;}
//	public int getAdmin_add() {return admin_add;}
//	public void setAdmin_add(int admin_add) {this.admin_add = admin_add;}
//	public int getAdmin_account() {return admin_account;}
//	public void setAdmin_account(int admin_account) {this.admin_account = admin_account;}
//	public int getAdmin_auth() {return admin_auth;}
//	public void setAdmin_auth(int admin_auth) {this.admin_auth = admin_auth;}
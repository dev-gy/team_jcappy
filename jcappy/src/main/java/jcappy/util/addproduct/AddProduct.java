package jcappy.util.addproduct;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class AddProduct {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	AddProduct() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/jcappy", "jcappy", "j1234");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
		}
	}

	public int insert(ProductVo vo) {

		int result = 0;

		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO product (pimg1_org, pimg1_real, pimg2_org, pimg2_real, pimg3_org, pimg3_real, pprice, pname, pcompany, pcount, ptype, pcate, pregdate)"
							+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 50, ?, ?, NOW())");

			int pstmtInt = 0;
			pstmt.setString(++pstmtInt, vo.getPimg1_org());
			pstmt.setString(++pstmtInt, vo.getPimg1_real());
			pstmt.setString(++pstmtInt, vo.getPimg2_org());
			pstmt.setString(++pstmtInt, vo.getPimg2_real());
			pstmt.setString(++pstmtInt, vo.getPimg3_org());
			pstmt.setString(++pstmtInt, vo.getPimg3_real());
			pstmt.setInt(++pstmtInt, vo.getPprice());
			pstmt.setString(++pstmtInt, vo.getPname());
			pstmt.setString(++pstmtInt, vo.getPcompany());
			pstmt.setString(++pstmtInt, vo.getPtype());
			pstmt.setString(++pstmtInt, vo.getPcate());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public static void main(String[] args) {

		AddProduct ai = new AddProduct();
		ProductVo vo;

		String clientId = "6V_W6Ret29dbLdBxbya1"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "hIC86Y8ANh"; // 애플리케이션 클라이언트 시크릿값"

		String[] searchArr = { "일반형냉장고", "양문형냉장고", "업소용냉장고", "벽걸이형에어컨", "스탠드형에어컨", "창문형에어컨", "일반세탁기", "드럼세탁기", "미니세탁기",
				"LEDTV", "OLEDTV", "QLEDTV" };

		String[] searchCompany = {"삼성전자", "LG전자", "캐리어", "위니아전자"};
		
		String text = null;
		String apiURL = null;
		String line = null;

		for (int k = 0; k < 3; k++) {
			for (int i = 0; i < searchArr.length; i++) {

				int count = 20; // 상세타입 별 등록할 아이템 갯수
				int start = k * (count * 3) + 1; // 시작 인덱스

				try {
					text = URLEncoder.encode(searchArr[i], "UTF-8");
				} catch (UnsupportedEncodingException e) {
					throw new RuntimeException("검색어 인코딩 실패", e);
				}

				apiURL = "https://openapi.naver.com/v1/search/shop.json?start=" + start + "&display=" + (count * 3)
						+ "&query=" + text;

				try {
					URL url = new URL(apiURL);
					URLConnection urlCon = url.openConnection();
					urlCon.setRequestProperty("X-Naver-Client-Id", clientId);
					urlCon.setRequestProperty("X-Naver-Client-Secret", clientSecret);

					InputStream is = urlCon.getInputStream();
					BufferedReader br = new BufferedReader(new InputStreamReader(is));
					StringBuffer sb = new StringBuffer();
					line = "";

					while ((line = br.readLine()) != null) {
						sb.append(line);
					}

					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(sb.toString());
					JSONArray jArr = (JSONArray) obj.get("items");

					for (int j = 0; j < jArr.size(); j += 3) {
						JSONObject data = (JSONObject) jArr.get(j);

						if (!searchArr[i].equals((String) data.get("category4"))) {
							continue;
						}

						if ("".equals((String) data.get("maker"))) {
							continue;
						}

						boolean check = false;
						for (int l = 0; l < searchCompany.length; l++) {
							if (searchCompany[l].equals((String) data.get("maker"))) {
								check = true;
								break;
							}
						}
						
						if (check == false) {continue;}
						
						vo = new ProductVo();

						vo.setPname((String) data.get("title"));
						vo.setPtype((String) data.get("category3"));
						vo.setPcate((String) data.get("category4"));
						vo.setPcompany((String) data.get("maker"));
						vo.setPprice(Integer.parseInt((String) data.get("lprice")));
						vo.setPimg1_org((String) data.get("image"));
						vo.setPimg1_real((String) data.get("image"));

						data = (JSONObject) jArr.get(j + 1);
						vo.setPimg2_org((String) data.get("image"));
						vo.setPimg2_real((String) data.get("image"));
						data = (JSONObject) jArr.get(j + 2);
						vo.setPimg3_org((String) data.get("image"));
						vo.setPimg3_real((String) data.get("image"));
						
						ai.insert(vo);
					}
					System.out.println(searchArr[i] + " insert");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}

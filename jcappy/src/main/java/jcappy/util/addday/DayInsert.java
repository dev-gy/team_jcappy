package jcappy.util.addday;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DayInsert {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	DayInsert() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/jcappy", "jcappy", "j1234");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
		}
	}

	
	public static void main(String[] args) throws Exception{
		DayInsert di = new DayInsert();
		SimpleDateFormat dateFormat;
        dateFormat = new SimpleDateFormat("yyyyMMdd"); //년월 표시
        
        Calendar cal = Calendar.getInstance();
        
        
        cal.set ( 2021, 11, 31 ); //종료 날짜 셋팅
        String endDate = dateFormat.format(cal.getTime());
        
        cal.set ( 2018, 12, 1 ); //시작 날짜 셋팅
        String startDate = dateFormat.format(cal.getTime());  
        String year = "";
        String month = "";
        String day = "";
        
        while(!startDate.equals(endDate)){ //다르다면 실행, 동일 하다면 빠져나감
        	DayVo vo= new DayVo();
            
            startDate = dateFormat.format(cal.getTime()); //비교를 위한 값 셋팅
            
            year = startDate.substring(0,4);
            month = startDate.substring(4,6);
            day = startDate.substring(6,8);
            vo.setYear(year);
            vo.setMonth(month);
            vo.setDay(day);
            //+1달 출력
            System.out.println(year + month +day);
           
            di.insert(vo);
            cal.add(Calendar.DATE, 1); //1일 더해줌
        }
	}
	 
	public int insert(DayVo vo) {

		int result = 0;

		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO dates (year, month, day)"
							+ "VALUES (?, ?, ?)");

			int pstmtInt = 0;
			pstmt.setString(++pstmtInt, vo.getYear());
			pstmt.setString(++pstmtInt, vo.getMonth());
			pstmt.setString(++pstmtInt, vo.getDay());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
}
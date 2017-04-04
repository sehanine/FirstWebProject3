package web.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.230:1521:ORCL";
	//private static DataDAO dao;
	/**
	 * 쿼리문 템플릿
	  	try{
				getConnection();
				String sql = "INSERT QUERY";
				ps = conn.prepareStatement(sql);
				ps.setString(parameterIndex, x);
				ResultSet rs = ps.executeQuery();
				rs.next();
				//TODO
				ps.close();
		
			}catch(Exception ex){
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}finally{
				disConnection();
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	 */
	public MemberDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	}
	public void disConnection(){
		try{
			if(ps != null){
				ps.close();
			}
			if(conn != null){
				conn.close();
			}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	//오라클 연결
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL, "scott", "tiger");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	/**
	 * 
	 * @param id (비교하려는 값
	 * @param target 체크할 컬럼 밸류 (email, nickname)
	 * @return
	 */
	public int isValueExist(String id, String target){
		int count = 0;
		
		try{
			getConnection();
			String sql= "SELECT COUNT(*) FROM join_member "
				   +"WHERE " +target + "=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
			
		} catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally{
			disConnection();
		}
		System.out.println("count: " + count);
		return count;
	}
}
